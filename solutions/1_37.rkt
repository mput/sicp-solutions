#lang racket
#| Solution for exercise 1_37. |#

(require rackunit "../solutions/utils.rkt")
(define-logger my-log)
(provide cont-frac cont-frac-iter)

(define (cont-frac fn-a fn-d k)
  (define (cont-frac-recursive i)
    (if (> i k)
      0.0
      (/ (fn-a i)
         (+ (fn-d i)
            (cont-frac-recursive (+ i 1))))))
  (cont-frac-recursive 1))

(define (cont-frac-iter fn-a fn-d k)
  (define (iter current-k privious-result)
    (if (= current-k 0)
      privious-result
      (let ((next-result (/ (fn-a current-k)
                            (+ (fn-d current-k)
                               privious-result))))
        (iter (- current-k 1) next-result))))
  (iter k 0.0))

