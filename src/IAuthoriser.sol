pragma solidity 0.8.10;

interface IAuthoriser {
    function canRegister(
        bytes32 node,
        address sender,
        bytes memory blob
    ) external view returns (bool);
}

interface IRulesEngine {
    function isLabelValid(string memory) external view returns (bool);
}
