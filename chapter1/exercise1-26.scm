#lang racket

;; Exercise 1.26

;; because the interpreter uses applicative order evaluation
;; in the Louis's version of expmod the expmod procedure will always be called twice for the same values

;; (* (expmod base (/ exp 2) m)
;;    (expmod base (/ exp 2) m))

;; this code will produce two branches and each of these branches will create two more branches and this process will continue recursively
;; this produces a log(2^n) procedure which is equal to n
;; therefore the process is process