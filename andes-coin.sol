// Andecoins ICO

// Version del compilador
pragma solidity ^0.8.7;

contract andescoin_ico{
    // Introduciendo el numero maximo de AndesCoin a la venta
    uint public max_andescoins = 50000000;

    // Tasa de conversion de USD a ANC
    uint public usd_to_andescoins = 5;

    // Introduciendo numero total de AndesCoins que han sido compradas por inversionistas
    uint public total_andescoins_bought = 0;

    // mapeo de direccion de inversionista a activos en andescoins y USD
    mapping(address=>uint)equity_andescoins;
    mapping(address=>uint)equity_usd;

    // Chequeando si inversionista puede comprar tokens
    modifier can_buy_andescoins(uint usd_invested) {
        require (usd_invested * usd_to_andescoins + total_andescoins_bought <= max_andescoins);
        _;
    }

    // Obteniendo capital invertido en Tokens
    function equity_in_andescoins(address investor) external view returns (uint) {
        return equity_andescoins[investor];

    }

    // Obteniendo capital invertido en dolares USD
    function equity_in_usd(address investor) external view returns (uint) {
        return equity_usd[investor];
        
    }

    // Comprando tokens
    function buy_andescoins(address investor, uint usd_invested) external can_buy_andescoins(usd_invested) {
        uint andescoins_bought = usd_invested * usd_to_andescoins;
        equity_andescoins[investor] += andescoins_bought;

        equity_usd[investor] = equity_andescoins[investor] / 5;

        total_andescoins_bought += andescoins_bought;

    }

    // Vendiendo tokens
    function sell_andescoins(address investor, uint andescoins_sold) external  {
        
        equity_andescoins[investor] -= andescoins_sold;

        equity_usd[investor] = equity_andescoins[investor] / 5;

        total_andescoins_bought -= andescoins_sold;

    }





}


// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.8.0;
pragma experimental ABIEncoderV2;
library SafeMath{
// La Resta
function sub(uint256 a, uint256 b) internal pure returns (uint256) {
assert(b <= a);
return a – b;
}
// La Suma
function add(uint256 a, uint256 b) internal pure returns (uint256) {
uint256 c = a + b;
assert(c >= a);
return c;
}
// La Multiplicación
function mul(uint256 a, uint256 b) internal pure returns (uint256) {
if (a == 0) {
return 0;
}