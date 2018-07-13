#lang racket
#| Solution for exercise 1_28. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_24.rkt")
(provide miller-robin-prime? mr-expmod)

(define (square-with-check num m)
  (define (check square-num)
    (if (and (= (remainder (square num) m) 1) (not (= num 1)) (not (= num (- m 1))))
      0
      (square num)))
  (check num))

(define (mr-expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square-with-check (expmod base (/ exp 2) m) m)
                      m))
          (else
            (remainder (* (remainder base m) (expmod base (- exp 1) m))
                       m))))


(define (miller-robin-prime? n)
  (miller-robin-chesks n 10))

(define (miller-robin-chesks number times)
  (cond ((= times 0) true)
        ((mr-prime-check number) (miller-robin-chesks number (- times 1)))
        (else false)))

(define (mr-prime-check n)
  (define a (random-smaller-than n))
  (= (mr-expmod a (- n 1) n) 1))

