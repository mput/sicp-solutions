#lang racket
(require racket/stream)
#| Solution for exercise 3_50. |#
(provide stream-map-my)

(define (stream-ref s n)
  (if (= n 0)
      (stream-first s)
      (stream-ref (stream-rest s) (- n 1))))

(define (stream-map-my proc s)
  (if (stream-empty? s)
      empty-stream
      (stream-cons (proc (stream-first s))
                   (stream-map proc (stream-rest s)))))

(define (stream-for-each proc s)
  (if (stream-empty? s)
      'done
      (begin (proc (stream-first s))
             (stream-for-each proc (stream-rest s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))



;; stream-first and stream-rest would normally be built into
;;  the stream implementation
;: (define (stream-first stream) (car stream))
;: (define (stream-rest stream) (force (cdr stream)))

;: (stream-first
;:  (stream-rest
;:   (stream-filter prime?
;:                  (stream-enumerate-interval 10000 1000000))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-empty? stream) empty-stream)
        ((pred (stream-first stream))
         (stream-cons (stream-first stream)
                      (stream-filter pred
                                     (stream-rest stream))))
        (else (stream-filter pred (stream-rest stream)))))


;; force would normally be built into
;;  the stream implementation
;: (define (force delayed-object)
;:   (delayed-object))

(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))

;; (define (stream-map proc . argstreams)
;;   (if (<??> (car argstreams))
;;       empty-stream
;;       (<??>
;;        (apply proc (map <??> argstreams))
;;        (apply stream-map
;;         (cons proc (map <??> argstreams))))))


