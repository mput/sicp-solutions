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
  (cond ((and (iter-test number 1) (not (prime? number)))
         (display "Is carmichaels number: ")(display number)(newline))))
      

(define (find-carm number)
  (test-carmichaels number)
  (find-carm (+ number 1)))

(find-carm 1)
