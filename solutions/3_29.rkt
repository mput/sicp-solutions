#lang sicp
#| Solution for exercise 3_29. |#
#| or gate on and-gate and three inverts. |#


(#%provide or-gate)

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (logical-and s t)
  (cond ((and (= s 1) (= t 1)) 1)
        ((and (= s 1) (= t 0)) 0)
        ((and (= s 0) (= t 1)) 0)
        ((and (= s 0) (= t 0)) 0)
        (else (error "Invalid signal" s))))


(define (or-gate in1 in2 out)
  (let ((a (make-wire))
        (b (make-wire))
        (c (make-wire)))
    (inverter in1 a)
    (inverter in2 b)
    (and-gate a b c)
    (inverter c out)
    'ok))
