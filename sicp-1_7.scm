(define (square x) (* x x))

(define (isGoodEnaugh guess pred) 
  (< (abs (- guess pred)) (* guess 0.0001)))

(define (improve guess x) (/ ( + (/ x guess) guess) 2))

(define (sqrt-iter guess pred x)
  (if (isGoodEnaugh guess pred)
      guess
      (sqrt-iter (improve guess x) guess x)))

(print (sqrt-iter 1 0 100.0))
