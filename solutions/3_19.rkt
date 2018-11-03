#lang racket
#| Solution for exercise 3_19. |#

(require compatibility/mlist)

(provide has-cycle?)

(define (mcddr items)
  (mcdr (mcdr items)))

(define (has-cycle? items)
  (define (at-end-of-list? items)
    (or (null? (mcdr items))
        (null? (mcddr items))))
  (define (chase turtle rabbit)
    (cond ((eq? (mcar turtle) (mcar rabbit)) true)
          ((at-end-of-list? rabbit) false)
          (else (chase (mcdr turtle) (mcddr rabbit)))))
  (chase (mcdr items) (mcddr items)))



