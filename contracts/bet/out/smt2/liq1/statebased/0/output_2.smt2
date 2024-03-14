; benchmark generated from python API
(set-info :status unknown)
(declare-datatypes ((Proc 0)) (((timeout) (Bet) (join) (coinbase) (win))))
 (declare-fun w_0 () Int)
(declare-fun state_1 () Int)
(declare-fun t_state_0_0 () Int)
(declare-fun par2_1 () Int)
(declare-fun par2_0 () Int)
(declare-fun par1_1 () Int)
(declare-fun t_par1_0_0 () Int)
(declare-fun deadline_1 () Int)
(declare-fun t_deadline_0_0 () Int)
(declare-fun oracle_1 () Int)
(declare-fun t_oracle_0_0 () Int)
(declare-fun aw_0_2 () Int)
(declare-fun aw_1_2 () Int)
(declare-fun aw_0_1 () Int)
(declare-fun aw_1_1 () Int)
(declare-fun aw_0_0 () Int)
(declare-fun aw_1_0 () Int)
(declare-fun t_w_0_0 () Int)
(declare-fun w_1 () Int)
(declare-fun xn_0 () Int)
(declare-fun xa_0 () Int)
(declare-fun state_2 () Int)
(declare-fun par2_2 () Int)
(declare-fun par1_2 () Int)
(declare-fun deadline_2 () Int)
(declare-fun oracle_2 () Int)
(declare-fun aw_2_2 () Int)
(declare-fun aw_2_1 () Int)
(declare-fun aw_2_0 () Int)
(declare-fun t_w_1_0 () Int)
(declare-fun w_2 () Int)
(declare-fun xn_1 () Int)
(declare-fun t_state_1_0 () Int)
(declare-fun t_aw_1_1_2 () Int)
(declare-fun t_aw_1_1_1 () Int)
(declare-fun t_aw_1_1_0 () Int)
(declare-fun t_w_1_1 () Int)
(declare-fun t_aw_1_0_2 () Int)
(declare-fun t_aw_1_0_1 () Int)
(declare-fun t_aw_1_0_0 () Int)
(declare-fun block_num_1 () Int)
(declare-fun f_1 () Proc)
(declare-fun win_winner_1 () Int)
(declare-fun xa_1 () Int)
(declare-fun t_par2_1_0 () Int)
(declare-fun block_num_2 () Int)
(assert
 (>= w_0 0))
(assert
 (let (($x319 (= t_state_0_0 state_1)))
 (let (($x318 (= par2_0 par2_1)))
 (let (($x317 (= t_par1_0_0 par1_1)))
 (let (($x316 (= t_deadline_0_0 deadline_1)))
 (let (($x315 (= t_oracle_0_0 oracle_1)))
 (let (($x313 (= aw_1_2 aw_0_2)))
 (let (($x312 (= aw_1_1 aw_0_1)))
 (let (($x311 (= aw_1_0 aw_0_0)))
 (let (($x310 (= w_1 t_w_0_0)))
 (let (($x321 (and (and (= xn_0 1) (and true (and true (and true true)))) true (and $x310 (and $x311 $x312 $x313) $x315 $x316 $x317 $x318 $x319))))
 (and (and (>= xa_0 0) (<= xa_0 2) (>= xn_0 0)) (and (>= aw_0_0 0) (>= aw_0_1 0) (>= aw_0_2 0)) (and (= t_w_0_0 (+ w_0 xn_0)) $x321)))))))))))))
