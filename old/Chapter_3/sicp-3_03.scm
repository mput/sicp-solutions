#! /usr/local/bin/csi -s
(use sicp)

(define (make-account balance acc-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch password m)
    (if (equal? password acc-password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT" m)))
        (lambda (x) "Wrong password")))
  dispatch)

(define my-acc (make-account 100 'mput))

(print ((my-acc 'mput 'withdraw) 40))
(print ((my-acc 'mput 'deposit) 100))

(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'mput 'withdraw) 160))
(print ((my-acc 'mput 'withdraw) 10))
