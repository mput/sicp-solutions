#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (trio-sum max-number sum-to-number)
  (filter (lambda (elm) (sum-equal? elm sum-to-number)) (make-sum-list max-number)))
 
(define (sum-equal? list-of-trios max-number)
  (= (accumulate + 0 list-of-trios) max-number))

(define (make-sum-list max-number)
   (deep-flat (make-trio max-number)))

(define (make-trio max-number)
  (map (lambda (i)
          (map (lambda (j) 
                  (map (lambda (k) 
                          (list i j k)) 
                    (enumerate-list 1 j)))
            (enumerate-list 1 i)))
    (enumerate-list 1 max-number)))

(define (deep-flat seq)
  (let ((flated-seq (accumulate append nil seq)))
    (if (pair? (caar flated-seq))
        (deep-flat flated-seq)
        flated-seq)))

(define (enumerate-list start finish)
  (if (> start finish)
      nil
      (cons start (enumerate-list (+ start 1) finish))))

;;(print (make-trio 5))
(print (trio-sum 6 10))