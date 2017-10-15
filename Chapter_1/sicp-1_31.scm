#! /usr/local/bin/csi -s
(use sicp)

(define (product tern a next b)
  (if (> a b)
      1
      (* (tern a) (product tern (next a) next b))))

(define (product-iter tern a next b)
  (define (helper next-elm sum)
    (if (> next-elm b)
        sum
        (helper (next next-elm) (* sum (tern next-elm)))))
  (helper a 1))

(define (tern x)
  (/ (* (- x 1) (+ x 1)) (square x)))

(define (through-one x) (+ x 2))

(define (pi accuracy)
  (* 4 (product tern 3 through-one accuracy)))

(define (pi-iter accuracy)
  (* 4 (product tern 3 through-one accuracy)))

(print (pi 5000))

(print (pi-iter 100000))