#lang sicp
(#%require rackunit "../solutions/1_02.rkt")
(#%require rackunit/text-ui)

(define tests
  (test-suite
    "Expression should be equal to "
    (check-equal? expression (/ -37 150) "Is expression equal to -37/150?")))

(run-tests tests 'verbose)

