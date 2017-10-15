#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-1 (cdr items)))))


(print (square-list-1 (list 1 2 3 4)))

(define (square-list items)
  (map square items))

(print (square-list (list 1 2 3 4)))
