#lang racket

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect scalar v)
  (make-vect (* scalar (xcor-vect v))
             (* scalar (ycor-vect v))))

;; origin, edge1 and edge2 are vectors
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

(define (make-segment start end)
  (cons (make-vect (0 start))
        (make-vect (0 end))))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))


(define (bottom-left frame) (origin-frame frame))
(define (bottom-right frame) (add-vect (origin-frame frame) (edge1-frame frame)))
(define (top-left frame) (add-vect (origin-frame frame) (edge2-frame frame)))
(define (top-right frame) (add-vect (bottom-right frame) (edge2-frame frame)))

;; a

(define (frame-outline-painter frame)
  ((segments->painter '((make-segment (bottom-left frame) (bottom-right frame))
                       (make-segment (bottom-left frame) (top-left frame))
                       (make-segment (top-left frame) (top-right frame))
                       (make-segment (top-right frame) (bottom-right frame)))) frame))

;; b

(define (x-painter frame)
  ((segments->painter '((make-segment (bottom-left frame) (top-right frame))
                        (make-segment (top-left frame) (bottom-right frame)))) frame))

;; c

(define (diamond-painter frame)
  (let ((left (scale-vect 0.5 (add-vect (bottom-left frame) (top-left frame))))
        (top (scale-vect 0.5 (add-vect (top-left frame) (top-right frame))))
        (right (scale-vect 0.5 (add-vect (top-right frame) (bottom-right frame))))
        (bottom (scale-vect 0.5 (add-vect (bottom-left frame) (bottom-right frame)))))
    ((segments->painter '((make-segment left top)
                          (make-segment top right)
                          (make-segment right bottom)
                          (make-segment bottom left))) frame)))

  