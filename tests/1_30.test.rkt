#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_30.rkt")

(define (inc a) (+ a 1))

(define tests
  (test-suite
    "simple suite"
    (check-equal? (sum-iter cube 1 inc 10) 3025 "Simple addition")))

(run-tests tests 'verbose)

