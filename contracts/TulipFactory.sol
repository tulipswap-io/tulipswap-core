// SPDX-License-Identifier: GPL-3.0

pragma solidity =0.6.12;

import './interfaces/ITulipFactory.sol';
import './TulipPair.sol';

contract TulipFactory is ITulipFactory {
    bytes32 public constant INIT_CODE_PAIR_HASH = keccak256(abi.encodePacked(type(TulipPair).creationCode));

    address public override feeTo;
    address public override feeToSetter;

    mapping(address => mapping(address => address)) public override getPair;
    address[] public override allPairs;

    event PairCreated(address indexed token0, address indexed token1, address pair, uint);
    event Event();

    constructor(address _feeToSetter) public {
        feeToSetter = _feeToSetter;
    }

    function allPairsLength() external override view returns (uint) {
        return allPairs.length;
    }

    function createPair(address tokenA, address tokenB) external override returns (address pair) {
        require(tokenA != tokenB, 'Tulip: IDENTICAL_ADDRESSES');
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'Tulip: ZERO_ADDRESS');
        require(getPair[token0][token1] == address(0), 'Tulip: PAIR_EXISTS'); // single check is sufficient
        
        TulipPair tulipPair = new TulipPair();
        TulipPair(tulipPair).initialize(token0,token1);

        getPair[token0][token1] = address(tulipPair);
        getPair[token1][token0] = address(tulipPair); // populate mapping in the reverse direction
        allPairs.push(address(tulipPair));
        emit PairCreated(token0, token1, address(tulipPair), allPairs.length);
    }

    function setFeeTo(address _feeTo) external override {
        require(msg.sender == feeToSetter, 'Tulip: FORBIDDEN');
        feeTo = _feeTo;
        emit Event();
    }

    function setFeeToSetter(address _feeToSetter) external override {
        require(msg.sender == feeToSetter, 'Tulip: FORBIDDEN');
        feeToSetter = _feeToSetter;
        emit Event();
    }
}
