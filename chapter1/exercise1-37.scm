#lang racket

(define (cont-frac n d k)
  (define (recursive i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n k) (+ (d k) result)))))
  (iter k 0))
    
  