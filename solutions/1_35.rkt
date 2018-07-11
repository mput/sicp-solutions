#lang racket
#| Solution for exercise 1_35. |#

(require rackunit "../solutions/utils.rkt")
(provide fixed-point golden-ratio)

(define (fixed-point fn first-guess)
  (define (close-enough a b)
    (< (abs (- a b)) 0.001))
  (define (iter-point privious-resalt)
    (let ((guess (fn privious-resalt)))
      (if (close-enough guess privious-resalt)
        guess
        (iter-point guess))))
  (iter-point first-guess))

(define golden-ratio
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))

