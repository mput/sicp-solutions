#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_03.rkt" make-accoutn))


(define tests
  (test-suite
    "Test for exercise 3_03"
    (test-case
      "Test for make-accoutn"
      (define acc (make-accoutn 100 'pass))
      ((acc 'pass 'withdrow) 30)
      ((acc 'pass 'deposit) 50)
      (check-equal? ((acc 'pass 'withdrow) 120) 0)
      (check-equal? ((acc 'pass 'withdrow) 120) "Not enough money")
      (check-equal? ((acc 'wrong-pass 'deposit) 120) "Wrong password")
      (check-equal? ((acc 'pass 'deposit) 30) 30))))

(run-tests tests 'verbose)

