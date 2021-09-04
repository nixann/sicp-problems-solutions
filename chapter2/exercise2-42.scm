#lang racket

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flat-map
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row
                                    k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (enumerate-interval start n)
  (if (> start n)
      '()
      (cons start (enumerate-interval (+ 1 start) n))))

(define (accumulate op nv seq)
  (if (null? seq)
      nv
      (op (car seq) (accumulate op nv (cdr seq)))))

(define (flat-map function seq)
  (accumulate append '() (map function seq)))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens) 
   (cons (list new-row k) rest-of-queens))

(define (get-row position) (car position))
(define (get-col position) (cadr position))

(define (all? predicate? elements)
  (cond ((empty? elements) #t)
        ((not (predicate? (car elements))) #f)
        (else (all? predicate? (cdr elements)))))

(define (safe? k positions)
  (if (empty? positions)
      #t
      (let* ((queen-position (car (filter (lambda (position) (= (get-col position) k))
                                          positions)))
             (other-positions (filter (lambda (position) (not (equal? position queen-position)))positions)))
        (all? (lambda (position) (and (not (= (get-row position) (get-row queen-position)))
                                      (not (lie-on-same-diagonal? position queen-position))))
              other-positions))))

(define (lie-on-same-diagonal? position1 position2)
  (= (abs (- (get-row position1) (get-row position2))) (abs (- (get-col position1) (get-col position2))))) 
  