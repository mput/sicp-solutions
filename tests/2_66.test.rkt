#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_64.rkt")
(require rackunit "../solutions/2_66.rkt")

(define mr make-record)

(define records (list (mr 1 'hello) (mr 2 'i) (mr 3 'love) (mr 5 'can) (mr 7 'you) (mr '9 'give)))

(define records-tree (list->tree records))


(define tests
  (test-suite
    "Test for exercise 2_66"
    (test-case
      "Case here"
      (check-equal? (value (lookup 3 records-tree)) 'love))))

(run-tests tests 'verbose)

