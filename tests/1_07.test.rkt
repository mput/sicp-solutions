#lang racket
(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_07.rkt")


(define (aprox-equal? arg1 arg2) (aprox-equal-at arg1 arg2 0.0001))

(define tests
  (test-suite
    "Test my-sqrt function"
    (test-case
      "Normal numbers"
          (check-true (aprox-equal? (my-sqrt 9) (sqrt 9)))
          (check-true (aprox-equal? (square (my-sqrt 15)) 15)))
    (test-case
      "Small numbers"
            (check-true (aprox-equal? (my-sqrt 0.8) (sqrt 0.8))))
    (test-case
      "Case here"
            (check-true (aprox-equal? (my-sqrt 400) (sqrt 400))))))

(run-tests tests 'verbose)

