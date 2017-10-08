
(define (square x) (* x x))

(define (isGoodEnaugh guess pred) 
  (< (abs (- guess pred)) (* guess 0.0001)))

(define (improve guess x) (/ ( + (/ x (square guess)) (* 2 guess)) 3))

(define (findCube-iter guess pred x)
  (if (isGoodEnaugh guess pred)
      guess
      (findCube-iter (improve guess x) guess x)))

(print (findCube-iter 1 0 9))

