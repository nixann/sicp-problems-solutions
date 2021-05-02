#lang racket

(define (make-interval a b)
  (if (> a b)
      (cons b a)
      (cons a b)))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

(define (make-center-percent center percent)
  (let ((delta (* center (/ percent 100.0))))
    (make-interval (- center delta) (+ center delta))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (let ((delta (- (upper-bound i) (center i))))
    (abs (/ (center i) delta))))

  