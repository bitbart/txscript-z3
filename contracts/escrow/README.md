# Escrow

## Specification

This contract involves three participants: a buyer, a seller and an arbiter. At construction, the buyer provides a deposit in ETH, and it specifies the addresses of the seller and of the arbiter, and the fee that will be paid to the arbiter in case it is used to resolve a dispute. After construction, the contract operates in three states: Agree, Dispute, Redeem. 

In the Agree state, one of three things may happen: 
- the buyer approves the payment to the seller (method `approve_payment`); 
- the seller issues a full refund to the buyer (method `refund`);
- either the buyer or the seller open a dispute (method `open_dispute`).

The first two actions transition the state to Redeem, while the latter leads to Dispute.

In the Dispute state, the arbiter redeems the fee, and chooses whom between the buyer and the seller can redeem the residual funds. After the arbiter choice, the state transitions to Redeem. 

In the Redeem state, the chosen recipient can `redeem` the whole contract balance.

## Properties

- **arbiter_wd_fee**: if a dispute is open, then the arbiter can redeem the fee
- **buyerorseller_wd_deposit**: if the arbiter has resolved the dispute, then either the buyer or the seller can redeem the deposit
- **anyone_wd**: if the arbiter has resolved the dispute, then anyone can redeem the whole contract balance
- **dispute_if_agree**: in the Agree state, both the buyer and the seller can open a dispute
- **liquidity**: once one of the participants has redeemed the deposit, anyone can withdraw the whole contract balance 

