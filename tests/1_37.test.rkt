#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_37.rkt")


(define e (/ 1 (cont-frac (lambda (x) 1) (lambda (x) 1) 12)))
(define e-iter (/ 1 (cont-frac-iter (lambda (x) 1) (lambda (x) 1) 12)))

(define tests
  (test-suite
    "Golden ratio with cont-frac"
    (check-true (aprox-equal-at e 1.6180 0.0001) "Recurcive process")
    (check-true (aprox-equal-at e-iter 1.6180 0.0001) "Iterative process")))

(run-tests tests 'verbose)

