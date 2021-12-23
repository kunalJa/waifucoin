// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

/**
 * @dev Contract implementing ERC20 creating WaifuCoin.
 * Features: ...
 */
contract WaifuCoin is IERC20, IERC20Metadata {
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
}
