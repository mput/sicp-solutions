#lang racket

(require rackunit  rackunit/text-ui)
(require "../solutions/constraints.rkt")
(require "../solutions/3_37.rkt")


(define tests
  (test-suite
    "Test for exercise 3_33"
    (test-case
      "Case here"
      (define C (make-connector))
      (define F (celsius-farengheit-converter C))
      (probe 'C C)
      (probe 'F F)

      (set-value! C 90 'user)
      (check-equal? (get-value F) 194)

      (forget-value! C 'user)
      (set-value! F 32 'user)
      (check-equal? (get-value C) 0)

      (forget-value! F 'user)
      (set-value! F 95 'user)
      (check-equal? (get-value C) 35))))

(run-tests tests 'verbose)

