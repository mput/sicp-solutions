#! /usr/local/bin/csi -s
(use sicp)

(define (isEqual list1 list2)
  (if (and (null? list1) (null? list2))
      #t
      (if (not (eq? (car list1) (car list2)))
          #f
          (isEqual (cdr list1) (cdr list2)))))

(print (isEqual '(Working class people) '(Working class people)))

(print (isEqual '(Working class people) '(Working (class people))))
