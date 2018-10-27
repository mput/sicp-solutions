#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_02.rkt" make-monitored))


(define tests
  (test-suite
    "Test for exercise 3_02"
    (test-case
      "Tests for make-monitored"
      (define square-monitored (make-monitored (lambda (x) (* x x))))
      (square-monitored 2)
      (square-monitored 3)
      (check-equal? (square-monitored 2) 4)
      (check-equal? (square-monitored 'how-many-calls?) 3)
      (square-monitored 'reset-count)
      (check-equal? (square-monitored 'how-many-calls?) 0)
      (square-monitored 3)
      (check-equal? (square-monitored 'how-many-calls?) 1))))

(run-tests tests 'verbose)

