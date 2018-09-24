#lang racket
#| Solution for exercise 2_41. |#

(require rackunit "../solutions/2_40.rkt")
(provide sum-pairs)

(define (sum-pairs n s)
  (map (lambda (x) (list (car x) (cadr x) (+ (car x) (cadr x))))
       (filter (lambda (x) (= (+ (car x) (cadr x)) s))
               (uniq-pairs n))))

