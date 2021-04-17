#lang racket

(define (square n) (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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

;; as of 2021 the computers have become too fast to note the time in the given ranges
;; but for really large numbers e.g. (search-for-primes 1000000000 1000000021) we get the ouput:

;; (search-for-primes 1000000000 1000000021)

;; 1000000007 *** cpu time: 3 real time: 3 gc time: 0
;; 1000000009 *** cpu time: 2 real time: 2 gc time: 0
;; 1000000021 *** cpu time: 2 real time: 2 gc time: 0

;; when we multiply the range by 10:

;; (search-for-primes 10000000000 10000000061)

;; 10000000019 *** cpu time: 6 real time: 6 gc time: 0
;; 10000000033 *** cpu time: 6 real time: 6 gc time: 0
;; 10000000061 *** cpu time: 6 real time: 6 gc time: 0

;; we can observe that the time values is grow by a factor of 3 which is approximately the square root of 10
;; hence the growth really is square root of n
