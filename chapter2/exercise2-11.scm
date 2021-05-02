#lang racket

(define (make-interval a b)
  (if (> a b)
      (cons b a)
      (cons a b)))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

(define (both-negative? interval)
  (and (< (lower-bound interval) 0) (< (upper-bound interval) 0)))

(define (both-positive? interval)
  (and (> (lower-bound interval) 0) (> (upper-bound interval) 0)))

(define (lower-is-negative? interval)
  (and (not (both-negative? interval))
       (not (both-positive? interval))))

(define (mul-interval x y)
  (cond ((and (both-negative? x) (both-positive? y))
         (make-interval (* (lower-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y))))
        ((and (both-negative? x) (lower-is-negative? y))
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y))))
        ((and (both-negative? x) (both-negative? y))
         (make-interval (* (upper-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y))))
        ((and (lower-is-negative? x) (both-positive? y))
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (upper-bound x) (lower-bound y))))
        ((and (lower-is-negative? x) (lower-is-negative? y))
         (make-interval (min (* (lower-bound x) (upper-bound y))
                             (* (upper-bound x) (lower-bound y)))
                        (max (* (lower-bound x) (lower-bound y))
                             (* (upper-bound x) (upper-bound y)))))
        ((and (lower-is-negative? x) (both-negative? y))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (lower-bound x) (lower-bound y))))
        ((and (both-positive? x) (both-positive? y))
         (make-interval (* (lower-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y))))
        ((and (both-positive? x) (lower-is-negative? y))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y))))
        ((and (both-positive? x) (both-negative? y))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (lower-bound x) (upper-bound y))))))
        
                        
        
        