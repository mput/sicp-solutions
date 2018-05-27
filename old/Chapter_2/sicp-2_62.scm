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


(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1))
                    (x2 (car set2)))
                (cond ((= x1 x2)
                       (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2)
                       (cons x1 (union-set (cdr set1) set2)))
                      (else
                       (cons x2 (union-set set1 (cdr set2)))))))))
;; Test print:

(print (union-set '(1 6) '(3 5)))
(print (union-set '(1 3 6) '(2 3 4 7)))
