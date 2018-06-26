#lang sicp

(#%provide solution)

(define (square a1) (* a1 a1))

(define (sum-of-square a1 a2)
  (+ (square a1) (square a2)))

(define  (solution a1 a2 a3)
  (cond ((and (< a1 a3) (< a1 a2))(sum-of-square a2 a3))
        ((and (< a2 a1) (< a2 a3))(sum-of-square a1 a3))
        (else (sum-of-square a1 a2))))

