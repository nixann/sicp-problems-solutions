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

(define (distinct? triple)
  (not (and (= (car triple) (cadr triple)) (= (car triple) (caddr triple)))))

(define (has-sum? triple s)
  (= (+ (car triple) (cadr triple) (caddr triple)) s))

(define (find-triples n s)
  (filter (lambda (triple)
            (and (distinct? triple)
                 (has-sum? triple s)))
          (flat-map (lambda (i)
                      (flat-map (lambda (j)
                                  (map (lambda (k) (list i j k))
                                       (enumerate 1 n)))
                                (enumerate 1 n)))
                    (enumerate 1 n))))
  