#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (id x) x)
(define (inc x) (+ x 1))

(define (factorial n)
  (product id 1 inc n))

(define (pi-approx n)
  (define (term x)
    (* (/ x (- x 1))
       (/ x (+ x 1))))
  (* (/ 8 3) (product term 4.0 inc n)))

(define (product-iter term a next b)
  (define (iter start result)
    (if (> start b)
        result
        (iter (next start) (* result (term start)))))
  (iter a 1))
