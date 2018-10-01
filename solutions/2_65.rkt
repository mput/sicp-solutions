#lang racket
#| Solution for exercise 2_65. |#

(require rackunit)
(require (only-in "../solutions/2_61.rkt" [instersection-set  instersection-set-for-sorted]))
(require (only-in "../solutions/2_62.rkt" [union-set union-set-for-sorted]))
(require (only-in "../solutions/2_63.rkt" [tree->list2 tree->list]))
(require (only-in "../solutions/2_64.rkt" list->tree))
(provide union-set instersection-set)


;; Should create set with elements from both sets.
(define (union-set set1 set2)
  (let ((listed-set1 (tree->list set1))
        (listed-set2 (tree->list set2)))
    (list->tree (union-set-for-sorted listed-set1 listed-set2))))

(define (instersection-set set1 set2)
  (let ((listed-set1 (tree->list set1))
        (listed-set2 (tree->list set2)))
    (list->tree (instersection-set-for-sorted listed-set1 listed-set2))))

