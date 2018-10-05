#lang racket

(provide cons car cdr pair? set-car! set-cdr! list)

(define cons mcons)
(define car mcar)
(define cdr mcdr)
(define pair? mpair?)
(define set-car! set-mcar!)
(define set-cdr! set-mcdr!)

(define (list . items)
  (foldr cons '() items))

