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

(define (make-center-percent center percent)
  (let ((delta (* center (/ percent 100.0))))
    (make-interval (- center delta) (+ center delta))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (or (= (upper-bound y) 0)
          (= (lower-bound y) 0))
      (error "cannot divide by interval which spans zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))
(define a (make-center-percent 3 2))
(define b (make-center-percent 5 10))

;; (par1 a b)
;; (1.5455607476635513 . 2.262096774193549)

;; (par2 a b)
;; (1.7782258064516128 . 1.9661214953271027)

;; (div-interval a a)
;; (0.9607843137254902 . 1.0408163265306123)

;; (div-interval a b)
;; (0.5345454545454545 . 0.6799999999999999)
