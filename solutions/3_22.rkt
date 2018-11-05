#lang sicp
#| Solution for exercise 3_21. |#

(#%provide make-queue front-queue insert-queue! delete-queue! empty-queue?)

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?) (null? front-ptr))

    (define (front-queue)
      (if (empty-queue?)
        (error "FRONT called with an empty queue")
        (car front-ptr)))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (if (empty-queue?)
          (begin
            (set! front-ptr new-pair)
            (set! rear-ptr new-pair))
          (begin
            (set-cdr! rear-ptr new-pair)
            (set! rear-ptr new-pair)))))

    (define (delete-queue!)
      (if (empty-queue?)
        (error "DELETE! called with an empty queue")
        (set! front-ptr (cdr front-ptr))))

    (define (dispatch m)
      (cond ((eq? m 'front-queue) front-queue)
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'empty-queue?) empty-queue?)))
    dispatch))

(define (front-queue queue)
  ((queue 'front-queue)))

(define (insert-queue! queue item)
  ((queue 'insert-queue!) item))

(define (delete-queue! queue)
  ((queue 'delete-queue!)))

(define (empty-queue? queue)
  ((queue 'empty-queue?)))
