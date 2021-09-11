#lang racket

;; (car ''something) is interpreted to (car (quote (quote something))
;; the first quote quotes the next entity which a  list of two emelents "quote" and "something"
;; hence car will return the first element of that list