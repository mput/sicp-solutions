#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))


(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                      (except-first-denomination coin-values))
                (cc (- amount
                      (first-denomination coin-values))
                    coin-values)))))

(define (first-denomination kindsOfCoins) 
  (cond ((= kindsOfCoins 1) 5)
        ((= kindsOfCoins 2) 10)))

(define (no-more? coin-values)
  (null? coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))


(define us-coins (list 50 25 10 5 1))

(define rus-coins (list 10 5 2 1))

(print (cc 100 us-coins))
(print (cc 100 rus-coins))
