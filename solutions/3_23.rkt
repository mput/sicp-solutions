#lang sicp
#| Solution for exercise 3_23. |#

(#%require (only racket/base displayln display))

(#%provide make-deque empty-deque?
           front-deque rear-deque
           front-insert-deque! rear-insert-deque!
           front-delete-deque! rear-delete-deque!
           print-deque)



;; Nodes proc:
(define (make-node val)
  (list val '() '()))

(define (value-node node)
  (car node))

(define (next-node node)
  (cadr node))
(define (set-next-node! node val)
  (set-car! (cdr node) val))

(define (prev-node node)
  (caddr node))
(define (set-prev-node! node val)
  (set-car! (cddr node) val))

;; Deque helper proc:
(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (insert-first! deque node)
  (set-front-ptr! deque node)
  (set-rear-ptr! deque node))

(define (last-elm-dequeq? deque) (eq? (front-ptr deque) (rear-ptr deque)))

;; Main proc:
(define (make-deque)
  (cons '() '()))

(define (empty-deque? deque) (eq? (front-ptr deque) '()))

(define (front-deque deque)
  (if (empty-deque? deque)
    (error "attempt to recive FRONT from empty deque")
    (value-node (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
    (error "attempt to recive REAR from empty deque")
    (value-node (rear-ptr deque))))



(define (front-insert-deque! deque val)
  (let ((new-node (make-node val)))
    (cond ((empty-deque? deque) (insert-first! deque new-node))
          (else
            (set-next-node! new-node (front-ptr deque))
            (set-prev-node! (front-ptr deque) new-node)
            (set-front-ptr! deque new-node)))))

(define (rear-insert-deque! deque val)
  (let ((new-node (make-node val)))
    (cond ((empty-deque? deque) (insert-first! deque new-node))
          (else
            (set-next-node! (rear-ptr deque) new-node)
            (set-prev-node! new-node (rear-ptr deque))
            (set-rear-ptr! deque new-node)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque) (error "attempt to call front-delete-deque! on empty deque"))
        ((last-elm-dequeq? deque) (set-front-ptr! deque '()) (set-rear-ptr! deque '()))
        (else
          (set-front-ptr! deque (next-node (front-ptr deque)))
          (set-prev-node! (front-ptr deque) '()))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque) (error "attempt to call rear-delete-deque! on empty deque"))
        ((last-elm-dequeq? deque) (set-front-ptr! deque '()) (set-rear-ptr! deque '()))
        (else
          (set-rear-ptr! deque (prev-node (rear-ptr deque)))
          (set-next-node! (rear-ptr deque) '()))))


(define (print-deque deque)
  (define (helper-print node first)
    (cond ((null? node) (displayln ""))
          (first (display "Deque: ")(display (value-node node)) (helper-print (next-node node) false))
          (else (display "<->") (display (value-node node)) (helper-print (next-node node) false))))
  (if (empty-deque? deque)
    (displayln "Empty queue.")
    (helper-print (front-ptr deque) true)))
