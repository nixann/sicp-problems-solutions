#lang racket

;; first variant
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))


;; second variant

(define (v2-make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (v2-origin-frame frame) (car frame))
(define (v2-edge1-frame frame) (cadr frame))
(define (v2-edge2-frame frame) (cddr frame))

