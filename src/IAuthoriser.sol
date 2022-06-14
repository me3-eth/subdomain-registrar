pragma solidity >=0.8.10 < 0.9.0;

/// @title Authoriser interface
/// @author charchar.eth
/// @notice Defines the API which a valid Authorising contract must meet
/// @custom:docs-example iauthoriser.md
interface IAuthoriser {
    /// @notice Determine if a node can be registered by a sender
    /// @dev See example for authData packing
    /// @param node Fully qualified, namehashed ENS name
    /// @param sender Address of the user who is attempting to register
    /// @param authData Additional data used for authorising the request
    /// @return True if the sender can register, false otherwise
    /// @custom:docs-example authdata.md
    function canRegister(
        bytes32 node,
        address sender,
        bytes memory authData
    ) external view returns (bool);

    /// @notice Determine if a node can be edited by sender
    /// @dev See example for authData packing
    /// @param node Fully qualified, namehashed ENS name
    /// @param sender Address of the user who is attempting to register
    /// @param authData Additional data used for authorising the request
    /// @return True if the sender can edit, false otherwise
    /// @custom:docs-example authdata.md
    /*
    function canEdit(
        bytes32 node,
        address sender,
        bytes memory authData
    ) external view returns (bool);
   */
}
