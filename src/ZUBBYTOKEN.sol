pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ZUBBYTOKEN is ERC20 {
    // uint256 public constant INITIAL_SUPPLY = 1000 * 1 ether;
    uint256 public constant BURN_RATE = 10; // 10%
    address public constant BURN_ADDRESS = 0x611419E8768E45d1e25A6B7d3A51403e9BEfC599;
    constructor(string memory _name, string memory _symbol, uint256 _decimals) ERC20(_name, _symbol) {}

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function transfer(address sender, address recipient, uint256 amount) internal virtual { 
        uint256 burnAmount = (amount * BURN_RATE) / 100;
        uint256 sendAmount = amount - burnAmount;
        super._transfer(sender, recipient, sendAmount);
        super._transfer(sender, BURN_ADDRESS, burnAmount);
    }
}