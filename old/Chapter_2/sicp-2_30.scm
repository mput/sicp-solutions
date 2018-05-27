#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (square-tree_ tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons
                    (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree) 
         (if (pair? sub-tree)
             (square-tree sub-tree) 
             (square sub-tree)))
       tree))

(define x (list (list 1 2) 10 (list 3 (list 5 6 7) 5)))

(print (square-tree x))
