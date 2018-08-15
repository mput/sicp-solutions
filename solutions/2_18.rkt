#lang racket
#| Solution for exercise 2_18. |#

(require rackunit "../solutions/utils.rkt")
(provide reverse reverse-iter)

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items)) (list (car items)))))

(define (reverse-iter items)
  (define (helper acc rest)
    (if  (null? rest)
      acc
      (helper (cons (car rest) acc) (cdr rest))))
  (helper '() items))
