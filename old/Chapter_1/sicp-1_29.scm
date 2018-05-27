#! /usr/local/bin/csi -s
(use sicp)

(define (sum tern a next b)
    (if (> a b)
      0
      (+ (tern a)
        (sum tern (next a) next b))))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define (tern x) (+ a (* x h)))
  (define (func x) 
    (cond ((or (= x 0) (= x n)) (f (tern x)))
          ((even? x) (*  2 (f (tern x))))
          (else (*  4 (f (tern x))))))
  (define h (/ (- b a) n))
  (define (next x) (+ x 1))
  (* (sum func 0 next n)
     (/ h 3)))
  

(print (simpson cube 0 1 10))
