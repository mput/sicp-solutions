#lang racket
#| Solution for exercise 2_02. |#

(require rackunit "../solutions/utils.rkt")
(provide make-segment start-segment end-segment mid-point make-point x-point y-point)


(define (mid-point segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

