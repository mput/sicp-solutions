#lang racket
#| Solution for exercise 2_61. |#

(require rackunit "../solutions/utils.rkt")
(provide element-of-set? adjoin-set instersection-set)

(define (element-of-set? elm set)
  (cond ((null? set) false)
        ((< elm (car set)) false)
        ((= elm (car set)) true)
        (else (element-of-set? elm (cdr set)))))

(define (adjoin-set elm set)
  (cond ((null? set)
         (list elm))
        ((> elm (car set))
         (cons (car set) (adjoin-set elm (cdr set))))
        ((< elm (car set))
         (cons elm set))
        ((= elm (car set))
         set)))


(define (instersection-set set1 set2)
  (if (or (null? set1) (null? set2))
    '()
    (let ((head1 (car set1))
          (head2 (car set2))
          (tail1 (cdr set1))
          (tail2 (cdr set2)))
      (cond ((= head1 head2)
             (cons head1 (instersection-set tail1 tail2)))
            ((< head1 head2)
             (instersection-set tail1 set2))
            ((< head2 head1)
             (instersection-set set1 tail2))))))

