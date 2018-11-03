#lang racket
#| Solution for exercise 3_18. |#

(require compatibility/mlist)

(define (element-of-set? elm set)
  (cond ((null? set) false)
        ((eq? elm (car set)) true)
        (else (element-of-set? elm (cdr set)))))

(define (adjoin-set elm set)
  (if (element-of-set? elm set)
    set
    (cons elm set)))

(provide has-cycle?)

(define (has-cycle? items)
  (let ((elm-set '()))
    (define (helper items)
      (cond ((null? items) false)
            ((element-of-set? (mcar items) elm-set) true)
            (else
              (set! elm-set (adjoin-set (mcar items) elm-set))
              (helper (mcdr items)))))
    (helper items)))
