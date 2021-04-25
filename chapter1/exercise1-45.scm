#lang racket

(define (square x) (* x x))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (fixed-point f transform guess)
  (define tolerance 0.0001)
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))
  
    (if (good-enough? guess)
        guess
        (fixed-point f transform (transform  guess))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x) (if (= n 0)
                  x
                  ((compose f (repeated f (- n 1))) x))))

(define (pow x n)
  (cond ((= n 0) 1)
        ((even? n) (square (pow x (/ n 2))))
        (else (* x (pow x (- n 1))))))

(define (n-th-root x n)
  (let ((repetitions (ceiling (log n)))
        (function (lambda (y) (/ x (pow y (- n 1))))))
    (fixed-point function ((repeated average-damp repetitions) function) 1.0)))
  