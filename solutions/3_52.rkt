#lang sicp
(#%require sicp)
(#%require "./3_51.rkt")

#| Solution for exercise 3_52. |#

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))

;; (newline)
;; (stream-ref y 7)
;; (display sum)
;; (newline)

;; (display-stream z)
;; (display sum)

Значение sum будет равно 210, но если бы мемоизация при вычислении не применялась, значение было бы больше, так как при вычислении (display-strem z) сновы бы вычислялись все значиния через процедуру accum, котороая имеет побочный эффект в виде изменения переменной sum.
