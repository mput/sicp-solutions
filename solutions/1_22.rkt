#lang racket
#| Solution for exercise 1_22. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_21.rkt")
(provide prime? find-primes)

(define (prime? n)
  (= (smallest-divisor n) n))

(define (report-if-prime proc number)
  (define start-time (current-inexact-milliseconds))
  (cond ((proc number)
         (displayln (list (object-name proc) number 'time: (- (current-inexact-milliseconds) start-time)))
         true)
        (else false)))

(define (find-primes proc from amount)
  (define start-value (if (even? from) (+ from 1) from))
  (define (find-iter next-check left-to-find)
    (if (= 0 left-to-find)
      true
      (if (report-if-prime proc next-check)
        (find-iter (+ next-check 1) (- left-to-find 1))
        (find-iter (+ next-check 1) left-to-find))))
  (find-iter start-value amount))
