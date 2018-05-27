#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (same-parity first . rest)
  (define first-remain (remainder first 2))
  (define (iter tail acc)
    (if (null? tail)
        acc
        (if (= (remainder (car tail) 2) first-remain)
            (iter (cdr tail) (append acc (list (car tail))))
            (iter (cdr tail) acc))))
  (iter rest (list first)))

(print (same-parity 1 2 3 4 2 3 5 74 2 1))

(print (same-parity 8 2 3 4 2 3 5 74 2 1))

      
