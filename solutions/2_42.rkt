#lang racket
#| Solution for exercise 2_42. |#

(require rackunit "../solutions/2_40.rkt")
(provide quins)

(define (quins board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row rest-of-queens))
                 (enumerate 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


(define empty-board (list))

(define (adjoin-position new-row rest-of-queens)
  (append rest-of-queens (list new-row)))

(define (safe? positions)
  (define (on-diagonal? row1 row2 shift)
    (or (= row1 (+ row2 shift))
        (= row1 (- row2 shift))))

  (define (safe-checks rest-queens last-quin-row shift)
    (if (null? rest-queens)
      true
      (let ((curent-queen-row (car rest-queens)))
        (if (or (= last-quin-row curent-queen-row)
                (on-diagonal? last-quin-row curent-queen-row shift))
          false
          (safe-checks (cdr rest-queens) last-quin-row (+ shift 1))))))

  (let ((reverse-pos (reverse positions)))
    (safe-checks (cdr reverse-pos) (car reverse-pos) 1)))
