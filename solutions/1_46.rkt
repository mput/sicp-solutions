#lang racket
#| Solution for exercise 1_46. |#

(require rackunit "../solutions/utils.rkt")
(provide iterative-improve my-sqrt fixed-point)

(define (iterative-improve check-fn improve-fn)
  (define (next-improve guess)
    (if (check-fn guess)
      guess
      (next-improve (improve-fn guess))))
  next-improve)

(define (average a b) (/ (+ a b) 2))

(define (my-sqrt x)
  (define find-sqrt-from
    (iterative-improve
      (lambda (guess) (aprox-equal-at (square guess) x 0.0001))
      (lambda (guess) (average guess (/ x guess)))))
  (find-sqrt-from 2.0))

(define (fixed-point fn)
  (define fixed-point-from
    (iterative-improve
       (lambda (guess) (aprox-equal-at guess (fn guess) 0.0001))
       (lambda (guess) (fn guess))))
  (fixed-point-from 1))

