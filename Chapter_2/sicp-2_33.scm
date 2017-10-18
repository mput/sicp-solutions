#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(define test-list (list 1 2 3 4 5))
(define test-list2 (list 22 23 43 54))
(print (map square test-list))
(print (append test-list test-list2))
(print (length test-list))


