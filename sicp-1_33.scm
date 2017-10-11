#! /usr/local/bin/csi -s
(use sicp)


(define (filtered-accumulate predicate combiner null-value tern a next b)
  (if (> a b)
      null-value
      (combiner (if (predicate a) (tern a) null-value) 
                (filtered-accumulate predicate combiner null-value tern (next a) next b))))
              
(define (filtered-accumulate-iter predicate combiner null-value tern a next b)
  (define (helper value acc)
    (if (> value b)
        acc
        (helper (next value) (combiner acc (if (predicate value) (tern value) null-value)))))
  (helper a null-value))


(define (ident x) x)
(define (plus x) (+ x 1))

(define (sum-of-prime-square-iter a b)
  (filtered-accumulate-iter prime? + 0 square a plus b))

(define (sum-of-prime-square a b)
  (filtered-accumulate-iter prime? + 0 square a plus b))

(print (sum-of-prime-square-iter 1 10))
(print (sum-of-prime-square 2 100))


(define (find-gcd a b)
        (if (= b 0)
          a
          (find-gcd b (remainder a b))))


(define (prime-to-number? n x) (= (find-gcd n x) 1))

(define (prod-of-pride-to-n n)
        (define (filter x) (prime-to-number? n x))
        (filtered-accumulate-iter filter * 1 ident 1 plus n))

(print (prod-of-pride-to-n 4))
(print (prod-of-pride-to-n 10))
