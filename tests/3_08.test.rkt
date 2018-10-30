#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_08.rkt" f-maker))

(define f (f-maker))
(define fr (f-maker))

(define tests
      (test-suite
        "Test for exercise 3_08"
        (check-equal? (+ (f 0) (f 1)) 0)
        (check-equal? (+ (fr 1) (fr 0)) 1)))

(run-tests tests 'verbose)

