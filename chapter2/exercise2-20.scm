#lang racket

(define (have-same-parity? x y)
  (= (remainder x 2) (remainder y 2)))

(define (same-parity x . args)
  (define (iter result l)
    (cond ((null? l) result)
          ((have-same-parity? x (car l)) (iter (append result (list (car l))) (cdr l)))
          (else (iter result (cdr l)))))
  (iter (list x) args))
        
        