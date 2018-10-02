#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_68.rkt")
(require rackunit "../solutions/2_67.rkt")

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))
(define sample-message '(A D A B B C A))
(define sample-code '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define tests
  (test-suite
    "Test for exercise 2_67"
    (check-equal? (encode sample-message sample-tree) sample-code)))

(run-tests tests 'verbose)

