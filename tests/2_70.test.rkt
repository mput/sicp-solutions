#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_70.rkt")

(define song '(Get a job
               Sha na na na na na na na na
               Get a job
               Sha na na na na na na na na
               Wah yip yip yip yip yip yip yip yip yip
               Sha boom))

(define symbol-pair (list (cons 'a 2) (cons 'boom 1) (cons 'Get 2) (cons 'job 2)
                          (cons 'na 16) (cons 'Sha 3) (cons 'yip 9) (cons 'Wah 1)))

(define tests
  (test-suite
    "Test for exercise 2_70"
    (check-equal? solutions 1 "")
    (test-case
      "Case here"
      (check-not-equal? solutions 0 ""))))

(run-tests tests 'verbose)

