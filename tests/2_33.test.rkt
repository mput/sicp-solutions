#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/2_33.rkt")


(define tests
  (test-suite
    "Test for exercise 2_33"
    (test-case
      "Map through accumulate"
      (define seq (list 1 2 3 4 5))
      (check-equal? (custom-map square seq) (map square seq)))
    (test-case
      "Append through accumulate"
      (define seq1 (list 1 2 3 4 5))
      (define seq2 (list 6 7 9 10))
      (check-equal? (custom-append seq1 seq2) (append seq1 seq2)))
    (test-case
      "length through accumulate"
      (define seq1 (list 1 2 3 4 5))
      (check-equal? (custom-length seq1) 5))))

(run-tests tests 'verbose)

