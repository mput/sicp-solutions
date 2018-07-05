#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_22.rkt")


(define prime?-test
  (test-suite
    "Test for (prime?)"
    (test-case
      "Tests for truzy"
     (check-true (prime? 7))
     (check-true (prime? 199))
     (check-true (prime? 900307)))
    (test-case
      "Tests for truzy"
     (check-false (prime? 19999))
     (check-false (prime? 15))
     (check-false (prime? 900309)))))

(run-tests prime?-test 'verbose)

