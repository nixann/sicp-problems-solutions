#lang racket

(define (compute-pascal-triangle column depth)
  (if (or (= column 0) (= depth 0) (= column depth)) ; columns start from 0 and the depth of the tip of the triangle is 0
      1
      (+ (compute-pascal-triangle (- column 1) (- depth 1)) (compute-pascal-triangle column (- depth 1)))))