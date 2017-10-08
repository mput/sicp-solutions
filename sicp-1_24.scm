#! /usr/local/bin/csi -s
(use sicp)

(define (expmod base power may-be-prime)
    (cond ((= power 0) 1)
          ((even? power)
           (remainder (square (expmod base (/ power 2) may-be-prime)) 
                      may-be-prime))
          (else 
            (remainder (* base (expmod base (- power 1) may-be-prime)) 
                      may-be-prime))))

(define (ferma-test? number)
    (define (try-it random-namber)
      (= (expmod random-namber number number) random-namber))
    (try-it (+ 1 (random (- number 1)))))


(define (fast-prime? number)
  (define (try-ferma-test number times)
    (cond ((= times 0) #t)
          ((ferma-test? number) (try-ferma-test number (- times 1)))
          (else #f)))
  (try-ferma-test number 50)) 


(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n) 
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

(search-for-prime 1000 5)
