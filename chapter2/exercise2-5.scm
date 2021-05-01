#lang racket

(define (square x) (* x x))

(define (pow a b)
  (cond ((= b 0) 1)
        ((even? b) (square (pow a (/ b 2))))
        (else (* a (pow a (- b 1))))))

;; there is a bijection between the numbers represented as (2^a)*(3^b) and the pairs (a, b)
;; so this representation of cons will work

(define (cons1 a b) (* (pow 2 a) (pow 3 b)))

(define (car1 z)
  (if (not (= (remainder z 2) 0))
      0
      (+ 1 (car1 (/ z 2)))))

(define (cdr1 z)
  (if (not (= (remainder z 3) 0))
      0
      (+ 1 (cdr1 (/ z 3)))))