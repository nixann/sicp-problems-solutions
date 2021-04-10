#lang racket

(define (even? n)
  (= (remainder n 2 ) 0))

(define (doubles n)
  (* n 2))

(define (halves n)
  (/ n 2))

(define (fast-multiply a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-multiply (doubles a) (halves b)))
        (else (+ a (fast-multiply a (- b 1))))))