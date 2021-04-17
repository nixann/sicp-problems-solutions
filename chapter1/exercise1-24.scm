#lang racket

(define (square n) (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder
          (square
           (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline) (display n) (display " *** ") (time (fast-prime? n 3)))

(define (odd? n) (= (remainder n 2) 1))

;; since the 2021 computers are too fast to note the time required for relatively large numbers
;; and the random procedure is not defined for very large numbers
;; we are not able to test the procedure

;; it has been tested in 2008 http://community.schemewiki.org/?sicp-ex-1.24
;; and the given conclusion there is:

;; From the collected timing data, we can observe that testing a number with twice as many digits (1e12 vs. 1e6) is roughly twice as slow.
;; This supports the theory of logarithmic growth.
