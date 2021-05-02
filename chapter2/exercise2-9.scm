#lang racket

(define (make-interval a b)
  (if (> a b)
      (cons b a)
      (cons a b)))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;; we can see that when adding(subtracting) two intervals a and b the width of the resulting interval is equal to
;; the average of the widths of a and b, hence it is a function of their widths

;; let's say we have two intervals i1 = (a, b) and i2 = (c, d) and the interval i3 = i1 * i2 is equal to (a * c, b * d)
;; then the width of i3 is equal to (bd - ac) / 2 which cannot be expressed as a function of w1 = (b - a) / 2 and w2 = (d - c) / 2

;; i4 = i1 / i2 will be equal to (a * (1 / d), b * (1 / c)) and its width will be (b * (1 / c) - a * (1 /d)) / 2
;; which also cannot be expressed as a function of w1 and w2



