#lang sicp
#| Solution for exercise 3_21. |#

(#%require (only racket/base displayln display))

(#%provide make-queue front-queue insert-queue! delete-queue! empty-queue? print-queue)

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))

(define (print-queue queue)
  (define (helper-print list first)
    (cond ((null? list) (displayln ""))
          (first (display (car list)) (helper-print (cdr list) false))
          (else (display "->") (display (car list))  (helper-print (cdr list) false))))
  (if (empty-queue? queue)
    (displayln "Empty queue.")
    (helper-print (front-ptr queue) true)))
