#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define mobile (make-mobile (make-branch 3 (make-mobile (make-branch 2 3) (make-branch 3 2)))
                            (make-branch 3 5)))

(define (weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (torque branch)
  (* (branch-length branch) (weight branch)))


(define (balanced? mobile)
  (cond ((and (pair? (branch-structure (left-branch mobile)))
              (pair? (branch-structure (right-branch mobile))))
         (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
              (balanced? (branch-structure (left-branch mobile)))
              (balanced? (branch-structure (right-branch mobile)))))
        ((and (pair? (branch-structure (left-branch mobile)))
              (not (pair? (branch-structure (right-branch mobile)))))
         (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
              (balanced? (branch-structure (left-branch mobile)))))
        ((and (not (pair? (branch-structure (left-branch mobile))))
              (pair? (branch-structure (right-branch mobile))))
         (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
             (balanced? (branch-structure (right-branch mobile)))))
        (else (= (torque (left-branch mobile)) (torque (right-branch mobile))))))

;; (define (make-mobile left right) (cons left right))
;; (define (make-branch length structure)
;;  (cons length structure))

;; if we change the constructors to this definition the only thing we need to change are the selectors

;; (define (left-branch mobile) (car mobile))
;; (define (right-branch mobile) (cdr mobile))

;; (define (branch-length branch) (car branch))
;; (define (branch-structure branch) (cdr branch))
  