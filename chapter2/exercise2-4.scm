#lang racket
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;; with this representation cons returns a procedure which takes a procedure as an argument
;; and applies the passed arugment to x and y
;; in the car implementation the passed procedure is a procedure which always returns its first argument
;; the case for cdr is the same, only that it always returns its second argument
