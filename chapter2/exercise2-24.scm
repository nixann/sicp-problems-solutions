#lang racket

;; (list 1 (list 2 (list 3 4))) -> (1 (2 (3 4)))

;; the box model is: 
;; [.|.] -> [.|/]
;;  |        |
;;  1       [.|.] -> [.|/]
;;           |        |
;;           2       [.|.] -> [.|/]
;;                    |        |
;;                    3        4    

;; the tree representation is:
;;   .
;;  / \
;; 1   .
;;    / \
;;   2   .
;;      / \
;;     3   4