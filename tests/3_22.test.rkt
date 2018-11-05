#lang sicp

(#%require rackunit rackunit/text-ui)
(#%require racket/base)
(#%require "../solutions/3_22.rkt")

(define tests
  (test-suite
    "Test for exercise 3_22"
    (test-case
      "Case here"
      (define queue (make-queue))
      (check-exn exn:fail? (lambda () (delete-queue! queue)))
      (insert-queue! queue 1)
      (insert-queue! queue 2)
      (check-equal? (front-queue queue) 1)
      (delete-queue! queue)
      (check-equal? (front-queue queue) 2)
      (delete-queue! queue)
      (check-true (empty-queue? queue))
      (check-exn exn:fail? (lambda () (delete-queue! queue))))))

(run-tests tests 'verbose)

