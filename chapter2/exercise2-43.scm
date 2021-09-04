#lang racket

;; The program runs slowly because we call the recursive procedure queen-cols for each element in the enumerated interval
;; and so we do many redundant computations.

;; Louis’s program will solve the puzzle in T^(board-size - 1) time.