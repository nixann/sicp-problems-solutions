#lang racket

(define (make-interval a b)
  (if (> a b)
      (cons b a)
      (cons a b)))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))