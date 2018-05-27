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



(define (expmod base power may-be-prime)
    (cond ((= power 0) 1)
          ((even? power)
           (remainder (square (expmod base (/ power 2) may-be-prime)) 
                      may-be-prime))
          (else 
            (remainder (* base (expmod base (- power 1) may-be-prime)) 
                      may-be-prime))))

(define (test-carmichaels number)
  (define (iter-test number next-number)
    (cond ((= next-number number) #t)
          ((= (expmod next-number number number) next-number) 
           (iter-test number (+ next-number 1)))
          (else #f)))
  (cond ((and (iter-test number 1) (not (isPrime number)))
         (display "Is carmichaels number: ")(display number)(newline))
        ((and (iter-test number 1) (isPrime number))
         (display "Is Prime number: ")(display number)(newline))
        (else (display "Just number: ")(display number)(newline))))

(test-carmichaels 561)
(test-carmichaels 1105) 
(test-carmichaels 1009)
(test-carmichaels 1011)
(test-carmichaels 6601)