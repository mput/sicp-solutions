#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_31.rkt")


(define (pi-calculated fun)
  (define (term a) (/ (* a (+ a 2))
                      (square (+ a 1))))
  (define (next a) (+ a 2))
  (* 4 (fun term 2.0 next 1000)))


(define tests
  (test-suite
    "simple suite"
    (check-true (aprox-equal-at
                  (pi-calculated product)
                  pi
                  0.01))
    (check-true (aprox-equal-at
                  (pi-calculated product-reqursive)
                  pi
                  0.01))))

(run-tests tests 'verbose)

