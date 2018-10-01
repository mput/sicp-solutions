#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_63.rkt")

(define mt make-tree)

(define test-set '(1 3 5 7 9 11))

(define tree1 (mt 7
                  (mt 3
                      (mt 1 '() '())
                      (mt 5 '() '()))
                  (mt 9
                      '()
                      (mt 11 '() '()))))

(define tree2 (mt 3
                  (mt 1 '() '())
                  (mt 7
                      (mt 5 '() '())
                      (mt 9
                          '()
                          (mt 11 '() '())))))

(define tree3 (mt 5
                  (mt 3
                      (mt 1 '() '())
                      '())
                  (mt 9
                      (mt 7 '() '())
                      (mt 11 '() '()))))

(define tests
  (test-suite
    "Test for exercise 2_63"
    (test-case
      "Check tree->list (1)"
      (check-equal? (tree->list tree1) test-set)
      (check-equal? (tree->list tree2) test-set)
      (check-equal? (tree->list tree3) test-set))
    (test-case
      "Check tree->list (2)"
      (check-equal? (tree->list2 tree1) test-set)
      (check-equal? (tree->list2 tree2) test-set)
      (check-equal? (tree->list2 tree3) test-set))))

(run-tests tests 'verbose)

