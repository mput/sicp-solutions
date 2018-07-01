#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_11.rkt")


(define (tests-with-fn test-fn descripion)
  (test-suite
    descripion
    (check-equal? (test-fn 2) 2 "For n < 3 should return n")
    (check-equal? (test-fn 3) 4 "2 + 2* 1 + 3 * 0 = 4")
    (check-equal? (test-fn 4) 11 "Should be 11")
    (check-equal? (test-fn 5) 25 "Should be 25")
    (check-equal? (test-fn 6) 59 "Should be 59")))

(run-tests (tests-with-fn solution-rec "recursiv solution") 'verbose)
(run-tests (tests-with-fn solution-iter "iterative solution") 'verbose)

