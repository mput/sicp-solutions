#lang sicp

(#%require rackunit rackunit/text-ui)
(#%require racket/base)
(#%require "../solutions/3_21.rkt")


(define (print-test)
  (define queue (make-queue))
  (insert-queue! queue 1)
  (insert-queue! queue 2)
  (insert-queue! queue 3)
  (insert-queue! queue 4)
  (print-queue queue)

  (delete-queue! queue)
  (print-queue queue)

  (insert-queue! queue "New-in-tail")
  (delete-queue! queue)
  (print-queue queue)
  "Print test finished")

(print-test)


(define tests
  (test-suite
    "Test for exercise 3_21"
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

