
from z3 import *
import time


def stringOfXA(m, i):
    return "A" + str(m.eval(xa[i]))


def stringOfTx(m, i):
    contract = "C4"
    sender = stringOfXA(m, i)
    method = str(m.eval(f[i]))
    args = str(m.eval(xn[i]))
    return "-- " + sender + ": " + contract + "." + method + "(" + args + ") -->"


def stringOfWal(m, i):
    s = ""
    for j in range(A+1):
        s += "A" + str(j) + "[" + str(m.eval(aw[i][j])) + ":T] | "
    return s


def stringOfContr(m, i):
    contract = "C4"
    return contract + "[" + str(m.eval(w[i])) + ":T] "


def stringOfSuccess(m, i):
    s = "| success:"
    return s + str(m.eval(success[i]))


def printState(m):
    for i in range(N):
        print(stringOfWal(m, i), end='')
        print(stringOfContr(m, i), end='')
        print(stringOfSuccess(m, i), end='')
        print()
        print(stringOfTx(m, i), end='')
        print()
    print(stringOfWal(m, N), end='')
    print(stringOfContr(m, N), end='')
    print()


timeStart = time.time()

# N = upper bound on the length of trace
N = 2

# A = upper bound on the number of actors (A+1)
A = 3

# Maximum functions depth
M = 2

# Contract's balance
w = [Int("w_%s" % (i)) for i in range(N+1)]
w_q = Int("wq")

# Block number
block_num = [Int("block_num_%s" % (i)) for i in range(N+1)]
block_num_q = Int("block_num_q")

Proc = Datatype('Proc')
Proc.declare('join')
Proc.declare('timeout')
Proc.declare('win')

Proc = Proc.create()

# Contract's state variables

oracle = [Int("oracle_%s" % (i)) for i in range(N+1)]
oracle_q = Int("oracleq")
t_oracle = [[Int("t_oracle_%s_%s" % (i, m)) for m in range(M)] for i in range(N+1)]
t_oracle_q = [Int("t_oracleq_%s" % (m)) for m in range(M)]
deadline = [Int("deadline_%s" % (i)) for i in range(N+1)]
deadline_q = Int("deadlineq")
t_deadline = [[Int("t_deadline_%s_%s" % (i, m)) for m in range(M)] for i in range(N+1)]
t_deadline_q = [Int("t_deadlineq_%s" % (m)) for m in range(M)]
p1 = [Int("p1_%s" % (i)) for i in range(N+1)]
p1_q = Int("p1q")
t_p1 = [[Int("t_p1_%s_%s" % (i, m)) for m in range(M)] for i in range(N+1)]
t_p1_q = [Int("t_p1q_%s" % (m)) for m in range(M)]
p2 = [Int("p2_%s" % (i)) for i in range(N+1)]
p2_q = Int("p2q")
t_p2 = [[Int("t_p2_%s_%s" % (i, m)) for m in range(M)] for i in range(N+1)]
t_p2_q = [Int("t_p2q_%s" % (m)) for m in range(M)]

# Called procedure
f = [Const("f_%s" % (i), Proc) for i in range(N+1)]
f_q = Const("f_q", Proc)

# users' wallets
aw = [[Int("aw_%s_%s" % (i, j)) for j in range(A+1)] for i in range(N+1)]
aw_q = [Int("awq_%s" % j) for j in range(A+1)]

# msg.sender
xa = [Int("xa_%s" % (i)) for i in range(N+1)]
xa_q = Int("xa_q")

# msg.value
xn = [Int("xn_%s" % (i)) for i in range(N+1)]
xn_q = Int("xn_q")

# functions args
constructor_o = [Int("constructor_o_%s" % (i)) for i in range(N+1)] 
constructor_o_q = Int("constructor_o_q")
constructor_d = [Int("constructor_d_%s" % (i)) for i in range(N+1)] 
constructor_d_q = Int("constructor_d_q")
win_winner = [Int("win_winner_%s" % (i)) for i in range(N+1)] 
win_winner_q = Int("win_winner_q")

# List of ids hard coded
hard_coded_list = [0]

# Temporary contract balance. Used inside functions to model internal states
t_w = [[Int("t_w_%s_%s" % (i, m)) for m in range(M)] for i in range(N+1)]
t_w_q = [Int("t_wq_%s" % (m)) for m in range(M)] 

# Temporary users wallets
t_aw = [[[Int("t_aw_%s_%s_%s" % (i, m, j)) for j in range(A+1)]
         for m in range(M)] for i in range(N+1)]

