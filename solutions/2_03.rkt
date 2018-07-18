#lang racket
#| Solution for exercise 2_03. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/2_02.rkt")

(provide perimetr area make-rectangle-dots)

(define (perimetr rectangle)
  (* 2
     (+ (side-a rectangle)
        (side-b rectangle))))

(define (area rectangle)
  (* (side-a rectangle) (side-b rectangle)))

(define (make-rectangle-dots first-conor second-conor)
  (cons first-conor second-conor))
(define (first-conor rectangle) (car rectangle))
(define (second-conor rectangle) (cdr rectangle))

(define (side-a rectangle)
  (- (x-point (second-conor rectangle)) (x-point (first-conor rectangle))))
(define (side-b rectangle)
  (- (y-point (second-conor rectangle)) (y-point (first-conor rectangle))))

#| Можно реализовать другое представление для многоугольников, для которого будут работать те же процедуры area и perimetr но на данном этапе мы не обладаем никакими возможностями диспетчеризации, а следовательно не получится сделать так, чтобы процедуры area и perimetr вызывали процедуры side-a и side-b специфические для реализации. |#
