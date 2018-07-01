#lang racket
#| Solution for exercise 1_12. |#

(provide get-pascal-triangle-value)

(define (get-pascal-triangle-value row col)
  (cond ((or (< col 1) (> col row)) 0)
        ((or (= col 1) (= col row)) 1)
        (else (+ (get-pascal-triangle-value (- row 1) (- col 1))
                 (get-pascal-triangle-value (- row 1) col)))))

