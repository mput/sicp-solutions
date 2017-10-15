#! /usr/local/bin/csi -s
(use sicp)


(define (make-segment start-point end-point) (cons start-point end-point))

(define (get-start-segment segment) (car segment))
(define (get-end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (get-x-coord point) (car point))
(define (get-y-coord point) (cdr point))

(define (get-midpoint segment)
  (define (avrg a b)
    (/ (+ a b) 2))
  (make-point 
    (avrg (get-x-coord (get-start-segment segment)) (get-x-coord (get-end-segment segment)))
    (avrg (get-y-coord (get-start-segment segment)) (get-y-coord (get-end-segment segment)))))

(define (print-point point)
  (newline)
  (display "[")
  (display (get-x-coord point))
  (display " ,")
  (display (get-y-coord point))
  (display "]")
  (newline))


(define point-1_1 (make-point 1 1))
(define point-2_3 (make-point 2 3))
(define line-1_1-2_3 (make-segment point-1_1 point-2_3))

(print-point (get-midpoint line-1_1-2_3))
