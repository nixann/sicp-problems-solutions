#lang racket

(define tolerance 0.00001)

(define (fixed-point f guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (let ((next (f guess)))
    (if (close-enough? next guess)
        next
        (fixed-point f next))))

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))