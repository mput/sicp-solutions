#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_67.rkt")
(require rackunit "../solutions/2_68.rkt")
(require rackunit "../solutions/2_69.rkt")

(define tests
  (test-suite
    "Test for exercise 2_67"
    (test-case
      "Make huffman tree"
      (define symbol-freq-pairs (list (list 'D 1) (list 'B 2) (list 'A 4) (list 'C 1)))
      (define code-tree (generate-huffman-tree symbol-freq-pairs))
      (define sample-message '(A D A B B C A))
      (define encoded-mesage (encode sample-message code-tree))
      (define decoded-message (decode encoded-mesage code-tree))
      (check-equal? decoded-message sample-message))))

(run-tests tests 'verbose)

