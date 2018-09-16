#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_27.rkt")


(define tests
  (test-suite
    "Test for exercise 2_27"
    (test-case
      "deep reverse"
      (define list-of-lists (list (list 1 2) (list 3 4)))
      (define reversed-list (list (list 4 3) (list 2 1)))
      (check-equal? (deep-reverse list-of-lists) reversed-list))
    (test-case
      "deep reverse"
      (define list-of-lists (list (list 2 5) (list 6 (list 1 2))))
      (define reversed-list (list (list (list 2 1) 6) (list 5 2)))
      (check-equal? (deep-reverse list-of-lists) reversed-list))))

(run-tests tests 'verbose)

