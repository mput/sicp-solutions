#lang racket
#| Solution for exercise 2_66. |#

(require rackunit "../solutions/2_63.rkt")
(provide make-record key value lookup)

(define (make-record key value)
  (cons key value))

(define (key record)
  (car record))

(define (value record)
  (cdr record))

(define (lookup given-key records)
  (cond ((null? records)
         false)
        ((= given-key (key (entry records)))
         (entry records))
        ((< given-key (key (entry records)))
         (lookup given-key (left-branch records)))
        ((> given-key (key (entry records)))
         (lookup given-key (right-branch records)))))

