#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(print (car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))) 

(print (car (cdr (car (cdr (cdr '(1 3 (5 7) 9)))))))


(print (car (car '((7)))))


(print (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1(2(3(4(5(6 7)))))))))))))))))))
