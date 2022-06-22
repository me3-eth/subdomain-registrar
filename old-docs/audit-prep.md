# Audit prep checklist

[Reference](https://diligence.consensys.net/posts/2019/09/how-to-prepare-for-a-smart-contract-audit/)

- [ ] Documentation (A plain english description of what you are building, and why you are building it. Should indicate the actions and states that should and should not be possible)
 - [ ] For the overall system
 - [ ] For each unique contract within the system
- [ ] Clean code
 - [X] Run a linter (like [EthLint](https://www.ethlint.com/))
 - [ ] Fix compiler warnings
 - [ ] Remove TODO and FIXME comments
 - [ ] Delete unused code
- [ ] Testing
 - [ ] README gives clear instructions for running tests
 - [ ] Testing dependencies are packaged with the code OR are listed including versions
- [ ] Automated Analysis
 - [ ] Analysis with [MythX](https://mythx.io/)
 - [ ] [Other tools](https://consensys.github.io/smart-contract-best-practices/security_tools/)
- [ ] Frozen code
 - [ ] Halt development of the contract code
 - [ ] Provide commit hash for the audit to target
