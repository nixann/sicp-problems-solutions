#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (leaves tree)
  (cond ((null? tree) '())
        ((pair? tree) (append (leaves (car tree))
                              (leaves (cdr tree))))
        (else (list tree))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y)) 0 (leaves t)))