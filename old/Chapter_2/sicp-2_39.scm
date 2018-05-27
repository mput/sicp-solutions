#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))


(define (_reverse seq)
  (fold-left (lambda (x y) (cons x y)) nil seq))

(define (reverse seq)
  (accumulate (lambda (x y) (append y (cons x nil))) nil seq))


(define tl (list 1 2 3 4))

(print (reverse tl))







