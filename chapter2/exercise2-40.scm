#lang racket

(define (enumerate start n)
  (if (> start n)
      '()
      (cons start (enumerate (+ 1 start) n))))

(define (accumulate op nv seq)
  (if (null? seq)
      nv
      (op (car seq) (accumulate op nv (cdr seq)))))

(define (flat-map function seq)
  (accumulate append '() (map function seq)))

(define (unique-pairs n)
  (flat-map (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate 1 (- i 1))))
       (enumerate 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime? n)
  (define (iter start end)
    (cond ((> start end) true)
          ((= (remainder n start) 0) false)
          (else (iter (+ start 1) end))))
  (iter 2 (ceiling (sqrt n))))
        

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))