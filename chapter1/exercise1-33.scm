#lang racket

(define (filtered-accumulate combiner predicate? null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (predicate? a) (term a) null-value)
                (filtered-accumulate combiner predicate? null-value term (next a) next b))))

(define (square n) (* n n))
(define (divides? a b) (= (remainder b a) 0))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (and (>= n 2) (= (smallest-divisor n) n)))

(define (inc x) (+ x 1))

(define (sum-of-primes-squares a b)
  (filtered-accumulate + prime? 0 square a inc b))

(define (id x) x)

;; the name of the procedure is gcd1, because gcd is already imported from racket
(define (gcd1 a b)
  (if (= (remainder a b) 0)
      b
      (gcd1 b (remainder a b))))

(define (relatively-prime? a b)
  (= (gcd1 a b) 1))

(define (prod-of-rel-prime-and-less-than n)
  (define (predicate? x)
    (relatively-prime? x n))
  (filtered-accumulate * predicate? 1 id 1 inc n))