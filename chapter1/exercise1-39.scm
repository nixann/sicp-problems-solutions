#lang racket

(define (cont-frac n d k)
  (define (recursive i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (* x x -1)))
             (lambda (i) (- (* 2 i) 1))
             k))