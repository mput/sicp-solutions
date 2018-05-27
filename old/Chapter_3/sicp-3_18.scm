#! /usr/local/bin/csi -s
(use sicp)

(define (hasCycle? pair)
  (define (iter rest)
    (cond ((eq? rest pair) #t)
          ((null? rest) #f)
          (else (iter (cdr rest)))))
  (iter (cdr pair)))



(define list1 (list 'a 'b 'c))

(print (hasCycle? list1))

(set-cdr! (cddr list1) list1)

(print (hasCycle? list1))


