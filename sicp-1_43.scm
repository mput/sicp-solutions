#! /usr/local/bin/csi -s
(use sicp)


(define (compose fun1 fun2)
  (lambda (x) (fun1 (fun2 x))))


(define (repeted fun n)
        (if (> n 0)
            (compose fun (repeted fun (- n 1)))
            (lambda (x) x)))

(print ((repeted square 2) 5))

    
  
