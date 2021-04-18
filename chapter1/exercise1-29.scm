#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (inc x) (+ 1 x))
(define (cube x) (* x x x))

(define (calc-integral-by-simpson f a b n)
  (define (simpson-term k)
    (cond ((or (= k 0) (= k n)) (+ (f a) (* k (/ (- b a) n))))
          ((odd? k) (* 4 (f (+ a (* k (/ (- b a) n))))))
          (else (* 2 (f (+ a (* k (/ (- b a) n))))))))
    
  (* (/ (/ (- b a) n) 3)
     (sum simpson-term 0 inc n)))

;; (integral cube 0 1 0.01)
;; .24998750000000042

;; (calc-integral-by-simpson cube 0.0 1.0 100)
;; 0.24999999999999992


;; (integral cube 0 1 0.001)
;; .249999875000001

;; (calc-integral-by-simpson cube 0.0 1.0 1000)
;; 0.2500000000000003

;; we can see that the simpson's rule is more precise

