#! /usr/local/bin/csi -s
(use sicp)

(define (call-the-cops count)
  (print count " attempt. Call to the cops")
  (lambda (x) "You are basted"))

(define (make-account balance acc-password)
  (let ((wrong-attempt-count 0))
       (begin (define (withdraw amount)
                (if (>= balance amount)
                    (begin (set! balance (- balance amount))
                          balance)
                    "Insufficient funds"))
              (define (deposit amount)
                (set! balance (+ balance amount))
                balance)
              (define (dispatch password m)
                (if (equal? password acc-password)
                    (begin
                      (set! wrong-attempt-count 0)
                      (cond ((eq? m 'withdraw) withdraw)
                            ((eq? m 'deposit) deposit)
                            (else (error "Unknown request -- MAKE-ACCOUNT" m))))
                    (begin (set! wrong-attempt-count (+ wrong-attempt-count 1))
                           (if (> wrong-attempt-count 6) 
                               (call-the-cops wrong-attempt-count)    
                               (lambda (x) "Wrong password")))))
              dispatch)))

(define my-acc (make-account 100 'mput))

(print ((my-acc 'mput 'withdraw) 40))
(print ((my-acc 'mput 'deposit) 100))

(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))

(print ((my-acc 'mput 'withdraw) 160))

(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))
(print ((my-acc 'kolya 'withdraw) 150))

