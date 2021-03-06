#lang racket

;; (fold-right / 1 (list 1 2 3)) -> 3/2
;; (fold-left / 1 (list 1 2 3)) -> 1 / 6
;; (fold-right list nil (list 1 2 3)) ->  (1 (2 (3 ())))
;; (fold-left list nil (list 1 2 3)) -> (((() 1) 2) 3)

;; fold-left and fold-right will produce the same values for the same sequence when the op is comutative