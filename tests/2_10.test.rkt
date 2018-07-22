#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_07.rkt")
(require rackunit "../solutions/2_10.rkt")


(define tests
  (test-suite
    "Test for exercise 2_10"
    (test-case
      "Check for divading on interval that cross Zero"
      (define int-1 (make-interval 4 6))
      (define int-2 (make-interval -1 1))
      (define int-3 (make-interval 1 2))
      (check-exn exn:fail? (lambda () (div-interval int-1 int-2)))
      (check-not-exn (lambda () (div-interval int-1 int-3))))))

(run-tests tests 'verbose)

