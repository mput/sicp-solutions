#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_28.rkt")

(define tests
  (test-suite
    "Test for exercise 2_28"
    (test-case
      "fringe"
      (define list-of-lists (list (list 1 2) (list 3 4)))
      (define fringed-list (list 1 2 3 4))
      (check-equal? (fringe list-of-lists) fringed-list))
    (test-case
      "deep reverse"
      (define list-of-lists (list (list 2 5) (list 6 (list 1 2))))
      (define fringed-list (list 2 5 6 1 2))
      (check-equal? (fringe list-of-lists) fringed-list))))

(run-tests tests 'verbose)

