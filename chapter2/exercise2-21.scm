#lang racket

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      '() ; in my version of racket there isn't a keyword for nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map square items))