#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_18.rkt")


(define (tests proc)
  (test-suite
    "simple suite"
    (check-equal? (proc 3 5) (* 3 5) "Simple mult")
    (check-equal? (proc 123 13423) (* 123 13423))
    (check-equal? (proc 5 123456789) (* 5 123456789))
    (check-equal? (proc 0 0) 0 "Zero case")
    (check-equal? (proc 23 1) (* 23 1) "Mult to one case")))

(run-tests (tests fast-mult-iter) 'verbose)
