#lang racket
#| Solution for exercise 2_63. |#

(require rackunit "../solutions/utils.rkt")
(provide make-tree entry left-branch right-branch element-of-set? adjoin-set tree->list tree->list2)

(define (make-tree entry left right) (list entry left right))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set)
         (make-tree x '() '()))
        ((= x (entry set))
         set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (tree->list tree)
  (if (null? tree)
    '()
    (append (tree->list (left-branch tree))
            (cons (entry tree)
                  (tree->list (right-branch tree))))))


(define (tree->list2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree) result-list)))))
  (copy-to-list tree '()))



