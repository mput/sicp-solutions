#lang racket
#| Solution for exercise 1_29. |#

(require rackunit "../solutions/utils.rkt")
(provide simpson-int sum)

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpson-int fun a b n)
  (define (inc n) (+ n 1))
  (define H (/ (- b a) n))
  (define (koef kn)
    (cond ((or (= kn 0) (= kn n)) 1)
          ((even? kn) 2)
          (else 4)))
  (define (term k)
    (* (koef k)
       (fun (+ a
               (* k H)))))
  (* (/ H 3)
     (sum term 0 inc n)))

#| (displayln (simpson-int cube 0 1.0 100)) |#
#| (displayln (simpson-int cube 0 1.0 1000)) |#
#| 0.24999999999999992 |#
#| 0.2500000000000003 |#
