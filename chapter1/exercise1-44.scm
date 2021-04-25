#lang racket

(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (x - dx)) (f x) (f (x + dx))) 3.0)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x) (if (= n 0)
                  x
                  ((compose f (repeated f (- n 1))) x))))

(define (n-fold f n)
  ((repeated smooth n) f))