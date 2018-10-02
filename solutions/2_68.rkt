#lang racket
#| Solution for exercise 2_68. |#

(require rackunit "../solutions/2_67.rkt")
(require (only-in "../solutions/2_59.rkt" element-of-set?))

(provide encode)

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))


(define (encode-symbol symbol tree)
  (let ((code-and-branch (get-code-branch symbol tree)))
    (let ((code (car code-and-branch))
          (branch (cdr code-and-branch)))
      (if (leaf? branch)
        (list code)
        (cons code (encode-symbol symbol branch))))))

(define (has-symbol? symbol branch)
  (element-of-set? symbol (symbols branch)))

(define (get-code-branch symbol tree)
  (let ((left (left-branch tree))
        (right (right-branch tree)))
    (cond ((has-symbol? symbol left) (cons 0 left))
          ((has-symbol? symbol right) (cons 1 right))
          (else  (error "bad symbol -- get-code" symbol)))))


