#lang racket
#| Solution for exercise 3_07. |#

(provide make-accoutn make-joint)

(define (make-accoutn balance password)
  (define (withdrow amount)
    (if (< balance amount)
      "Not enough money"
      (begin (set! balance (- balance amount))
             balance)))
  (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
  (define (check-pass pass) (eq? pass password))
  (define (proc-or-wrong-pass proc pass) (eq? pass password)
      (if (check-pass pass)
        proc
        (lambda (arg) "Wrong password")))
  (define (dispath pass op)
    (cond ((eq? op 'withdrow) (proc-or-wrong-pass withdrow pass))
          ((eq? op 'deposit) (proc-or-wrong-pass deposit pass))
          ((eq? op 'check-pass) (check-pass pass))))
  dispath)

(define (make-joint acc old-pass new-pass)
  (if (acc 'check-pass old-pass)
    (lambda (pass op)
      (if (eq? pass new-pass)
        (acc old-pass op)
        (lambda (arg) "Wrong password")))
    "Wrong password"))
