# Hacked-Contract

<h2>💭 Hacking my Contract</h2>

<h3>The Idea is to simulate a Reentrancy Attack on my own contracts, and look the difference between a safe contract and a unsafe contract.<h3>
<br>
  
<h2>❌ This contracts are made to be an explaination of how to prevent a Reentracy Attack, is not an encoureged to hack anything.<h2>
<br>
  
<h2>👀 What Reentrancy Attack is </h2>
<h3>Reentrancy Attack is one of the most DESTRUCTIVE attack to a contract, and occur when a contract make a call to another untrusted contract</h3> 
<h3>The untrusted contract then, will make a recursive call to that function until it drains the contract.</h3> 
<h3>This is possible because our trusted contract don't have the time to change is status.</h3>
<h3>To prevent a Reentrancy Attack, we could import the reentracyGuard.sol contract, from openzeppelin that allowed us to use the nonReentrant modifier.</h3>
<h3>This modifier will check for us, the reentrancy calls.</h3>
<br>
  
<h2>🔗 Bank.sol, Attack.sol</h2>
<h3>This 2 contracts are working togheter and are the unsafe method to deposit, withdraw.... to/from a contract</h3>  
<h3>In the Bank contract we can see 2 things to fix to prevent a Reentrancy attack.</h3> 
<h3>1 - We didn't import the ReentrancyGuard.sol from openzeppelin, so we are not able to use our nonReentrant modifier.</h3> 
<h3>2 - We are using an unsafe call to transfer our value like ".sendValue()" in function deposit(), instead .transfer() .</h3> 
<h3>In fact even using a different method to transfer, should create a possible point of break in your contracts, so the safest method to transfer is via .transfer()</h3>  
<br>
<h3>Now we can see the Attack contract</h3>  
<h3>We need the Bank address to deploy this contract, this because we are creating a pointer to that contract to call the functions in that.</h3> 
<h3>Once deployed we can see 2 functions:</h3> 
<h3>1- function Attack() is external and payable.</h3> 
<h3>This because to use the deposit function in the Bank contract we have to deposit an amount, because we have to be "registered" to the Bank contract to withdraw().</h3>  
<h3>🔎 Focus on this : </h3>
<h3>In Bank contract we have a mapping(address=>uint)private _balances, that will store all the address make a deposit and make a check in the withdraw() function
to see if the address sending the request, have a balance depositated in the contract.</h3>
<h3>So to make the attack we have to deposit an amount in the Bank to be "registered" in the _balances mapping of the Bank contract, and then call the withdraw() function</h3>
<br>
<h3>Now the vulnerability is:</h3>
<h3>The attack function call the withdraw()function of the bank contract, when the token has been received, the receive functions in the Attack contract is called,
So until the Bank contract balance is more than 0 we will receive the tokens.</h3>
<br> 

<h2>🔗 BankCorrect.sol, AttackCorrect.sol</h2>  
<h3>This 2 contracts are working togheter and are the safe method to deposit, withdraw.... to/from a contract</h3>  
<h3>In the Bank contract we are using all the safe method to prevent a Reentrancy Attack </h3> 
<br> 

<h2>✂️📐 Use this contracts</h2>
<h3>Bank.sol-BankCorrect.sol are working in the same way.</h3>  
<h3>Attack.sol-AttackCorrect.sol are working in the same way.</h3> 
<br>
<h3>First of all deploy Bank contract.</h3> 
<h3>Once deployed, use the deposit function and set a deposit not less than 0.</h3>  
<h3>If you want to see better, repeat the deposit with differents accounts.</h3> 
<h3>Check the contractBalance via getContractBalance()</h3>  
<br>
<h3>Attack-AttackCorrect</h3> 
<h3>Use a new address to deploy this contract!</h3>  
<h3>To deploy it we need the Bank address, so copy and paste that address to deploy this contract.</h3> 
<h3>Once deployed use the attack functions and send a value.</h3> 
<br>

<h3>💥 You Hacked Your Contract</h3> 
<br>  

<h2>🔨 Built with</h2>
<h3>Solidity, Truffle, Ganache</h3>   
