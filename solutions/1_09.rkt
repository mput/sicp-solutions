#lang racket
#| Solution for exercise 1_09. |#
(define (inc a) (+ a 1))
(define (dec a) (- a 1))

#| First procedure is are linear recursive process |#
(define (plus a b)
  (if (= a 0)
    b
    (inc (plus (dec a) b))))

(plus 4 5)
(inc (plus 3 5))
(inc (inc (plus 2 5)))
(inc (inc (inc (plus 1 5))))
(inc (inc (inc (inc (plus 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9


#| Second procedure is are linear iterative process |#
(define (plus-i a b)
  (if (= a 0)
    b
    (plus-i (dec a) (inc b))))

(plus-i 4 5)
(plus-i 3 6)
(plus-i 2 7)
(plus-i 1 8)
(plus-i 0 9)
9
