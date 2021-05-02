#lang racket

(define (make-interval a b)
  (if (> a b)
      (cons b a)
      (cons a b)))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))