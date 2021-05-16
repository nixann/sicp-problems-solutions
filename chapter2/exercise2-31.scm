#lang racket

(define (tree-map function tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) function tree)
        (else (cons (tree-map function (car tree))
                    (tree-map function (cdr tree))))))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))