#lang racket
(define (split f1 f2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller (split painter (- n 1))))
          (f1 painter (f2 smaller smaller))))))