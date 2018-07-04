#lang racket
#| Solution for exercise 1_17. |#

(require rackunit "../solutions/utils.rkt")
(provide fast-mult-recrs fast-mult-iter)

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (fast-mult-recrs a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult-recrs a (halve b))))
        (else (+ a (fast-mult-recrs a (- b 1))))))

(define (fast-mult-iter a b)
  (define (helper-iter acc a b)
    (cond ((= b 0) acc)
          ((even? b) (helper-iter acc (double a) (halve b)))
          (else (helper-iter (+ acc a) a (- b 1)))))
  (helper-iter 0 a b))
