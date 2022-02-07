// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

/**
 * @dev Contract implementing ERC20 creating WaifuCoin.
 * Features: ...
 */
contract WaifuCoin is IERC20, IERC20Metadata {
    uint256 private supply; // potentially not needed if we keep a fixed supply
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) allowances;

    /**
     * @dev Optional name parameter for metadata.
     * Implemented as pure instead of view
     * to preserve storage.
     */
    function name() external pure returns (string memory) {
        return "WaifuCoin";
    }

    /**
     * @dev Optional symbol parameter for metadata.
     */
    function symbol() external pure returns (string memory) {
        return "WAIF";
    }

    /**
     * @dev Optional decimals parameter for metadata.
     * https://docs.openzeppelin.com/contracts/4.x/erc20
     */
    function decimals() external pure returns (uint8) {
        return 18;
    }

    function totalSupply() external view returns (uint256) {
        return supply;
    }

    function balanceOf(address _account) external view returns (uint256) {
        return balances[_account];
    }

    function _transfer(
        address _sender,
        address _recipient,
        uint256 _amount
    ) private {
        balances[_sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(_sender, _recipient, _amount);
    }

    function transfer(address _recipient, uint256 _amount)
        external
        returns (bool)
    {
        // EIP-20 requires the function 'throw' if the message caller's account balance does not have enough tokens to spend.
        require(balances[msg.sender] >= _amount);
        _transfer(msg.sender, _recipient, _amount);
        return true;
    }

    function approve(address _spender, uint256 _amount)
        external
        returns (bool)
    {
        allowances[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner, address _spender)
        external
        view
        returns (uint256)
    {
        return allowances[_owner][_spender];
    }

    /**
     * @dev https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/edit
     */
    function transferFrom(
        address _sender,
        address _recipient,
        uint256 _amount
    ) external returns (bool) {
        require(allowances[_sender][msg.sender] >= _amount);
        require(balances[_sender] >= _amount);
        _transfer(_sender, _recipient, _amount);
        allowances[_sender][msg.sender] -= _amount;
        return true;
    }
}
