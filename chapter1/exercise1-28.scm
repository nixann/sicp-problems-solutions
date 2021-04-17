#lang racket

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder-square-checked (expmod base (/ exp 2) m) m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(define (remainder-square-checked x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-prime?  n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (miller-rabin-prime? n (- times 1)))
        (else #f)))

;; (miller-rabin-prime? 3 10)
;; #t

;; (miller-rabin-prime? 4 10)
;; #f

;; (miller-rabin-prime? 1105 10)
;; #f

;; (miller-rabin-prime? 7 10)
;; #t