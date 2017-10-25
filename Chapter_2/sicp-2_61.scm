#! /usr/local/bin/csi -s
(use sicp)

(define (element-of-set? x set)
    (cond ((null? set) #f)
          ((< x (car set)) #f)
          ((= x (car set)) #t)
          (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
      (cond ((null? set) (list x))
            ((= x (car set)) set)
            ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
            ((< x (car set)) (cons x  set))))
            

;; Test print:

(print (adjoin-set '4 '(3 5 6)))
(print (adjoin-set '5 '(3 5 6)))

