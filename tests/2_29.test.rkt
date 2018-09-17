#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_29.rkt")


(define tests
  (test-suite
    "Test for exercise 2_29"
    (test-case
      "Balanced submobile"
      (define left-branch (make-branch 9 5))

      (define right-left-subbranch (make-branch 2 6))
      (define right-right-subbranch (make-branch 4 3))
      (define right-submobile (make-mobile right-left-subbranch right-right-subbranch))

      (define right-branch (make-mobile 5 right-submobile))
      (define mobile (make-mobile left-branch right-branch))
      (check-equal? (total-weight mobile) (+ 5 6 3))
      (check-true (balanced? mobile)))
    (test-case
      "Not Balanced"
      (define left-branch (make-branch 9 5))

      (define right-left-subbranch (make-branch 3 6))
      (define right-right-subbranch (make-branch 4 3))
      (define right-submobile (make-mobile right-left-subbranch right-right-subbranch))

      (define right-branch (make-mobile 5 right-submobile))
      (define mobile (make-mobile left-branch right-branch))
      (check-equal? (total-weight mobile) (+ 5 6 3))
      (check-false (balanced? mobile)))))

(run-tests tests 'verbose)

