#lang racket

(define (square x) (* x x))

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

(define (test-carmichael-number n)
  (define (try-it a)
    (= (expmod a n n) a))
 
  (define (iterate start)
    (cond ((= start n) true)
          ((try-it start) (iterate (+ start 1)))
          (else false)))
  (iterate 2))

;; 561, 1105, 1729, 2465, 2821, 6601
;; test-carmichael-number returns true for all of these number altough they are not prime numbers