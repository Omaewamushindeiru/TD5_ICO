pragma solidity >= 0.4.19;  
  
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";  
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";  
  
/**  q
* @title BearToken is a basic ERC20 Token  
*/  
contract BananeToken is StandardToken, Ownable{  
  
    uint256 public TotalSupply;  
    string public name;  
    string public ticker;  
    uint32 public decimals;  
  
  /**  
 * @dev assign totalSupply to account creating this contract */  
    constructor() public {  
        ticker = "BNT";  
        name = "BananeToken";  
        decimals = 5;  
        TotalSupply = 100000000000;  
  
        owner = msg.sender;  
        balances[msg.sender] = TotalSupply;  
    }


    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

  function balanceOf(address tokenOwner) public view returns (uint) {
    return balances[tokenOwner];
  }


  function allowance(address owner,
                  address delegate) public view returns (uint) {
  return allowed[owner][delegate];
}

  function transfer(address receiver,uint numTokens) public returns (bool) {
    require(numTokens <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender] - numTokens;
    balances[receiver] = balances[receiver] + numTokens;
    emit Transfer(msg.sender, receiver, numTokens);
    return true;
}
  public view returns (uint);

  function approve(address delegate,
                uint numTokens) public returns (bool) {
  allowed[msg.sender][delegate] = numTokens;
  emit Approval(msg.sender, delegate, numTokens);
  return true;
 }


  function transferFrom(address owner, address buyer,uint numTokens) public returns (bool) {
  require(numTokens <= balances[owner]);
  require(numTokens <= allowed[owner][msg.sender]);
  balances[owner] = balances[owner] — numTokens;
  allowed[owner][msg.sender] =
        allowed[from][msg.sender] — numTokens;
  balances[buyer] = balances[buyer] + numTokens;
  Transfer(owner, buyer, numTokens);
  return true;
}
}