t_aw_q = [[Int("t_awq_%s_%s" % (m, j)) for j in range(A+1)]
         for m in range(M)]

s = Solver()

# initial state
s.add(w[0] >= 0)
# s.add(w[0] == 1)

def next_state_tx(aw1, aw2, w1, w2, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next):
    return And(w2 == w1,
               And([aw2[j] == aw1[j] for j in range(A+1)])
               , oracleNow==oracleNext, deadlineNow==deadlineNext, p1Now==p1Next, p2Now==p2Next
               , )

def send(sender_id, amount, w_b, w_a, aw_b, aw_a): # '_b' and '_a' mean 'before' and 'after'
    return And(w_a == w_b - amount,
                  And([If(j == sender_id,
                          aw_a[j] == aw_b[j] + amount,
                          aw_a[j] == aw_b[j]) for j in range(A+1)]))


def constructor(xa1, xn1, constructor_o,constructor_d, awNow, awNext, wNow, wNext, t_aw, t_w, block_num, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2):
    return And(t_w[0] == wNow + xn1, 
	And(If(
	Not(xn1==1), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		And(
	t_p1[0] == xa1,
	And(
	t_oracle[0] == constructor_o,
	t_deadline[0] == constructor_d)))), next_state_tx(awNow, awNext, t_w[0], wNext, t_oracle[0], oracleNext, t_deadline[0], deadlineNext, t_p1[0], p1Next, p2Now, p2Next)))

def join(xa1, xn1, awNow, awNext, wNow, wNext, t_aw, t_w, block_num, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2):
    return And(t_w[0] == wNow + xn1, 
	And(If(
	Not(t_w[0]==1), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		If(
	Not(xn1==1), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		If(
	Not(xa1!=p1Now), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		t_p2[0] == xa1)))))), next_state_tx(awNow, awNext, t_w[0], wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, t_p2[0], p2Next)))

def win(xa1, xn1, win_winner, awNow, awNext, wNow, wNext, t_aw, t_w, block_num, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2):
    return If(Not(xn1==0), next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), 
	And(If(
	Not(wNow==2), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		If(
	Not(xa1==oracleNow), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		If(
	Not(block_num<deadlineNow), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		If(
	Not(Or(win_winner==p1Now,win_winner==p2Now)), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		send(win_winner, wNow, wNow, t_w[0], awNow, t_aw[0]))))))))), next_state_tx(t_aw[0], awNext, t_w[0], wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next)))

def timeout(xa1, xn1, awNow, awNext, wNow, wNext, t_aw, t_w, block_num, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2):
    return If(Not(xn1==0), next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), 
	And(If(
	Not(wNow==2), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		If(
	Not(block_num>=deadlineNow), 
		next_state_tx(awNow, awNext, wNow, wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next), And(
		And(
	send(p1Now, 1, wNow, t_w[0], awNow, t_aw[0]),
	send(p2Now, 1, t_w[0], t_w[1], t_aw[0], t_aw[1])))))), next_state_tx(t_aw[1], awNext, t_w[1], wNext, oracleNow, oracleNext, deadlineNow, deadlineNext, p1Now, p1Next, p2Now, p2Next)))


def user_is_legit(xa1):
    return And(xa1 >= 0, xa1 <= A)


def user_has_not_already_played(xa, xa1, f, i):
    return Not(Or([And(xa[k] == xa1, f[k] == Proc.pay) for k in range(i)]))


def user_is_not_hard_coded(xa1):
    return Not(Or([xa1 == hc_i for hc_i in hard_coded_list]))


def user_is_fresh(xa, xa1, f, i):
    return And(user_is_not_hard_coded(xa1), user_has_not_already_played(xa, xa1, f, i))

# transition rules

def step_trans(f1, xa1, xn1, win_winner, aw1, aw2, w1, w2, t_aw, t_w, block_num1, block_num2, i, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2):
    return And(And(xa1 >= 0, xa1 <= A, xn1 >= 0),
               And([aw1[j] >= 0 for j in range(A+1)]),
               block_num2 >= block_num1,
               If(f1 == Proc.join,
	join(xa1, xn1, aw1, aw2, w1, w2, t_aw, t_w, block_num1, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2),
	If(f1 == Proc.win,
		win(xa1, xn1, win_winner, aw1, aw2, w1, w2, t_aw, t_w, block_num1, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2),
			timeout(xa1, xn1, aw1, aw2, w1, w2, t_aw, t_w, block_num1, oracleNow, oracleNext, t_oracle, deadlineNow, deadlineNext, t_deadline, p1Now, p1Next, t_p1, p2Now, p2Next, t_p2))))

