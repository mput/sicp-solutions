#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_07.rkt" make-accoutn make-joint))

(define tests
  (test-suite
    "Test for exercise 3_03"
    (test-case
      "Test for make-accoutn"
      (define acc (make-accoutn 100 'pass))
      (define child-acc (make-joint acc 'pass 'child-pass))
      ((child-acc 'child-pass 'withdrow) 30)
      ((child-acc 'child-pass 'deposit) 50)
      (check-equal? ((child-acc 'child-pass 'withdrow) 120) 0)
      (check-equal? ((child-acc 'child-pass 'withdrow) 120) "Not enough money")
      (check-equal? ((child-acc 'wrong-pass 'deposit) 120) "Wrong password")
      (check-equal? ((child-acc 'child-pass 'deposit) 30) 30)
      (check-equal? ((acc 'pass 'withdrow) 10) 20) "Old and joint acc is equal")))

(run-tests tests 'verbose)

