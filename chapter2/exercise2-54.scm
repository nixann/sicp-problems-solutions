#lang racket

;; there arleady is an equal? procedure in the racket lang this is written on
(define (equal*? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t)
        ((and (and (not (null? l1)) (list? l1))
              (and (not (null? l2)) (list? l2))) (and (eq? (car l1) (car l2))
                                                      (equal*? (cdr l1) (cdr l2))))
        ((and (symbol? l1) (symbol? l2)) (eq? l1 l2))
        (else #f)))
        