pragma solidity >=0.8.10 < 0.9.0;

interface IRulesEngine {
    function isLabelValid(string memory) external view returns (bool);
}
