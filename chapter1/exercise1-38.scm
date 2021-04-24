#lang racket

(define (cont-frac n d k)
  (define (recursive i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))

(define (euler-d-function k)
  (if (= (remainder k 3) 2)
      (* 2 (/ (+ k 1) 3))
      1))