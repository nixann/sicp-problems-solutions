#lang racket

;; if the interpreter uses applicative-order evaluation then the program will halt because when calling (test 0 (p))
;; the interpreter will try to evaluate the arguments of the test procedure, but the (p) procedure cannot be evaluated
;; since it is an infinite recursion

;; if the interpreter uses normal-order evaluation then the program won't halt and the procedure will evaluate to 0
;; we can expect this behaviour because the interpreter will evaluate only the arguments of the test procedure that are required
;; for the evaluation of another procedure
;; since (p) does not have to be evaluated, the program won't halt