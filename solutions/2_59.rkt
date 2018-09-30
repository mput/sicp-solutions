#lang racket
#| Solution for exercise 2_59. |#

(provide element-of-set? adjoin-set union-set instersection-set)

(define (element-of-set? elm set)
  (cond ((null? set) false)
        ((equal? elm (car set)) true)
        (else (element-of-set? elm (cdr set)))))

(define (adjoin-set elm set)
  (if (element-of-set? elm set)
    set
    (cons elm set)))

(define (instersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1) (instersection-set (cdr set1) set2)))
        (else (instersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (union-set (cdr set1) (cons (car set1) set2)))))
