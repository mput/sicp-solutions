#! /usr/local/bin/csi -s
(use sicp)


(define (devider? cur x) (= (remainder x cur) 0))


(define (smallest-devisor x)
  (define (iter cur)
    (cond ((> (square cur) x) x)
          ((devider? cur x) cur)
          (else (iter (+ 2 cur)))))
  (if (devider? 2 x)
    2
    (iter 3)))




(define (isPrime x) (= (smallest-devisor x) x))


(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (isPrime n) 
      (report-prime n (- (current-milliseconds) start-time))
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " '")
  (display elapsed-time)
  (display "ms'\n")
  #t)

(define (search-for-prime from amount)
    (define (iter-searh number already-find)
      (if (= already-find amount)
          0
          (if (timed-prime-test number)
              (iter-searh (+ number 2) (+ already-find 1))
              (iter-searh (+ number 2) already-find))))
    (if (= (remainder from 2) 0)
        (iter-searh (+ 1 from) 0)
        (iter-searh from 0)))

(search-for-prime 10000000000000 5)
