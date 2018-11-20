#lang racket
(require racket/stream)

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_50.rkt" stream-map-my))

(define my-stream (stream 1 2 3 4 5))

(define x (stream-first (stream-rest (stream-map (lambda (x) (* x x)) my-stream))))

(displayln x)

;; (define tests
;;   (test-suite
;;     "Test for exercise 3_50"
;;     (check-equal? solutions 1 "")
;;     (test-case
;;       "Case here"
;;       (check-equal? solutions 0 ""))))

;; (run-tests tests 'verbose)

