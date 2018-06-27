#lang racket
#| My frequently used utils |#

(provide square aprox-equal-at)

(define (square arg) (* arg arg))

(define (aprox-equal-at arg1 arg2 accuracy)
  (<= (abs (- arg1 arg2)) accuracy))


