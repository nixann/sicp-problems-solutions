#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) (cons x set))
(define (union-set set1 set2) (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; the only difference in efficiency is in the adjoin-set and union-set procedures
;; with this representation they work with T(1) complexity

;; We would prefer to use this representation if the elements of the set do not need to be distinct and we use adjoin-set and union set very often