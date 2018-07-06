#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_24.rkt")


(define expmod-test
  (test-suite
    "Test for (expmod)"
    (check-equal? (expmod 4 30 6) 4)
    (check-equal? (expmod 7 21 5) (remainder (expt 7 21) 5))
    (check-equal? (expmod 9 35 6) (remainder (expt 9 35) 6))))


(define fast-prime?-test
  (test-suite
    "Test for (fast-prime?)"
    (test-case
      "Tests for truzy"
     (check-true (fast-prime? 7))
     (check-true (fast-prime? 199))
     (check-true (fast-prime? 900307))
     (check-true (fast-prime? 561))  ;; Carmichle number, 561 = 3 * 11 * 7.
     (check-true (fast-prime? 60977817398996785))  ;; Carmichle number
     (check-true (fast-prime? 1590231231043178376951698401))  ;; Carmichle number
     (check-true (fast-prime? 9746347772161)))  ;; Carmichle number
    (test-case
      "Tests for falsy"
     (check-false (fast-prime? 19999))
     (check-false (fast-prime? 15))
     (check-false (fast-prime? 900309)))))


(run-tests expmod-test 'verbose)
(run-tests fast-prime?-test 'verbose)

