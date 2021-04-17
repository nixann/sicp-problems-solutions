#lang racket

(define (square n) (* n n))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2 ) 0))

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

(define (new-expmod base exp m)
  (remainder (fast-expt base exp) m))

;; theoretically the new-expomd procedure will return the same result as expmod
;; but for large numbers new-expmod produces really large numbers which take a lot of space