new_state = And(And(xa[0] >= 0, xa[0] <= A, xn[0] >= 0),
               And([aw[0][j] >= 0 for j in range(A+1)]),
                  constructor(xa[0], xn[0], constructor_o[0],constructor_d[0],  aw[0], aw[1], w[0], w[1], t_aw[0], t_w[0], block_num[0], oracle[0], oracle[1], t_oracle[0], deadline[0], deadline[1], t_deadline[0], p1[0], p1[1], t_p1[0], p2[0], p2[1], t_p2[0]))
s.add(new_state)
for i in range(1, N):
    new_state = step_trans(f[i], xa[i], xn[i], win_winner[i], aw[i],
                           aw[i+1], w[i], w[i+1], t_aw[i], t_w[i], block_num[i], block_num[i+1], i, oracle[i], oracle[i+1], t_oracle[i], deadline[i], deadline[i+1], t_deadline[i], p1[i], p1[i+1], t_p1[i], p2[i], p2[i+1], t_p2[i])
    s.add(new_state)


# print(s)

# def p(i):
#     t_awq_list = [t_awq_m_j for t_awq_m in t_aw_q for t_awq_m_j in t_awq_m]
#     #print([xn_q, f_q, w_q, *aw_q, *t_w_q, *t_awq_list ])
#     return And(w[i] > 0,
#                Exists([xa_q], And(user_is_legit(xa_q), user_is_fresh(xa, xa_q, f,  i),
#                       ForAll([xn_q, f_q, w_q, *aw_q, *t_w_q, *t_awq_list, win_winner_q, oracle_q, *t_oracle_q, deadline_q, *t_deadline_q, p1_q, *t_p1_q, p2_q, *t_p2_q ], Or(Not(step_trans(f_q, xa_q, xn_q, win_winner_q, aw[i], aw_q, w[i], w_q, t_aw_q, t_w_q, i, oracle[i], oracle_q, t_oracle_q, deadline[i], deadline_q, t_deadline_q, p1[i], p1_q, t_p1_q, p2[i], p2_q, t_p2_q)), w_q > 0)))))
#                       #ForAll([xn_q, f_q, w_q, *aw_q ], Or(Not(step_trans(f_q, xa_q, xn_q, aw[i], aw_q, w[i], w_q, t_aw[i], t_w[i], i)), w_q > 0)))))


def p(i):
    t_awq_list = [t_awq_m_j for t_awq_m in t_aw_q for t_awq_m_j in t_awq_m]
    return And(
        Exists([xa_q], And(user_is_legit(xa_q), And(block_num[i]<deadline[i],w[i]==2),
            ForAll([xn_q, f_q, w_q, *aw_q, *t_w_q, *t_awq_list, block_num_q, win_winner_q, oracle_q, *t_oracle_q, deadline_q, *t_deadline_q, p1_q, *t_p1_q, p2_q, *t_p2_q],  
                Or(
                    Not(step_trans(f_q, oracle_q, xn_q, win_winner_q, aw[i], aw_q, w[i], w_q, t_aw_q, t_w_q, block_num[i], block_num_q, i, oracle[i], oracle_q, t_oracle_q, deadline[i], deadline_q, t_deadline_q, p1[i], p1_q, t_p1_q, p2[i], p2_q, t_p2_q)), 
                    Or(
                        And([Or(j != p1[i], Not(aw_q[j] >= aw[i][j]+(2))) for j in range(A+1)]),
                        And([Or(j != p2[i], Not(aw_q[j] >= aw[i][j]+(2))) for j in range(A+1)])
                    ))))))

queries = [p(i) for i in range(1, N)]

# queries = [ p(0) ]

for i, q in enumerate(queries):
    timeStart = time.time()
    # print("q : ", q)
    print("p " + str(i) + " : ", end='')
    # sq = s
    # sq.add(q)
    # print("\n\nsq:", sq, "\n\n")
    res = s.check(q)
    if res == sat:
        print(" sat (=> not liquid)")
        m = s.model()
        # print(m)
        #printState(m)
        # exit()
    else:
        print(" unsat (=> liquid)")

    timeTot = time.time() - timeStart
    print("Solving time: " + str(timeTot) + "s")
                      
