#lang racket
#| Solution for exercise 2_69. |#

(provide generate-huffman-tree)
(require rackunit (only-in "../solutions/2_67.rkt" make-leaf-set make-leaf make-code-tree adjoin-set))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (displayln leaf-set)
  (if (null? (cddr leaf-set))
      leaf-set
      (successive-merge
        (adjoin-set
          (make-code-tree (car leaf-set) (cadr leaf-set))
          (cddr leaf-set)))))
