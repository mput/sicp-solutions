#! /usr/local/bin/csi -s
(use sicp)

(define (compose fun1 fun2)
  (lambda (x) (fun1 (fun2 x))))

(define (inc x) (+ 1 x))

(print ((compose square inc) 6))

