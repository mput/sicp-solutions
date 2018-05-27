#lang sicp
(#%require sicp-pict)

(define (continuos-segment points-list)
  (if (null? (cdr points-list))
      (cdr points-list)
      (cons (make-segment (car points-list) (cadr points-list)) (continuos-segment (cdr points-list)))))

(define wave-lines (append (continuos-segment (list (make-vect 0.22 0)
                                                    (make-vect 0.36 0.5)
                                                    (make-vect 0.3 0.56)
                                                    (make-vect 0.13 0.4)
                                                    (make-vect 0 0.62)))
                           (continuos-segment (list (make-vect 0 0.82)
                                                    (make-vect 0.135 0.6)
                                                    (make-vect 0.3 0.65)
                                                    (make-vect 0.4 0.65)
                                                    (make-vect 0.35 0.85)
                                                    (make-vect 0.4 0.99)))
                           (continuos-segment (list (make-vect 0.6 0.99)
                                                    (make-vect 0.64 0.85)
                                                    (make-vect 0.6 0.65)
                                                    (make-vect 0.73 0.65)
                                                    (make-vect 0.99 0.36)))
                           (continuos-segment (list (make-vect 0.99 0.15)
                                                    (make-vect 0.64 0.48)
                                                    (make-vect 0.75 0)))
                           (continuos-segment (list (make-vect 0.4 0)
                                                    (make-vect 0.5 0.3)
                                                    (make-vect 0.6 0)))))
                                                   
                               
(define (wave-painter frame) ((segments->painter wave-lines) frame))


(paint wave-painter)

