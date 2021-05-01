#lang racket

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

;; implementation with corner points

(define (make-rectangle lower-left-point upper-right-point)
  (cons lower-left-point upper-right-point))

(define (lower-left-point rectangle) (car rectangle))
(define (upper-right-point rectangle) (cdr rectangle))

(define (width rectangle)
  (- (x-point (upper-right-point rectangle))
     (x-point (lower-left-point rectangle))))

(define (height rectangle)
  (- (y-point (upper-right-point rectangle))
     (y-point (lower-left-point rectangle))))

;; implementation with start-point, width and height

(define (make-rectangle2 start-point width height)
  (cons start-point (cons width height)))

(define (width2 rectangle) (car (cdr rectangle)))
(define (height2 rectangle) (cdr (cdr rectangle)))

;; the perimeter and area procedures will work with both width and height procedures

(define (perimeter rectangle)
  (+ (* 2 (width rectangle))
     (* 2 (height rectangle))))

(define (area rectangle)
  (* (width rectangle) (height rectangle)))