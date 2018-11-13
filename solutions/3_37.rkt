#lang racket
#| Solution for exercise 3_37. |#

(require "../solutions/constraints.rkt")
(provide celsius-farengheit-converter)

(define (celsius-farengheit-converter F-con)
  (c+ (c* (c/ (cv 9) (cv 5))
          F-con)
      (cv 32)))


(define (c+ con1 con2)
  (let ((sum (make-connector)))
    (adder con1 con2 sum)
    sum))

(define (c* con1 con2)
  (let ((mul (make-connector)))
    (multiplier con1 con2 mul)
    mul))


(define (c/ con1 con2)
  (let ((div (make-connector)))
    (multiplier con2 div con1)
    div))

(define (cv val)
  (let ((const-con (make-connector)))
    (constant val const-con)
    const-con))




