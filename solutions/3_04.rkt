#lang racket
#| Solution for exercise 3_04. |#

(provide make-account)

(define (make-account balance password cops-proc)
  (let ((wrong-attempt 0))
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
        (begin
          (set! wrong-attempt 0)
          (cond ((eq? op 'withdrow) withdrow)
                ((eq? op 'deposit) deposit)
                (else "Wrong operation")))
        (begin
          (if (< wrong-attempt 3)
            (begin
              (set! wrong-attempt (+ wrong-attempt 1))
              (lambda (arg) "Wrong password"))
            (lambda (arg) (cops-proc))))))
    dispath))



