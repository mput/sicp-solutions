#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))


(define test-list (list 1 2 3 4 5 6 7))

(define (reverse-iter list)
  (define (iter-rev list acc)
          (if (null? list)
              acc
              (iter-rev (cdr list) (cons (car list) acc))))
  (iter-rev list nil))

(print (reverse-iter test-list))



(define (reverse list)
  (if (null? (cdr list))
      list
      (append (reverse (cdr list)) (cons (car list) nil))))

(print (reverse test-list))