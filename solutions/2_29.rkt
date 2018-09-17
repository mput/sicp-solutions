#lang racket
#| Solution for exercise 2_29. |#

(require rackunit "../solutions/utils.rkt")
(provide make-mobile make-branch total-weight balanced?)

(define (make-mobile left-branch right-branch)
  (cons left-branch right-branch))

(define (make-branch len structure)
  (cons len structure))

(define (mobile? structure) (pair? structure))

(define (left-branch mobile) (car mobile))

(define (right-branch mobile) (cdr mobile))

(define (len branch) (car branch))

(define (structure branch) (cdr branch))


(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((struct (structure branch)))
    (if (mobile? struct)
      (total-weight struct)
      struct)))

(define (balanced? mobile)
  (define (branch-moment branch)
    (* (len branch) (branch-weight branch)))
  (if (not (mobile? mobile))
    true
    (let ((lb (left-branch mobile))
          (rb (right-branch mobile)))
      (and
        (= (branch-moment lb)
           (branch-moment rb))
        (and (balanced? (structure lb))
             (balanced? (structure rb)))))))

