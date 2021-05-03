#lang racket

(define (reverse list-argument) ; the argument is called list-argument not list becase it conflicts with the list procedure
  (if (null? list-argument)
      list-argument
      (append (reverse (cdr list-argument)) (list (car list-argument)))))