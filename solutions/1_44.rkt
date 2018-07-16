#lang racket
#| Solution for exercise 1_44. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_43.rkt")
(provide smooth smooth-n-times)

(define (smooth fn)
  (let ((dx 0.1))
    (lambda (x)
      (/ (+ (fn (- x dx))
            (fn x)
            (fn (+ x dx)))
         3))))

(define (smooth-n-times fn n)
  (let ((smoother (repeated smooth n)))
    (smoother fn)))
