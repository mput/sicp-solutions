#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define x (list (list 1 2) (list 3 4 5) (list 6 7 8) (list 9 10 11)))


(define (deep-rev list)
  (cond ((null? list) list)
        ((not (pair? list)) list)
        (else (append (deep-rev (cdr list)) 
                      (cons (deep-rev (car list)) nil)))))

(print (deep-rev x))
