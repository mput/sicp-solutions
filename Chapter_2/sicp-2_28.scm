#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define x (list (list 1 2) (list 3 4)))

(define (fringe list)
  (cond ((null? list) list)
        ((pair? list) (car list))
        (else (cons list))))
