#lang racket
#| Solution for exercise 2_23. |#

(require rackunit "../solutions/utils.rkt")

(define (for-each proc items)
  (cond ((null? items) items)
    (else
      (proc (car items))
      (for-each proc (cdr items)))))

(define-logger my-log)

(define (log-item item)
  (log-my-log-info (number->string item)))

(define (log-list items)
  (for-each log-item items))

(log-list (list 23 12 1 32 53))
