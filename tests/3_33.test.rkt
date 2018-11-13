#lang racket

(require rackunit  rackunit/text-ui)
(require "../solutions/constraints.rkt")
(require "../solutions/3_33.rkt")


(define tests
  (test-suite
    "Test for exercise 3_33"
    (test-case
      "Case here"
      (define a (make-connector))
      (define b (make-connector))
      (define c (make-connector))
      (avereger a b c)

      (probe 'a a)
      (probe 'b b)
      (probe 'c c)
      (set-value! a 16 'user)
      (set-value! b 10 'user)
      (check-equal? (get-value c) 13)

      (forget-value! b 'user)
      (set-value! c 13 'user)
      (check-equal? (get-value b) 10))))

(run-tests tests 'verbose)

