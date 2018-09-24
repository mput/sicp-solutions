#lang racket
#| Solution for exercise 2_40. |#

(require rackunit "../solutions/utils.rkt")
(provide uniq-pairs enumerate flatmap)

(define (flatmap proc seq)
  (foldr append '() (map proc seq)))

(define (enumerate low high)
  (if (> low high)
    null
    (cons low (enumerate (+ low 1) high))))


(define (uniq-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate 1 (- i 1))))
    (enumerate 1 n)))


