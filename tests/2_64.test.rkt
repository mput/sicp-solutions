#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_63.rkt")
(require rackunit "../solutions/2_64.rkt")

(define mt make-tree)

(define test-set '(1 3 5 7 9 11))

(define tree3 (mt 5
                  (mt 1
                      '()
                      (mt 3 '() '()))
                  (mt 9
                      (mt 7 '() '())
                      (mt 11 '() '()))))

(define tests
  (test-suite
    "Test for exercise 2_63"
    (test-case
      "Check list->tree"
      (check-equal? (list->tree test-set) tree3))))

(run-tests tests 'verbose)

