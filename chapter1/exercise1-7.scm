#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; The tolerance of 0.001 is too big for very small numbers
;; for example (sqrt 0.0001) returns 0.03230844833048122 instead of the correct value which is 0.01

;; On the other hand for very large values for x the machine is unable to represent small differences between very big numbers
;; for example (sqrt 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
;; produces an infinite loop

(define (new-good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) 0.001))

(define (new-sqrt-iter old-guess new-guess x)
  (if (new-good-enough? old-guess new-guess)
      new-guess
      (new-sqrt-iter new-guess (improve new-guess x) x)))

(define (new-sqrt x)
  (new-sqrt-iter x 1.0 x))

;; When using new-good-enough? the program works better for small and large numbers
;; For example (new-sqrt 0.0001) now returns 0.010000714038711746
;; and (new-sqrt 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
;; does produce an infinite loop