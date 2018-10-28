#lang racket
#| Solution for exercise 3_05. |#

(require "../solutions/utils.rkt")
(provide estimate-unit-disk-area)

(define (monte-carlo trials experiment)
  (define (iter-trials trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter-trials (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter-trials (- trials-remaining 1) trials-passed))))
  (iter-trials trials 0))

(define (estimate-unit-disk-area trials)
  (estimateintegral (isInCircle 0 0 1) -1 1 -1 1 trials))

(define (estimateintegral P x1 x2 y1 y2 trials)
  (define (test)
    (let ((x-random (random-in-range x1 x2))
          (y-random (random-in-range y1 y2)))
      (P x-random y-random)))
  (let ((square-area (* (- x2 x1) (- y2 y1))))
    (* (monte-carlo trials test) square-area)))

(define (isInCircle x-centre y-centre radius)
  (lambda (x y)
    (<= (+ (square (- x x-centre))
           (square (- y y-centre)))
        (square radius))))

(define (random-in-range low high)
  (let* ((precise 10000)
         (precise-low (* low precise))
         (precise-high (* high precise))
         (range (- precise-high precise-low)))
    (/ (+ precise-low (random range) 0.) precise)))

