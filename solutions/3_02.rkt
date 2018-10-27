#lang racket
#| Solution for exercise 3_02. |#

(provide make-monitored)

(define (make-monitored func)
  (let ((counter 0))
    (lambda (msg)
      (cond ((eq? msg 'how-many-calls?) counter)
            ((eq? msg 'reset-count) (set! counter 0))
            (else (set! counter (+ counter 1))
                  (func msg))))))



