#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))
;;Not ready yet (
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (position) (safe? k position))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                      (adjoin-position new-row rest-of-queens))
                (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)
(define (adjoin-position new-row rest-of-queens) (cons new-row rest-of-queens))
(define (safe? k position) #t)

(define (enumerate-interval start finish)
  (if (> start finish)
      nil
      (cons start (enumerate-interval (+ start 1) finish))))

(define (flatmap fun seq)
  (accumulate append nil (map fun seq)))


(print (queens 2))