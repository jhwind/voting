pragma solidity ^0.4.4;

contract Voting {
  // 存储候选人名字的数组
  bytes32[] public candidates;
  mapping (bytes32 => uint8) public votes;

  // 构造函数 初始化候选人名单
  constructor (bytes32[] candidateNames) public {
    candidates = candidateNames;
    for(uint i = 0; i < candidates.length; i++) {
      votes[candidates[i]] = 0;
    }
  }

  // 查询某个候选人的总票数
  function totalVotesFor(bytes32 candidate)  constant returns (uint8) {
    require(validCandidate(candidate) == true);
    return votes[candidate];
  }

  // 为某个候选人投票
  function voteForCandidate(bytes32 candidate)  constant returns (uint8) {
    if(validCandidate(candidate) == true) {
        votes[candidate] += 1;
        votes[candidate];
    }
  }

  // 检索投票的姓名是不是候选人的名字
  function validCandidate(bytes32 candidate) constant returns (bool) {
    for(uint i = 0; i < candidates.length; i++) {
      if (candidates[i] == candidate) {
        return true;
      }
    }
    return false;
  }
  // 获取获胜者在候选人数组的序列号
  function getWinnerId() constant returns (uint8) {
    uint8 nameId = 0;
    uint8 k = 0;
    for(uint8 i = 0; i < candidates.length; i++) {
      if (k <= votes[candidates[i]]) {
        nameId = i;
        k = votes[candidates[i]];
      }
    }
    return nameId;
  }
}