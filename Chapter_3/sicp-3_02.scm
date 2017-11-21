#! /usr/local/bin/csi -s
(use sicp)


(define (make-monitored fun)
  (let ((count 0))
       (lambda (mes-or-parm) 
          (cond ((equal? mes-or-parm 'how-many-calls?) count)
                ((equal? mes-or-parm 'reset-count) (set! count 0) 'reset)
                (else (set! count (+ count 1)) (fun mes-or-parm))))))
               
  
(define (sqr x) (* x x))
               
(define square-mon (make-monitored sqr))

(print (square-mon 3))

(print (square-mon 5))

(print (square-mon 2))

(print (square-mon 'how-many-calls?))

(print (square-mon 'reset-count))

(print (square-mon 'how-many-calls?))

(print (square-mon 2))

(print (square-mon 'how-many-calls?))