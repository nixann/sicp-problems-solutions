#lang racket

(define (for-each function items)
  (cond ((null? items) true)
        (else (function (car items)) (for-each function (cdr items)))))