#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (enumerate-list start finish)
  (if (> start finish)
      nil
      (cons start (enumerate-list (+ start 1) finish))))


(define (unique-pair n)
  (accumulate append nil
      (map (lambda (i) 
             (map (lambda (j) 
                   (list i j)) (enumerate-list 1 (- i 1)))) (enumerate-list 1 n))))


(define (prime-pair? elm) (prime? (+ (car elm) (cadr elm))))

(define (prime-sum-pairs n)
        (map (lambda (elm)
                     (list (car elm) (cadr elm) (+ (car elm) (car (cdr elm)))))
            (filter (lambda (elm) (prime-pair? elm)) (unique-pair n))))

;;(print (enumerate-list 2 5))
;;(print (unique-pair 6))
(print (prime-sum-pairs 6))






