#! /usr/local/bin/csi -s
(use sicp)

(define (sum-iter tern a next b)
  (define (helper next-elm sum)
    (if (> next-elm b)
        sum
        (helper (next next-elm) (+ sum (tern next-elm)))))
  (helper a 0))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define (tern x) (+ a (* x h)))
  (define (func x) 
    (cond ((or (= x 0) (= x n)) (f (tern x)))
          ((even? x) (*  2 (f (tern x))))
          (else (*  4 (f (tern x))))))
  (define h (/ (- b a) n))
  (define (next x) (+ x 1))
  (* (sum-iter func 0 next n)
     (/ h 3)))

(print (simpson cube 0 1 1000))
