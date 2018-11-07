#lang sicp

(#%require rackunit rackunit/text-ui)
(#%require racket/base)
(#%require "../solutions/3_24.rkt")



(define tests
  (test-suite
    "Test for exercise 3_24"
    (test-case
      "Case here"
      (define (same-key? a b) (eq? a b))
      (define op-table (make-table same-key?))
      (define put (op-table 'put))
      (define get (op-table 'get))

      (put 'a 'b 1)
      (check-equal? (get 'a 'b) 1)
      (put 'a 'c 2)
      (check-equal? (get 'a 'c) 2)
      (put 'c 'c 3)
      (check-equal? (get 'c 'c) 3)
      (put 'a 'b 5)
      (check-equal? (get 'a 'b) 5))))

(run-tests tests 'verbose)

