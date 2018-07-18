#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_02.rkt")
(require rackunit "../solutions/2_03.rkt")


(define tests
  (test-suite
    "Test for exercise 2_03"
    (test-case
      "Two dots rectangle representation"
      (define rectangle (make-rectangle-dots (make-point 1 2) (make-point 8 6)))
      (check-equal? (perimetr rectangle) 22)
      (check-equal? (area rectangle) 28))))

(run-tests tests 'verbose)

