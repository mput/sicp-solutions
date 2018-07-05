#lang racket
#| Solution for exercise 1_24. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_21.rkt")
(require rackunit "../solutions/1_22.rkt")
(require rackunit "../solutions/1_23.rkt")

(provide fast-prime? expmod)

(define (random-smaller-than a)
  (define max-a (if (> a (expt 10 9))
                  (expt 10 9)
                  a))
  (+ (random (- max-a 1)) 1))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
            (remainder (* (remainder base m) (expmod base (- exp 1) m))
                       m))))

(define (fast-prime? n)
  (prime-chesks n 10))

(define (prime-chesks number times)
  (cond ((= times 0) true)
        ((prime-check number) (prime-chesks number (- times 1)))
        (else false)))

(define (prime-check n)
  (define a (random-smaller-than n))
  (= (expmod a n n) a))





(find-primes prime? (expt 10 10) 3)
(find-primes prime? (expt 10 11) 3)

(find-primes better-prime? (expt 10 10) 3)
(find-primes better-prime? (expt 10 11) 3)

(find-primes fast-prime? (expt 10 10) 3)
(find-primes fast-prime? (expt 10 12) 3)



#| $ make test e=1_24
racket tests/1_24.test.rkt
(prime? 10000000019 time: 2.1162109375)
(prime? 10000000033 time: 2.094970703125)
(prime? 10000000061 time: 2.1181640625)
#t
(prime? 100000000003 time: 6.75390625)
(prime? 100000000019 time: 6.802001953125)
(prime? 100000000057 time: 6.762939453125)
#t
(better-prime? 10000000019 time: 1.07080078125)
(better-prime? 10000000033 time: 1.07421875)
(better-prime? 10000000061 time: 1.0810546875)
#t
(better-prime? 100000000003 time: 3.43896484375)
(better-prime? 100000000019 time: 3.43701171875)
(better-prime? 100000000057 time: 3.56298828125)
#t
(fast-prime? 10000000019 time: 0.39404296875)
(fast-prime? 10000000033 time: 0.151123046875)
(fast-prime? 10000000061 time: 0.140869140625)
#t
(fast-prime? 1000000000039 time: 0.2412109375)
(fast-prime? 1000000000061 time: 0.2470703125)
(fast-prime? 1000000000063 time: 0.25)
#t |#
