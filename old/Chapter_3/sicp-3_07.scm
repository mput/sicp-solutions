#! /usr/local/bin/csi -s
(use sicp)

(define (make-account balance pass)
  (define (make-joint acc-password)
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
                ((eq? m 'make-joint) make-joint)
                (else (error "Unknown request -- MAKE-ACCOUNT" m)))
          (lambda (x) (print "Wrong password") "Wrong password")))
    dispatch)
  (make-joint pass))

(define (make-joint acc oldpass newpass)
  ((acc oldpass 'make-joint) newpass))


(define (make-account-tests)
  (print "make-account with 100")
  (define father (make-account 100 'mput))

  (print "Father deposit 40")
  (print ((father 'mput 'deposit) 40))
  (print ((father 'mput 'deposit) 40))

  (print "Make joint for Son")
  (define son (make-joint father 'mput 'kolya))

  (print "Son withdraw 50")
  (print ((son 'kolya 'withdraw) 50))
  (print "Father deposit 40")
  (print ((father 'mput 'deposit) 40))
  (print "Daughter try to make acc with wrong pass")
  (define daughter (make-joint father 'peeapa 'sara)))
  




(make-account-tests)

