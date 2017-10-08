(use sicp)

(define (fast-exp b n acc)
  (cond ((= n 0) acc)
        ((= n 1) (* acc b))
        ((even n) (fast-exp b (/ n 2) (* acc (square b))))
        (else (fast-exp b (- n 1) b))))

(define (even n)
  (= (remainder n 2) 0))


(print (fast-exp 3 0 1))
(print (fast-exp 3 1 1))
(print (fast-exp 3 2 1))
(print (fast-exp 3 3 1))
(print (fast-exp 3 4 1))