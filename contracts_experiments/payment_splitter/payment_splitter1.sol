contract PaymentSplitter {
    mapping (address => int) shares
    int totalShares
    mapping (address => int) released
    int totalReleased
    int totalReceived 
    int payment
    const address owner
    int state

    constructor(address o) {
        owner = o
        // totalShares = 0;
        // totalReleased = 0;
        // state = 0
    }

    function addShares(address p, int s) {
        require(msg.sender == owner);
        require(state == 0);
        shares[p] = shares[p] + s;
        totalShares = totalShares + s
    }

    function finalizeShares() {
        require(msg.sender == owner);
        require(state == 0);
        state = 1
    }

    function receive() payable {
        skip
    } 

    function release(address a) { 
        require(shares[a] > 0);
        require(state == 1);
    
        totalReceived = balance + totalReleased;
        payment = (totalReceived * shares[a]) / totalShares - released[a];
        if (payment != 0) {
            totalReleased = totalReleased + payment;
            released[a] = released[a] + payment;
            a!payment
        }
    }
}

// ? Can_Transactions_Arrive_Any_time=False: WEAK SAT WEAK UNSAT ?
// ? Can_Transactions_Arrive_Any_time=True: STRONG SAT ?
property anyUserCanWithdraw_nonlive {
    Forall xa
    [
      true
        ->
      Exists tx [1, xa]
      [
        ((app_tx_st.balance[xa] == st.balance[xa] + st.balance))
      ]
    ]
}
