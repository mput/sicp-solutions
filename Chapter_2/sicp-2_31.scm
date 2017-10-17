#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (tree-map_ fn tree)
  (map (lambda (sub-tree)
               (if (pair? sub-tree)
                   (tree-map fn sub-tree)
                   (fn sub-tree)))
       tree))

(define (tree-map fn tree)
        (cond ((null? tree) tree)
              ((pair? tree) (cons (tree-map fn (car tree))
                                  (tree-map fn (cdr tree))))
              (else (fn tree))))

(define x (list (list 1 2) 10 (list 3 (list 5 6 7) 5)))
(define (square-tree tree) (tree-map square tree))
(print (square-tree x))
