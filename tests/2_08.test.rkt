#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_08.rkt")
(require rackunit "../solutions/2_07.rkt")


(define tests
  (test-suite
    "Test for exercise 2_08"
    (test-case
      "Check substracting of intervals"
      (define int-1 (make-interval 9 11))
      (define int-2 (make-interval 7 9))
      (define result-int (sub-interval int-1 int-2))
      (check-equal? result-int (make-interval 0 4)))))

(run-tests tests 'verbose)

