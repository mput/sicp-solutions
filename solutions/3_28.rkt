#lang sicp
#| Solution for exercise 3_28. |#

(#%provide or-gate)

(define (or-gate i1 i2 out)
  (define (or-action-proc)
    (let ((new-out-val (logical-or (get-signal i1) (get-signal i2))))
      (after-delay or-gate-delay
                   (lambda () (set-signal! out new-out-val)))))
  (add-action! i1 or-action-proc)
  (add-action! i2 or-action-proc)
  'ok)


(define (logical-or s t)
  (cond ((and (= s 1) (= t 1)) 1)
        ((and (= s 1) (= t 0)) 1)
        ((and (= s 0) (= t 1)) 1)
        ((and (= s 0) (= t 0)) 0)
        (else (error "Invalid signal" s))))
