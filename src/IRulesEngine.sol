pragma solidity >=0.8.10 <0.9.0;

/// @title Rules Engine Interface
/// @author charchar.eth
/// @notice Functions that a RulesEngine contract should support
interface IRulesEngine {
    /// @notice Determine if a label meets a projects minimum requirements
    /// @param node Fully qualified, namehashed ENS name
    /// @param label The 'best' in 'best.bob.eth'
    /// @return True if label is valid, false otherwise
    function isLabelValid(bytes32 node, string memory label) external view returns (bool);
}
