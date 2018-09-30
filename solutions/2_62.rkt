#lang racket
#| Solution for exercise 2_62. |#

(require rackunit "../solutions/utils.rkt")
(provide union-set)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
          (let ((head1 (car set1))
                (head2 (car set2))
                (tail1 (cdr set1))
                (tail2 (cdr set2)))
            (cond ((< head1 head2)
                   (cons head1 (union-set tail1 set2)))
                  ((< head2 head1)
                   (cons head2 (union-set set1 tail2)))
                  ((= head1 head2)
                   (cons head1 (union-set tail1 tail2))))))))
