#lang racket

(define (push element elements)
  (append elements (list element))) 

(define (deep-reverse deep-list)
  (cond ((null? deep-list) deep-list)
        ((pair? (car deep-list)) (push (deep-reverse (car deep-list)) (deep-reverse (cdr deep-list))))
        (else (push (car deep-list) (deep-reverse (cdr deep-list))))))
