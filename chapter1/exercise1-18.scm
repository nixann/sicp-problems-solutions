#lang racket

(define (even? n)
  (= (remainder n 2 ) 0))

(define (doubles n)
  (* n 2))

(define (halves n)
  (/ n 2))

(define (fast-multiply a b)
  (fast-multiply-iter 0 a b))

(define (fast-multiply-iter result a b)
  (cond ((= b 0) result)
        ((even? b) (fast-multiply-iter result (doubles a) (halves b)))
        (else (fast-multiply-iter (+ result a) a (- b 1)))))