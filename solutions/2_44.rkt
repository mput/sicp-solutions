#lang racket
#| Solution for exercise 2_44. |#

(require sicp-pict)

(define (corner-split painter n)
  (if (= n 0)
    painter
    (let ((up (up-split painter (- n 1)))
          (rigth (rigth-split painter (- n 1))))
      (let ((top-left (beside up up))
            (bottom-right (below rigth rigth))
            (corner (corner-split painter (- n 1))))
        (beside (below painter top-left)
                (below bottom-right corner))))))


(define (rigth-split painter n)
  (if (= n 0)
    painter
    (let ((rigth (below (rigth-split painter (- n 1)) (rigth-split painter (- n 1)))))
      (beside painter rigth))))

(define (up-split painter n)
  (if (= n 0)
    painter
    (let ((top (beside (up-split painter (- n 1)) (up-split painter (- n 1)))))
      (below painter top))))

(define (square-limit pointer n)
  (let ((quarter (corner-split pointer n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))


(paint-hi-res (square-limit einstein 4))
