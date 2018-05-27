#! /usr/local/bin/csi -s
(use sicp)

(define (devider? cur x) (= (remainder x cur) 0))

(define (smallest-devisor x)
  (define (iter cur)
    (cond ((> (square cur) x) x)
          ((devider? cur x) cur)
          (else (iter (+ cur 1)))))
  (iter 2))

(print (smallest-devisor 199))
(print (smallest-devisor 1999))
(print (smallest-devisor 19999))
