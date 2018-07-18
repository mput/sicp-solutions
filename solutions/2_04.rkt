#lang racket
#| Solution for exercise 2_04. |#

(require rackunit "../solutions/utils.rkt")
(provide n-cons n-car n-cdr)

(define (n-cons x y)
  (lambda (m) (m x y)))

(define (n-car pair)
  (pair (lambda (p q) p)))

#| Воспользуемся методом подстановки, чтобы проилюстрировать работу данной реализации пар: |#
#| (define testpair (n-cons 1 2)) |#
#| (n-car testpair) |#
#| (testpair (lambda (p q) p)) |#
#| ((lambda (m) (m 1 2)) (lambda (p q) p)) |#
#| ((lambda (p q) p) 1 2) |#
#| 1 |#
#| Из этого вытекает довольно очевидная реализация процедуры cdr: |#

(define (n-cdr pair)
  (pair (lambda (p q) q)))
