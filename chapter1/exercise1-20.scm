#lang racket

;; when the interpreter uses normal order evaluation:


;; (gcd 206 40)

;; (gcd 40 (remainder 206 40)))
;;   (if (= (remainder 206 40)) 0) -> performed 1 time
;;       40
;;       (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

;; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;   (if (= (remainder 40 (remainder 206 40)) 0) -> performed 2 times
;;       (remainder 206 40)
;;       (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;   (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) -> performed 4 times
;;     (remainder 40 (remainder 206 40))
;;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;; the if here evaluates to true
;;     (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) -> performed 7 times
;;        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) -> performed 4 times
;;        ....

;; the remainder operation is performed 1 + 2 + 4 + 7 + 4 = 18 times

;; (gcd 40 (remainder a 40))
;; (gcd 6 (remainder 40 6))
;; (gcd 4 (remainder 6 4))
;; (gcd 2 (remainder 4 2))
;; (remainder 4 2) returuns 0, so the last gcd call returns 2

;; the remainder operation is performed 4 times

;; when the interpreter uses applicative order evaluation:

;; (gcd 206 40)
;; (gcd 40 6)
;; (gcd 6 4)
;; (gcd 4 2)
;; (gcd 2 0)

;; the remainder operation is performed 4 times