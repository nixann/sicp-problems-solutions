#lang racket

(define (make-rat n d)
  (let ((g (gcd n d))) ; gcd comes out of the box in racket
    (if (or (and (> n 0) (< d 0)) (and (< n 0) (< d 0)))
        (cons (/ (- n) g) (/ (- d) g))
        (cons (/ n g) (/ d g)))))
        