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


(define (make-rectangle start-point diagonal-point) (cons start-point diagonal-point))
(define (get-start-point rectangle)(car rectangle))
(define (get-diafonal-point rectangle)(cdr rectangle))

(define (get-width rectangle) 
  (- (get-x-coord (get-diafonal-point rectangle)) (get-x-coord (get-start-point rectangle))))

(define (get-height rectangle) 
  (- (get-y-coord (get-diafonal-point rectangle)) (get-y-coord (get-start-point rectangle))))

(define (comp-perimeter rectangle)
  (* 2 (+ (get-height rectangle) (get-width rectangle))))

(define (comp-area rectangle)
  (* (get-height rectangle) (get-width rectangle)))

(define rectangle (make-rectangle (make-point 1 2) (make-point 5 5)))

(print (comp-perimeter rectangle))
(print (comp-area rectangle))
