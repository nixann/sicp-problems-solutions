#lang racket

;; The program will enter an infinite recursion.
;; This is the case because the interpreter uses applicative-order evaluation
;; and will try to evaluate all of the new-if arguments
;; which will lead to invoking the sqrt-iter procedure over and over again