#! /usr/local/bin/csi -s
(use sicp)

(define test-list (list 23 72 149 34))

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

(print (last-pair test-list))