(assert
 (let (($x351 (= state_1 state_2)))
 (let (($x350 (= par2_1 par2_2)))
 (let (($x349 (= par1_1 par1_2)))
 (let (($x348 (= deadline_1 deadline_2)))
 (let (($x347 (= oracle_1 oracle_2)))
 (let (($x345 (= aw_2_2 aw_1_2)))
 (let (($x344 (= aw_2_1 aw_1_1)))
 (let (($x343 (= aw_2_0 aw_1_0)))
 (let (($x346 (and $x343 $x344 $x345)))
 (let (($x359 (= w_2 t_w_1_0)))
 (let (($x339 (= t_w_1_0 (+ w_1 xn_1))))
 (let (($x361 (= t_state_1_0 state_2)))
 (let (($x474 (= aw_2_2 t_aw_1_1_2)))
 (let (($x473 (= aw_2_1 t_aw_1_1_1)))
 (let (($x472 (= aw_2_0 t_aw_1_1_0)))
 (let (($x471 (= w_2 t_w_1_1)))
 (let (($x476 (and $x471 (and $x472 $x473 $x474) $x347 $x348 $x349 $x350 $x361)))
 (let (($x467 (= t_aw_1_1_2 t_aw_1_0_2)))
 (let (($x464 (= par2_1 2)))
 (let (($x462 (= t_aw_1_1_1 t_aw_1_0_1)))
 (let (($x459 (= par2_1 1)))
 (let (($x457 (= t_aw_1_1_0 t_aw_1_0_0)))
 (let (($x454 (= par2_1 0)))
 (let (($x469 (and (ite $x454 (= t_aw_1_1_0 (+ t_aw_1_0_0 1)) $x457) (ite $x459 (= t_aw_1_1_1 (+ t_aw_1_0_1 1)) $x462) (ite $x464 (= t_aw_1_1_2 (+ t_aw_1_0_2 1)) $x467))))
 (let (($x477 (and (and (= t_w_1_1 (- t_w_1_0 1)) $x469) true $x476)))
 (let (($x342 (= w_2 w_1)))
 (let (($x352 (and $x342 $x346 $x347 $x348 $x349 $x350 $x351)))
 (let (($x435 (not true)))
 (let (($x406 (= t_aw_1_0_2 aw_1_2)))
 (let (($x446 (= par1_1 2)))
 (let (($x401 (= t_aw_1_0_1 aw_1_1)))
 (let (($x442 (= par1_1 1)))
 (let (($x396 (= t_aw_1_0_0 aw_1_0)))
 (let (($x438 (= par1_1 0)))
 (let (($x450 (and (ite $x438 (= t_aw_1_0_0 (+ aw_1_0 1)) $x396) (ite $x442 (= t_aw_1_0_1 (+ aw_1_1 1)) $x401) (ite $x446 (= t_aw_1_0_2 (+ aw_1_2 1)) $x406))))
 (let (($x480 (and (and (= t_w_1_0 (- w_1 1)) $x450) (and (ite $x435 $x352 $x477) true $x476))))
 (let (($x434 (not (>= block_num_1 deadline_1))))
 (let (($x380 (= t_state_1_0 2)))
 (let (($x485 (and $x380 (ite $x434 $x352 (and (and (ite $x435 $x352 $x480) true $x476))))))
 (let (($x378 (= state_1 1)))
 (let (($x379 (not $x378)))
 (let (($x376 (= xn_1 0)))
 (let (($x377 (not $x376)))
 (let (($x432 (= f_1 timeout)))
 (let (($x493 (ite $x432 (ite $x377 $x352 (and (ite $x379 $x352 (and (and $x485 true $x476))))) (and $x339 (and $x359 $x346 $x347 $x348 $x349 $x350 $x351)))))
 (let (($x412 (= aw_2_2 t_aw_1_0_2)))
 (let (($x411 (= aw_2_1 t_aw_1_0_1)))
 (let (($x410 (= aw_2_0 t_aw_1_0_0)))
 (let (($x414 (and $x359 (and $x410 $x411 $x412) $x347 $x348 $x349 $x350 $x361)))
 (let (($x408 (and (ite (= win_winner_1 0) (= t_aw_1_0_0 (+ aw_1_0 w_1)) $x396) (ite (= win_winner_1 1) (= t_aw_1_0_1 (+ aw_1_1 w_1)) $x401) (ite (= win_winner_1 2) (= t_aw_1_0_2 (+ aw_1_2 w_1)) $x406))))
 (let (($x389 (>= w_1 0)))
 (let (($x390 (not $x389)))
 (let (($x416 (ite $x390 $x352 (and (and (= t_w_1_0 (- w_1 w_1)) $x408) true $x414))))
 (let (($x419 (ite (not (or (= win_winner_1 par1_1) (= win_winner_1 par2_1))) $x352 (and (and $x416 true $x414)))))
 (let (($x383 (< block_num_1 deadline_1)))
 (let (($x384 (not $x383)))
 (let (($x425 (ite (not (= xa_1 oracle_1)) $x352 (and (and (ite $x384 $x352 (and (and $x419 true $x414))) true $x414)))))
 (let (($x431 (ite $x377 $x352 (and (ite $x379 $x352 (and (and (and $x380 $x425) true $x414)))))))
 (let (($x375 (= f_1 win)))
 (let (($x360 (= t_par2_1_0 par2_2)))
 (let (($x362 (and $x359 $x346 $x347 $x348 $x349 $x360 $x361)))
 (let (($x365 (ite (not (and (distinct xa_1 par1_1) true)) $x352 (and (and (= t_par2_1_0 xa_1) true $x362)))))
 (let (($x353 (= t_state_1_0 1)))
 (let (($x369 (and $x353 (ite (not (= xn_1 1)) $x352 (and (and $x365 true $x362))))))
 (let (($x340 (= state_1 0)))
 (let (($x341 (not $x340)))
 (let (($x337 (= f_1 join)))
 (let (($x495 (ite $x337 (and $x339 (and (ite $x341 $x352 (and (and $x369 true $x362))))) (ite $x375 $x431 $x493))))
 (let (($x334 (>= aw_1_2 0)))
 (let (($x333 (>= aw_1_1 0)))
 (let (($x332 (>= aw_1_0 0)))
 (let (($x335 (and $x332 $x333 $x334)))
 (and (and (>= xa_1 0) (<= xa_1 2) (>= xn_1 0)) $x335 (>= block_num_2 block_num_1) $x495))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(assert
 (let (($x621 (exists ((xa_q Int) )(let (($x1605 (forall ((xn_q0 Int) (f_q0 Proc) (wq0 Int) (awq0_0 Int) (awq0_1 Int) (awq0_2 Int) (t_wq0_0 Int) (t_wq0_1 Int) (t_awq0_0_0 Int) (t_awq0_0_1 Int) (t_awq0_0_2 Int) (t_awq0_1_0 Int) (t_awq0_1_1 Int) (t_awq0_1_2 Int) (win_winner0_q Int) (oracleq0 Int) (t_oracleq0_0 Int) (t_oracleq0_1 Int) (deadlineq0 Int) (t_deadlineq0_0 Int) (t_deadlineq0_1 Int) (par1q0 Int) (t_par1q0_0 Int) (t_par1q0_1 Int) (par2q0 Int) (t_par2q0_0 Int) (t_par2q0_1 Int) (stateq0 Int) (t_stateq0_0 Int) (t_stateq0_1 Int) (xn_q1 Int) (f_q1 Proc) (wq1 Int) (awq1_0 Int) (awq1_1 Int) (awq1_2 Int) (t_wq1_0 Int) (t_wq1_1 Int) (t_awq1_0_0 Int) (t_awq1_0_1 Int) (t_awq1_0_2 Int) (t_awq1_1_0 Int) (t_awq1_1_1 Int) (t_awq1_1_2 Int) (win_winner1_q Int) (oracleq1 Int) (t_oracleq1_0 Int) (t_oracleq1_1 Int) (deadlineq1 Int) (t_deadlineq1_0 Int) (t_deadlineq1_1 Int) (par1q1 Int) (t_par1q1_0 Int) (t_par1q1_1 Int) (par2q1 Int) (t_par2q1_0 Int) (t_par2q1_1 Int) (stateq1 Int) (t_stateq1_0 Int) (t_stateq1_1 Int) (xn_q2 Int) (f_q2 Proc) (wq2 Int) (awq2_0 Int) (awq2_1 Int) (awq2_2 Int) (t_wq2_0 Int) (t_wq2_1 Int) (t_awq2_0_0 Int) (t_awq2_0_1 Int) (t_awq2_0_2 Int) (t_awq2_1_0 Int) (t_awq2_1_1 Int) (t_awq2_1_2 Int) (win_winner2_q Int) (oracleq2 Int) (t_oracleq2_0 Int) (t_oracleq2_1 Int) (deadlineq2 Int) (t_deadlineq2_0 Int) (t_deadlineq2_1 Int) (par1q2 Int) (t_par1q2_0 Int) (t_par1q2_1 Int) (par2q2 Int) (t_par2q2_0 Int) (t_par2q2_1 Int) (stateq2 Int) (t_stateq2_0 Int) (t_stateq2_1 Int) )(let (($x801 (and (or (and (distinct par2_1 0) true) (not (>= (- awq2_0 aw_1_0) 2))) (or (and (distinct par2_1 1) true) (not (>= (- awq2_1 aw_1_1) 2))) (or (and (distinct par2_1 2) true) (not (>= (- awq2_2 aw_1_2) 2))))))
 (let (($x805 (and (or (and (distinct par1_1 0) true) (not (>= (- awq2_0 aw_1_0) 2))) (or (and (distinct par1_1 1) true) (not (>= (- awq2_1 aw_1_1) 2))) (or (and (distinct par1_1 2) true) (not (>= (- awq2_2 aw_1_2) 2))))))
 (let (($x806 (or $x805 $x801)))
 (let (($x1144 (= stateq1 stateq2)))
 (let (($x1145 (= par2q1 par2q2)))
 (let (($x1146 (= par1q1 par1q2)))
 (let (($x1147 (= deadlineq1 deadlineq2)))
 (let (($x1148 (= oracleq1 oracleq2)))
 (let (($x1152 (and (= awq2_0 awq1_0) (= awq2_1 awq1_1) (= awq2_2 awq1_2))))
 (let (($x816 (= wq2 t_wq2_0)))
 (let (($x1155 (= t_wq2_0 (+ wq1 xn_q2))))
 (let (($x1156 (and $x1155 (and $x816 $x1152 $x1148 $x1147 $x1146 $x1145 $x1144))))
 (let (($x821 (= t_stateq2_0 stateq2)))
 (let (($x825 (and (= awq2_0 t_awq2_1_0) (= awq2_1 t_awq2_1_1) (= awq2_2 t_awq2_1_2))))
 (let (($x826 (= wq2 t_wq2_1)))
 (let (($x1157 (and $x826 $x825 $x1148 $x1147 $x1146 $x1145 $x821)))
 (let (($x1164 (and (ite (= par2q1 0) (= t_awq2_1_0 (+ t_awq2_0_0 1)) (= t_awq2_1_0 t_awq2_0_0)) (ite (= par2q1 1) (= t_awq2_1_1 (+ t_awq2_0_1 1)) (= t_awq2_1_1 t_awq2_0_1)) (ite (= par2q1 2) (= t_awq2_1_2 (+ t_awq2_0_2 1)) (= t_awq2_1_2 t_awq2_0_2)))))
 (let (($x842 (= t_wq2_1 (- t_wq2_0 1))))
 (let (($x1168 (and (= wq2 wq1) $x1152 $x1148 $x1147 $x1146 $x1145 $x1144)))
 (let (($x435 (not true)))
 (let (($x1186 (and (ite (= par1q1 0) (= t_awq2_0_0 (+ awq1_0 1)) (= t_awq2_0_0 awq1_0)) (ite (= par1q1 1) (= t_awq2_0_1 (+ awq1_1 1)) (= t_awq2_0_1 awq1_1)) (ite (= par1q1 2) (= t_awq2_0_2 (+ awq1_2 1)) (= t_awq2_0_2 awq1_2)))))
 (let (($x1190 (and (and (= t_wq2_0 (- wq1 1)) $x1186) (and (ite $x435 $x1168 (and (and $x842 $x1164) true $x1157)) true $x1157))))
 (let (($x1193 (and (and (ite $x435 $x1168 $x1190) true $x1157))))
 (let (($x866 (= t_stateq2_0 2)))
 (let (($x1198 (and (and $x866 (ite (not (>= block_num_1 deadlineq1)) $x1168 $x1193)) true $x1157)))
 (let (($x1201 (not (= stateq1 1))))
 (let (($x872 (= xn_q2 0)))
 (let (($x873 (not $x872)))
 (let (($x875 (= f_q2 timeout)))
 (let (($x880 (and (= awq2_0 t_awq2_0_0) (= awq2_1 t_awq2_0_1) (= awq2_2 t_awq2_0_2))))
 (let (($x1206 (and $x816 $x880 $x1148 $x1147 $x1146 $x1145 $x821)))
 (let (($x1216 (and (ite (= win_winner2_q 0) (= t_awq2_0_0 (+ awq1_0 wq1)) (= t_awq2_0_0 awq1_0)) (ite (= win_winner2_q 1) (= t_awq2_0_1 (+ awq1_1 wq1)) (= t_awq2_0_1 awq1_1)) (ite (= win_winner2_q 2) (= t_awq2_0_2 (+ awq1_2 wq1)) (= t_awq2_0_2 awq1_2)))))
 (let (($x1223 (ite (not (>= wq1 0)) $x1168 (and (and (= t_wq2_0 (- wq1 wq1)) $x1216) true $x1206))))
 (let (($x1230 (ite (not (or (= win_winner2_q par1q1) (= win_winner2_q par2q1))) $x1168 (and (and $x1223 true $x1206)))))
 (let (($x1232 (and (and $x1230 true $x1206))))
 (let (($x1240 (ite (not (= oracle_1 oracleq1)) $x1168 (and (and (ite (not (< block_num_1 deadlineq1)) $x1168 $x1232) true $x1206)))))
 (let (($x1246 (ite $x873 $x1168 (and (ite $x1201 $x1168 (and (and (and $x866 $x1240) true $x1206)))))))
 (let (($x915 (= f_q2 win)))
 (let (($x1247 (ite $x915 $x1246 (ite $x875 (ite $x873 $x1168 (and (ite $x1201 $x1168 (and $x1198)))) $x1156))))
 (let (($x917 (= t_par2q2_0 par2q2)))
 (let (($x1248 (and $x816 $x1152 $x1148 $x1147 $x1146 $x917 $x821)))
 (let (($x1253 (ite (not (and (distinct oracle_1 par1q1) true)) $x1168 (and (and (= t_par2q2_0 oracle_1) true $x1248)))))
 (let (($x925 (= xn_q2 1)))
 (let (($x926 (not $x925)))
 (let (($x928 (= t_stateq2_0 1)))
 (let (($x1258 (and (and $x928 (ite $x926 $x1168 (and (and $x1253 true $x1248)))) true $x1248)))
 (let (($x1261 (not (= stateq1 0))))
 (let (($x935 (= f_q2 join)))
 (let (($x597 (>= block_num_1 block_num_1)))
 (let (($x1269 (and (>= awq1_0 0) (>= awq1_1 0) (>= awq1_2 0))))
 (let (($x937 (>= xn_q2 0)))
 (let (($x594 (<= oracle_1 2)))
 (let (($x593 (>= oracle_1 0)))
 (let (($x938 (and $x593 $x594 $x937)))
 (let (($x1270 (and $x938 $x1269 $x597 (ite $x935 (and $x1155 (and (ite $x1261 $x1168 (and $x1258)))) $x1247))))
 (let (($x1271 (not $x1270)))
 (let (($x1606 (= stateq0 stateq1)))
 (let (($x1607 (= par2q0 par2q1)))
 (let (($x1608 (= par1q0 par1q1)))
 (let (($x1609 (= deadlineq0 deadlineq1)))
 (let (($x1610 (= oracleq0 oracleq1)))
 (let (($x1614 (and (= awq1_0 awq0_0) (= awq1_1 awq0_1) (= awq1_2 awq0_2))))
 (let (($x1280 (= wq1 t_wq1_0)))
 (let (($x1617 (= t_wq1_0 (+ wq0 xn_q1))))
 (let (($x1618 (and $x1617 (and $x1280 $x1614 $x1610 $x1609 $x1608 $x1607 $x1606))))
 (let (($x1285 (= t_stateq1_0 stateq1)))
 (let (($x1289 (and (= awq1_0 t_awq1_1_0) (= awq1_1 t_awq1_1_1) (= awq1_2 t_awq1_1_2))))
 (let (($x1290 (= wq1 t_wq1_1)))
 (let (($x1619 (and $x1290 $x1289 $x1610 $x1609 $x1608 $x1607 $x1285)))
 (let (($x1626 (and (ite (= par2q0 0) (= t_awq1_1_0 (+ t_awq1_0_0 1)) (= t_awq1_1_0 t_awq1_0_0)) (ite (= par2q0 1) (= t_awq1_1_1 (+ t_awq1_0_1 1)) (= t_awq1_1_1 t_awq1_0_1)) (ite (= par2q0 2) (= t_awq1_1_2 (+ t_awq1_0_2 1)) (= t_awq1_1_2 t_awq1_0_2)))))
 (let (($x1306 (= t_wq1_1 (- t_wq1_0 1))))
 (let (($x1630 (and (= wq1 wq0) $x1614 $x1610 $x1609 $x1608 $x1607 $x1606)))
 (let (($x1648 (and (ite (= par1q0 0) (= t_awq1_0_0 (+ awq0_0 1)) (= t_awq1_0_0 awq0_0)) (ite (= par1q0 1) (= t_awq1_0_1 (+ awq0_1 1)) (= t_awq1_0_1 awq0_1)) (ite (= par1q0 2) (= t_awq1_0_2 (+ awq0_2 1)) (= t_awq1_0_2 awq0_2)))))
 (let (($x1652 (and (and (= t_wq1_0 (- wq0 1)) $x1648) (and (ite $x435 $x1630 (and (and $x1306 $x1626) true $x1619)) true $x1619))))
 (let (($x1655 (and (and (ite $x435 $x1630 $x1652) true $x1619))))
 (let (($x1330 (= t_stateq1_0 2)))
 (let (($x1660 (and (and $x1330 (ite (not (>= block_num_1 deadlineq0)) $x1630 $x1655)) true $x1619)))
 (let (($x1663 (not (= stateq0 1))))
 (let (($x1336 (= xn_q1 0)))
 (let (($x1337 (not $x1336)))
 (let (($x1339 (= f_q1 timeout)))
 (let (($x1344 (and (= awq1_0 t_awq1_0_0) (= awq1_1 t_awq1_0_1) (= awq1_2 t_awq1_0_2))))
 (let (($x1668 (and $x1280 $x1344 $x1610 $x1609 $x1608 $x1607 $x1285)))
 (let (($x1678 (and (ite (= win_winner1_q 0) (= t_awq1_0_0 (+ awq0_0 wq0)) (= t_awq1_0_0 awq0_0)) (ite (= win_winner1_q 1) (= t_awq1_0_1 (+ awq0_1 wq0)) (= t_awq1_0_1 awq0_1)) (ite (= win_winner1_q 2) (= t_awq1_0_2 (+ awq0_2 wq0)) (= t_awq1_0_2 awq0_2)))))
 (let (($x1685 (ite (not (>= wq0 0)) $x1630 (and (and (= t_wq1_0 (- wq0 wq0)) $x1678) true $x1668))))
 (let (($x1692 (ite (not (or (= win_winner1_q par1q0) (= win_winner1_q par2q0))) $x1630 (and (and $x1685 true $x1668)))))
 (let (($x1694 (and (and $x1692 true $x1668))))
 (let (($x1702 (ite (not (= oracle_1 oracleq0)) $x1630 (and (and (ite (not (< block_num_1 deadlineq0)) $x1630 $x1694) true $x1668)))))
 (let (($x1708 (ite $x1337 $x1630 (and (ite $x1663 $x1630 (and (and (and $x1330 $x1702) true $x1668)))))))
 (let (($x1379 (= f_q1 win)))
 (let (($x1709 (ite $x1379 $x1708 (ite $x1339 (ite $x1337 $x1630 (and (ite $x1663 $x1630 (and $x1660)))) $x1618))))
 (let (($x1381 (= t_par2q1_0 par2q1)))
 (let (($x1710 (and $x1280 $x1614 $x1610 $x1609 $x1608 $x1381 $x1285)))
 (let (($x1715 (ite (not (and (distinct oracle_1 par1q0) true)) $x1630 (and (and (= t_par2q1_0 oracle_1) true $x1710)))))
 (let (($x1390 (not (= xn_q1 1))))
 (let (($x1392 (= t_stateq1_0 1)))
 (let (($x1720 (and (and $x1392 (ite $x1390 $x1630 (and (and $x1715 true $x1710)))) true $x1710)))
 (let (($x1723 (not (= stateq0 0))))
 (let (($x1399 (= f_q1 join)))
 (let (($x1731 (and (>= awq0_0 0) (>= awq0_1 0) (>= awq0_2 0))))
 (let (($x1401 (>= xn_q1 0)))
 (let (($x1402 (and $x593 $x594 $x1401)))
 (let (($x1732 (and $x1402 $x1731 $x597 (ite $x1399 (and $x1617 (and (ite $x1723 $x1630 (and $x1720)))) $x1709))))
 (let (($x1733 (not $x1732)))
 (let (($x1734 (= state_1 stateq0)))
 (let (($x1735 (= par2_1 par2q0)))
 (let (($x1736 (= par1_1 par1q0)))
 (let (($x1737 (= deadline_1 deadlineq0)))
 (let (($x1700 (= oracle_1 oracleq0)))
 (let (($x1741 (and (= awq0_0 aw_1_0) (= awq0_1 aw_1_1) (= awq0_2 aw_1_2))))
 (let (($x1742 (= wq0 t_wq0_0)))
 (let (($x1745 (= t_wq0_0 (+ w_1 xn_q0))))
 (let (($x1747 (= t_stateq0_0 stateq0)))
 (let (($x1751 (and (= awq0_0 t_awq0_1_0) (= awq0_1 t_awq0_1_1) (= awq0_2 t_awq0_1_2))))
 (let (($x1752 (= wq0 t_wq0_1)))
 (let (($x1753 (and $x1752 $x1751 $x1700 $x1737 $x1736 $x1735 $x1747)))
 (let (($x1766 (and (ite (= par2_1 0) (= t_awq0_1_0 (+ t_awq0_0_0 1)) (= t_awq0_1_0 t_awq0_0_0)) (ite (= par2_1 1) (= t_awq0_1_1 (+ t_awq0_0_1 1)) (= t_awq0_1_1 t_awq0_0_1)) (ite (= par2_1 2) (= t_awq0_1_2 (+ t_awq0_0_2 1)) (= t_awq0_1_2 t_awq0_0_2)))))
 (let (($x1768 (= t_wq0_1 (- t_wq0_0 1))))
 (let (($x1772 (and (= wq0 w_1) $x1741 $x1700 $x1737 $x1736 $x1735 $x1734)))
 (let (($x1775 (= t_awq0_0_2 aw_1_2)))
 (let (($x446 (= par1_1 2)))
 (let (($x1778 (= t_awq0_0_1 aw_1_1)))
 (let (($x442 (= par1_1 1)))
 (let (($x1781 (= t_awq0_0_0 aw_1_0)))
 (let (($x438 (= par1_1 0)))
 (let (($x1784 (and (ite $x438 (= t_awq0_0_0 (+ aw_1_0 1)) $x1781) (ite $x442 (= t_awq0_0_1 (+ aw_1_1 1)) $x1778) (ite $x446 (= t_awq0_0_2 (+ aw_1_2 1)) $x1775))))
 (let (($x1787 (and (and (= t_wq0_0 (- w_1 1)) $x1784) (and (ite $x435 $x1772 (and (and $x1768 $x1766) true $x1753)) true $x1753))))
 (let (($x434 (not (>= block_num_1 deadline_1))))
 (let (($x1792 (= t_stateq0_0 2)))
 (let (($x1793 (and $x1792 (ite $x434 $x1772 (and (and (ite $x435 $x1772 $x1787) true $x1753))))))
 (let (($x378 (= state_1 1)))
 (let (($x379 (not $x378)))
 (let (($x1799 (not (= xn_q0 0))))
 (let (($x1801 (= f_q0 timeout)))
 (let (($x1802 (ite $x1801 (ite $x1799 $x1772 (and (ite $x379 $x1772 (and (and $x1793 true $x1753))))) (and $x1745 (and $x1742 $x1741 $x1700 $x1737 $x1736 $x1735 $x1734)))))
 (let (($x1806 (and (= awq0_0 t_awq0_0_0) (= awq0_1 t_awq0_0_1) (= awq0_2 t_awq0_0_2))))
 (let (($x1807 (and $x1742 $x1806 $x1700 $x1737 $x1736 $x1735 $x1747)))
 (let (($x1817 (and (ite (= win_winner0_q 0) (= t_awq0_0_0 (+ aw_1_0 w_1)) $x1781) (ite (= win_winner0_q 1) (= t_awq0_0_1 (+ aw_1_1 w_1)) $x1778) (ite (= win_winner0_q 2) (= t_awq0_0_2 (+ aw_1_2 w_1)) $x1775))))
 (let (($x389 (>= w_1 0)))
 (let (($x390 (not $x389)))
 (let (($x1821 (ite $x390 $x1772 (and (and (= t_wq0_0 (- w_1 w_1)) $x1817) true $x1807))))
 (let (($x1828 (ite (not (or (= win_winner0_q par1_1) (= win_winner0_q par2_1))) $x1772 (and (and $x1821 true $x1807)))))
 (let (($x383 (< block_num_1 deadline_1)))
 (let (($x384 (not $x383)))
 (let (($x639 (not (= oracle_1 oracle_1))))
 (let (($x1834 (ite $x639 $x1772 (and (and (ite $x384 $x1772 (and (and $x1828 true $x1807))) true $x1807)))))
 (let (($x1840 (ite $x1799 $x1772 (and (ite $x379 $x1772 (and (and (and $x1792 $x1834) true $x1807)))))))
 (let (($x1841 (= f_q0 win)))
 (let (($x1843 (= t_par2q0_0 par2q0)))
 (let (($x1844 (and $x1742 $x1741 $x1700 $x1737 $x1736 $x1843 $x1747)))
 (let (($x616 (not (and (distinct oracle_1 par1_1) true))))
 (let (($x1849 (and (ite $x616 $x1772 (and (and (= t_par2q0_0 oracle_1) true $x1844))) true $x1844)))
 (let (($x1852 (not (= xn_q0 1))))
 (let (($x1854 (= t_stateq0_0 1)))
 (let (($x340 (= state_1 0)))
 (let (($x341 (not $x340)))
 (let (($x1858 (ite $x341 $x1772 (and (and (and $x1854 (ite $x1852 $x1772 (and $x1849))) true $x1844)))))
 (let (($x1861 (= f_q0 join)))
 (let (($x334 (>= aw_1_2 0)))
 (let (($x333 (>= aw_1_1 0)))
 (let (($x332 (>= aw_1_0 0)))
 (let (($x335 (and $x332 $x333 $x334)))
 (let (($x1863 (>= xn_q0 0)))
 (let (($x1864 (and $x593 $x594 $x1863)))
 (let (($x1865 (and $x1864 $x335 $x597 (ite $x1861 (and $x1745 (and $x1858)) (ite $x1841 $x1840 $x1802)))))
 (or (not $x1865) $x1733 $x1271 $x806)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
 ))
 (let (($x591 (= w_1 2)))
 (let (($x383 (< block_num_1 deadline_1)))
 (let (($x592 (and $x383 $x591)))
 (let (($x598 (<= xa_q 2)))
 (let (($x599 (>= xa_q 0)))
 (let (($x600 (and $x599 $x598)))
 (and $x600 $x592 $x1605)))))))))
 ))
 (and $x621)))
(check-sat)
