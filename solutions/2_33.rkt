#lang racket
#| Solution for exercise 2_33. |#

(require rackunit "../solutions/utils.rkt")
(provide custom-map custom-append custom-length)

(define (custom-map proc items)
  (foldl (lambda (item acc)
           (append acc (list (proc item))))
         (list)
         items))

(define (custom-append seq1 seq2)
  (foldl cons seq2 (reverse seq1)))

(define (custom-length seq1)
  (foldl (lambda (x acc) (+ acc 1)) 0 seq1))
