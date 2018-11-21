#lang sicp
(#%require sicp)
(#%provide stream-car stream-cdr stream-enumerate-interval stream-ref stream-filter stream-map display-stream)

(define (stream-car x) (car x))
(define (stream-cdr x) (force (cdr x)))

(define (stream-enumerate-interval min max)
  (if (> min max)
    the-empty-stream
    (cons-stream
      min
      (stream-enumerate-interval (+ min 1) max))))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-filter pred seq)
  (cond ((stream-null? seq) seq)
        ((pred (stream-car seq)) (cons-stream (stream-car seq) (stream-filter pred (stream-cdr seq))))
        (else (stream-filter pred (stream-cdr seq)))))

(define (stream-map proc stream)
  (if (stream-null? stream)
    stream
    (cons-stream
      (proc (stream-car stream))
      (stream-map proc (stream-cdr stream)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

#| Solution for exercise 3_51. |#
(define (show x)
  (display x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

;; (stream-ref x 5)
;; 0123455
;; (stream-ref x 7)
;; 677
