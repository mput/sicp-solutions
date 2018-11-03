#lang racket
#| Solution for exercise 3_17. |#
(require compatibility/mlist)


(provide count-pairs)

(define (element-of-set? elm set)
  (cond ((null? set) false)
        ((eq? elm (car set)) true)
        (else (element-of-set? elm (cdr set)))))

(define (adjoin-set elm set)
  (if (element-of-set? elm set)
    set
    (cons elm set)))


(define (count-pairs x)
  (let ((counted-pairs-set  '()))
    (define (count-pairs-helper x)
      (cond ((not (mpair? x)) 0)
            ((element-of-set? x counted-pairs-set) 0)
            (else
              (set! counted-pairs-set (adjoin-set x counted-pairs-set))
              (+ (count-pairs-helper (mcar x))
                 (count-pairs-helper (mcdr x))
                 1))))
    (count-pairs-helper x)))


