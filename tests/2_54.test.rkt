#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_54.rkt")


(define tests
  (test-suite
    "Test for exercise 2_54"
    (test-case
      "Equal?"
      (check-true (my-equal? '(a b (c d) d) '(a b (c d) d)))
      (check-false (my-equal? '(a b c d d) '(a b (c d) d)))
      (check-false (my-equal? '(a) 'a))
      (check-true (my-equal? 'a 'a))
      (check-true (my-equal? '() '()))
      (check-false (my-equal? '() 'i)))))

(run-tests tests 'verbose)

