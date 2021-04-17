#lang racket

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
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (newline) (display n) (display " *** ") (time (prime? n)))

(define (odd? n) (= (remainder n 2) 1))

(define (search-for-primes start end)
  (define (iterate i)
    (cond ((<= i end)
           (cond ((prime? i) (timed-prime-test i)))
           (iterate (+ i 2)))))
  (iterate (if (odd? start) start (+ 1 start))))

;; when using the search-for-primes procedure from exercise1-22 the oputput is:

;; (search-for-primes 1000000000000 1000000000063)
;; 1000000000039 *** cpu time: 159 real time: 151 gc time: 2
;; 1000000000061 *** cpu time: 62 real time: 62 gc time: 2
;; 1000000000063 *** cpu time: 63 real time: 62 gc time: 2

;; when using the updated search-for-primes the output is

;; 1000000000039 *** cpu time: 48 real time: 48 gc time: 1
;; 1000000000061 *** cpu time: 43 real time: 43 gc time: 1
;; 1000000000063 *** cpu time: 42 real time: 41 gc time: 1

;; we can observe that the time value is twice as small
