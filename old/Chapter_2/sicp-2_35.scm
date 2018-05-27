#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (count-leaves_ t)
  (print t)
  (accumulate (lambda (x y)
                      (+ y (if (pair? x) (count-leaves x) 1)))
    0 t))

(define (count-leaves t)
  (print t)
  (accumulate (lambda (x y)
                      (+ x y))
    0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))


(define list-of-lists (list (list 1 2 3 4) (list 2 3 (list 3 4) 4 5 8)))

(print (count-leaves list-of-lists))
