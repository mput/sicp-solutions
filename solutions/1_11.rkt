#lang racket
#| Solution for exercise 1_11. |#

(provide solution-rec solution-iter)

(define (solution-rec n)
  (if (< n 3)
    n
    (+ (solution-rec (- n 1))
       (* 2 (solution-rec (- n 2)))
       (* 3 (solution-rec (- n 3))))))

(define (solution-iter n)
  (define (helper-iter n-1 n-2 n-3 current-n)
    (if (> current-n n)
      n-1
      (helper-iter (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (+ current-n 1))))
  (if (< n 3)
    n
    (helper-iter 2 1 0 3)))
