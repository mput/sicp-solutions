#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_28.rkt")

(define miller-robin-prime?-test
  (test-suite
    "Test for (miller-robin-prime?)"
    (test-case
      "Tests for truzy"
     (check-true (miller-robin-prime? 2))
     (check-true (miller-robin-prime? 3))
     (check-true (miller-robin-prime? 7))
     (check-true (miller-robin-prime? 199))
     (check-true (miller-robin-prime? 900307)))
    (test-case
      "Tests for falsy"
     (check-false (miller-robin-prime? 4))  ;; Carmichle number, 561 = 3 * 11 * 7.
     (check-false (miller-robin-prime? 561))  ;; Carmichle number, 561 = 3 * 11 * 7.
     (check-false (miller-robin-prime? 60977817398996785))  ;; Carmichle number
     (check-false (miller-robin-prime? 1590231231043178376951698401))  ;; Carmichle number
     (check-false (miller-robin-prime? 9746347772161))  ;; Carmichle number
     (check-false (miller-robin-prime? 19999))
     (check-false (miller-robin-prime? 15))
     (check-false (miller-robin-prime? 900309)))))

(run-tests miller-robin-prime?-test 'verbose)

