#lang racket

(define (make-vect x y) (cons x y))

(define (make-segment start end)
  (cons (make-vect (0 start))
        (make-vect (0 end))))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))