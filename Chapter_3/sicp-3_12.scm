#! /usr/local/bin/csi -s
(use sicp)

(define (last-pair pair)  
  (if (null? (cdr pair))
      pair
      (last-pair (cdr pair))))

(define (append! list1 list2)
  (set-cdr! (last-pair list1) list2)
  list1)

(define (test) 
  (print (append! (list 1 2 3 4) (list 5 6 7 8))))

(test)
