#lang racket
#| Solution for exercise 2_39. |#

(require rackunit "../solutions/utils.rkt")
(provide reverse-rf reverse-lf)

(define (reverse-lf items)
  (foldl (lambda (item acc)
           (cons item acc)) '() items))

(define (reverse-rf items)
  (foldr (lambda (item acc)
           (append acc (list item)))
         (list)
         items))
