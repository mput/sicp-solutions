#! /usr/local/bin/csi -s
(use sicp)

(define (accumulate combiner null-value tern a next b)
  (if (> a b)
      null-value
      (combiner (tern a) (accumulate combiner null-value tern (next a) next b))))

(define (accumulate-iter combiner null-value tern a next b)
  (define (helper value acc)
    (if (> value b)
        acc
        (helper (next value) (combiner acc (tern value)))))
  (helper a null-value))


(define (square x) (* x x))
(define (through-one x) (+ x 2))

(define (product tern a next b) 
        (accumulate * 1 tern a next b))

(define (tern-pi x)
  (/ (* (- x 1) (+ x 1)) (square x)))

(define (pi2 accuracy)
  (* 4 (product tern-pi 3 through-one accuracy)))

(print (pi2 500))
(print (pi2 10000))