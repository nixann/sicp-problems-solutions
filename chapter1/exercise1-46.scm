#lang racket

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (iterative-improvement good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (guess) (iter guess)))

(define (sqrt x)
  (define tolerance 0.001)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improvement good-enough? improve) 1.0))

(define (fixed-point f transform guess)
  (define tolerance 0.0001)
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))
  ((iterative-improvement good-enough? transform) guess))
  

