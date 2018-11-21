#lang racket
(require racket/stream)

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_50.rkt" streams-map))

(define my-stream (stream 1 2 3 4 5))
(define my-stream2 (stream 10 20 30 40 50))



(define tests
  (test-suite
    "Test for exercise 3_50"
    (test-case
      "Case here"
      (define x (stream-first (stream-rest (streams-map (lambda (x y) (* x y)) my-stream my-stream2))))
      (check-equal? x 40))))

(run-tests tests 'verbose)
