#lang racket
#| Solution for exercise 2_01. |#

(require rackunit "../solutions/utils.rkt")
(provide add-rat sub-rat mul-rat div-rat equal-rat? make-rat numer denom)

(define (add-rat a b)
  (make-rat (+ (* (numer a) (denom b))
               (* (numer b) (denom a)))
            (* (denom a) (denom b))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (make-rat n d)
  (let ((g (gcd n d))
        (multiplier (if (< d 0) -1 1)))
    (cons (/ (* n multiplier) g)
          (/ (* d multiplier) g))))

(define (numer a) (car a))
(define (denom a) (cdr a))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

