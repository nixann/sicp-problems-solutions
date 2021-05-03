#lang racket

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; the first definition of the procedure returns a reversed answer
;; because the iter procedure appends the current head of the things argument at the start of the result
;; while traversing the items from left to right
;; for example the list (1 2) will be transformed as
;; (cons 4 (cons 1 nil)) -> (4 1)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; the second definition won't work as well because it will construct the result in a reverse manner
;; for example (square-list (list 1 2 3)) will result to (((() . 1) . 4) . 9)
;; this happens because we start with nil as a first element of our pair
;; and while (cons 1 nil) evaluates to (1) (cons nil 1) evaluates to (() . 1)
;; therefore adding more elements with cons won't result into a list