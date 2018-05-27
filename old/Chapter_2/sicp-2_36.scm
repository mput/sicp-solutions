#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define list-of-lists (list (list 1 2 3 4) (list 2 3 4 5)))

(print (accumulate-n + 0 list-of-lists))
