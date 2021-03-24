#lang racket

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1)) (* 2 (f-recur (- n 2))) (* 3 (f-recur (- n 3))))))

(define (f-iter n)
  (define (iterate a b c counter) ; a is f(n-3), b is f(n-2), c is f(n-1). Their initial values are 0, 1, 2
    (if (< counter 3)
        c
        (iterate b c (+ c (* 2 b) (* 3 a)) (- counter 1))))
  (if (< n 3)
      n
      (iterate 0 1 2 n))) 