#lang racket
#| Solution for exercise 3_08. |#

(provide f-maker)

(define (f-maker)
  (let ((val 2))
    (lambda (arg)
      (set! val (- val 1))
      (* arg val))))


