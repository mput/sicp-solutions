#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_33.rkt")
(require rackunit "../solutions/1_28.rkt")


(define (sum-of-prime-squares a b)
  (define (next a) (+ a 1))
  (define (combine a b) (+ a b))
  (filter-accumulate combine miller-robin-prime? 0 square a next b))

(define (smallest-common-diveder a b)
  (if (= b 0)
    a
    (smallest-common-diveder b (remainder a b))))

(define (product-of-prim-to n)
  (define (nod-to-n-is-one? a)
    (= (smallest-common-diveder n a) 1))
  (define (prod a b) (* a b))
  (define (inc a) (+ a 1))
  (filter-accumulate prod nod-to-n-is-one? 1 identity 1 inc n))

(define tests
  (test-suite
    "simple suite"
    (test-case
      "Sums-of-primes"
      (check-equal? (sum-of-prime-squares 2 10) 87 "Simple addition"))
    (test-case
      "Product of prime to n"
      (check-equal? (product-of-prim-to 10) 189 "Simple addition"))))

(run-tests tests 'verbose)

