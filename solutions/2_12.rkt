#lang racket
#| Solution for exercise 2_12. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "2_07.rkt")

(provide make-center-percent center width)

(define (make-center-percent center percent)
  (let ((width (* (/ center 100.0) percent)))
    (make-interval (- center width) (+ center width))))

(define (center interval)
  (average (lower-bound interval) (upper-bound interval)))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))
