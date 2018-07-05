#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_23.rkt")

(define better-prime?-test
  (test-suite
    "Test for (better-prime?)"
    (test-case
      "Tests for truzy"
     (check-true (better-prime? 7))
     (check-true (better-prime? 199))
     (check-true (better-prime? 900307)))
    (test-case
      "Tests for truzy"
     (check-false (better-prime? 19999))
     (check-false (better-prime? 15))
     (check-false (better-prime? 900309)))))


(run-tests better-prime?-test 'verbose)

