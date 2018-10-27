#lang racket
#| Solution for exercise 3_03. |#

(provide make-accoutn)

(define (make-accoutn balance password)
  (define (withdrow amount)
    (if (< balance amount)
      "Not enough money"
      (begin (set! balance (- balance amount))
             balance)))
  (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
  (define (dispath pass op)
    (if (eq? pass password)
      (cond ((eq? op 'withdrow) withdrow)
            ((eq? op 'deposit) deposit)
            (else "Wrong operation"))
      (lambda (arg) "Wrong password")))
  dispath)


