#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_32.rkt")

(define (pi-calculated fun)
  (define (term a) (/ (* a (+ a 2))
                      (square (+ a 1))))
  (define (next a) (+ a 2))
  (* 4 (fun term 2.0 next 1000)))

(define (product term a next b)
  (define (combiner a b) (* a b))
  (accumulation-iter 1 combiner term a next b))


(define (sum term a next b)
  (define (combiner a b) (+ a b))
  (accumulation 0 combiner term a next b))

(define (sum-cubes a b)
  (define (inc a) (+ a 1))
  (sum cube a inc b))


(define tests
  (test-suite
    "simple suite"
    (check-true (aprox-equal-at
                  (pi-calculated product)
                  pi
                  0.01))
    (check-equal? (sum-cubes 1 10) 3025)))

(run-tests tests 'verbose)
