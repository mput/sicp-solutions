#! /usr/local/bin/csi -s

(define (fun n)
  (cond ((< n 3) n)
        (else (+ (fun (- n 1)) 
                 (fun (- n 2)) 
                 (fun (- n 3))))))


(define (iterfun n)
  (define (iter first second third count)
    (cond ((> count (- n 1)) (+ first second third))
          (else (iter second  third (+ first second third) (+ count 1)))))
  (cond ((< n 3) n)
        (else (iter 0 1 2 3))))



(print (fun 4))
(print (iterfun 4))
(print (fun 5))
(print (iterfun 5))
(print (fun 6))
(print (iterfun 6))
(print (fun 20))
(print (iterfun 20))
  
