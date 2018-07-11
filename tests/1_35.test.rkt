#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_35.rkt")


(define tests
  (test-suite
    "Check golden ration"
    (check-true (aprox-equal-at golden-ratio 1.618 0.001))))

(run-tests tests 'verbose)

