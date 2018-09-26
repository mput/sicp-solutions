#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_46.rkt")
(require rackunit "../solutions/2_47.rkt")

(define origin (make-vect 0.5 0.5))
(define edge1 (make-vect 10 5))
(define edge2 (make-vect -3 4))
(define a-frame (make-frame origin edge1 edge2))

(define tests
  (test-suite
    "Test for exercise 2_47"
    (test-case
      "Zero vect"
      (check-equal? ((frame-coord-map a-frame) (make-vect 0 0))
                    (origin-frame a-frame)))
    (test-case
      "Center vect"
      (check-equal? ((frame-coord-map a-frame) (make-vect 0.5 0.5))
                    (make-vect 4. 5.)))
    (test-case
      "Tests for selectrors"
      (check-equal? (origin-frame a-frame) origin)
      (check-equal? (edge1-frame a-frame) edge1)
      (check-equal? (edge2-frame a-frame) edge2))))

(run-tests tests 'verbose)

