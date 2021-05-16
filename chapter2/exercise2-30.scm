#lang racket

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))
;; with map
(define (square-tree1 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree1 sub-tree)
             (square sub-tree)))
       tree))