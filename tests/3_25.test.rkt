#lang sicp

(#%require rackunit rackunit/text-ui)
(#%require racket/base)
(#%require "../solutions/3_25.rkt")

(define tests
  (test-suite
    "Test for exercise 3_25"
    (test-case
      "Case here"
      (define (same-key? a b) (eq? a b))
      (define op-table (make-table same-key?))
      (define put (op-table 'insert!))
      (define get (op-table 'lookup))
      (put 1 'a 'b)
      (check-equal? (get 'a 'b) 1)
      (put 2 'a 'c)
      (check-equal? (get 'a 'c) 2)
      (put 3 'c 'c)
      (check-equal? (get 'c 'c) 3)
      (put 5 'a 'b)
      (check-equal? (get 'a 'b) 5))
    (test-case
      "Case here"
      (define (same-key? a b) (eq? a b))
      (define op-table (make-table same-key?))
      (define put (op-table 'insert!))
      (define get (op-table 'lookup))
      (put 1 'a)
      (put 11 'b)
      (check-equal? (get 'a) 1)
      (put 2 'a 'c)
      (check-equal? (get 'a 'c) 2)
      (put 3 'a 's)
      (check-equal? (get 'a 's) 3)
      (put 33 'a 'c 'b 'd)
      (check-equal? (get 'a 's) 3)
      (check-equal? (get 'a 'c 'b 'd) 33)
      (put 5 'a)
      (check-equal? (get 'a) 5)
      (check-equal? (get 'b) 11))))

(run-tests tests 'verbose)

