#! /usr/local/bin/csi -s
(use sicp)

(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (even n)
  (= (remainder n 2) 0))

(define (mult a b)
  (if (= b 0)
      0
      (cond ((even b) (double (mult a (halve b))))
            (else (+ a (mult a (- b 1)))))))


(define (multItertive a b)
  (define (iterMult acc a b)
    (if (= b 0)
        acc
        (cond ((even b) (iterMult acc (double a) (halve b)))
              (else (iterMult (+ acc a) a (- b 1))))))
  (iterMult 0 a b))

(print (mult 7 6))
(print (multItertive 7 6))
