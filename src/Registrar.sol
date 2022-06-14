pragma solidity 0.8.10;

import "ens-contracts/registry/ENS.sol";
import {Owned} from "solmate/auth/Owned.sol";

import {IAuthoriser} from "./IAuthoriser.sol";
import {IRulesEngine} from "./IRulesEngine.sol";
import {Utilities} from "./Utils.sol";

/// @title Subdomain Registrar Interface
/// @author charchar.eth
/// @notice Define the minimum methods needed for a subdomain registrar
interface IRegistrar {
    /// @notice Register a subdomain under node
    /// @param node The project node to use
    /// @param label The subdomain text, eg the 'hopeless' in hopeless.abc.eth
    /// @param owner Who will own the subdomain
    function register(
        bytes32 node,
        string memory label,
        address owner,
        bytes memory authData
    ) external;

    /// @notice Check if a label is valid for a project
    /// @param node The project node
    /// @param label The subdomain label to validate
    /// @return bool True if the label is valid, according to the project rules, false otherwise
    function valid(bytes32 node, string memory label)
        external
        view
        returns (bool);

    /// @notice Register a project as a subdomain provider
    /// @param node The fully qualified, namehashed ENS name
    /// @param authoriser The contract that will perform authorisation
    /// @param rules The contract that will provide rules and validation
    function addRootNode(
        bytes32 node,
        IAuthoriser authoriser,
        IRulesEngine rules
    ) external;
}

/// @title me3 Subdomain Registrar
/// @author charchar.eth
/// @notice Provides third-party projects with a common subdomain registration function
/// @dev 0.1.0
contract Registrar is IRegistrar, Owned(msg.sender) {
    ENS private ens;

    /// @notice Address of the default resolver used when registering a subdomain
    address public me3Resolver;

    /// @notice Lookup enabled/disabled state by project node
    mapping(bytes32 => bool) public nodeEnabled;

    /// @notice Lookup authoriser contract by project node
    mapping(bytes32 => IAuthoriser) public nodeAuthorisers;

    /// @notice Lookup rules contract by project node
    mapping(bytes32 => IRulesEngine) public nodeRules;

    /// @notice The default resolver has changed
    /// @param resolverAddr The new address of the resolver
    event Me3ResolverUpdated(address indexed resolverAddr);

    /// @notice A project has been enabled/disabled
    /// @param node The fully qualified, namehashed ENS name for the project
    /// @param enabled True if the project is now enabled, false if now disabled
    event ProjectStateChanged(bytes32 indexed node, bool enabled);

    /// @notice A subnode has been registered
    /// @param node The fully qualified, namehashed ENS name for the project
    /// @param label The registered label as keccack256
    /// @param owner The registered owner
    event SubnodeRegistered(
        bytes32 indexed node,
        bytes32 indexed label,
        address owner
    );

    modifier isAuthorised(
        bytes32 node,
        address user,
        bytes memory authData
    ) {
        IAuthoriser authoriser = nodeAuthorisers[node];

        require(authoriser.canRegister(node, user, authData), "User is not authorised");
        _;
    }

    modifier registeredNode(bytes32 node) {
        require(nodeEnabled[node], "Node is not enabled");
        _;
    }

    constructor(ENS _registry, address _resolver) {
        ens = _registry;
        me3Resolver = _resolver;
    }

    /// @notice Add a new project to the directory
    /// @param node The project node that subdomains will be based on
    /// @param _authoriser The authorisation contract
    /// @param _rules The rules around availability, validity, and usage
    function addRootNode(
        bytes32 node,
        IAuthoriser _authoriser,
        IRulesEngine _rules
    ) external onlyOwner {
        nodeAuthorisers[node] = _authoriser;
        nodeRules[node] = _rules;
        nodeEnabled[node] = true;
    }

    /// @notice Enable or disable a root node
    /// @param node The project node
    /// @param enabled True for enabled, false for disabled
    function setRootNodeState(bytes32 node, bool enabled) external onlyOwner {
        require(
          address(nodeAuthorisers[node]) != address(0x0)
            && address(nodeRules[node]) != address(0x0),
          "Project must be initialized");

        emit ProjectStateChanged(node, enabled);
        nodeEnabled[node] = enabled;
    }

    /// @notice Change the default resolver to a new contract
    /// @param newResolver Address of the new resolver contract
    function changeMe3Resolver(address newResolver) external onlyOwner {
        require(newResolver != address(0x0), "Resolver must be a real contract");

        me3Resolver = newResolver;
        emit Me3ResolverUpdated(newResolver);
    }

    /// @inheritdoc IRegistrar
    function register(
        bytes32 node,
        string memory label,
        address owner,
        bytes memory authData
    ) public registeredNode(node) isAuthorised(node, msg.sender, authData) {
        require(valid(node, label), "Check with project for valid subdomain");

        bytes32 hashedLabel = Utilities.labelhash(label);
        ens.setSubnodeRecord(node, hashedLabel, owner, me3Resolver, 86400);
        emit SubnodeRegistered(node, hashedLabel, owner);
    }

    /// @inheritdoc IRegistrar
    function valid(bytes32 node, string memory label)
        public
        view
        registeredNode(node)
        returns (bool)
    {
        return nodeRules[node].isLabelValid(label);
    }

    function available(bytes32 node, string memory label)
        internal
        view
        returns (bool)
    {
        return false;
    }
}
