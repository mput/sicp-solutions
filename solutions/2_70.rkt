#lang racket
#| Solution for exercise 2_70. |#

(require rackunit "../solutions/2_67.rkt")
(require "../solutions/2_68.rkt")
(require "../solutions/2_69.rkt")

(define song '(Get a job
               Sha na na na na na na na na
               Get a job
               Sha na na na na na na na na
               Wah yip yip yip yip yip yip yip yip yip
               Sha boom))

(define symbol-pairs (list (list 'a 2) (list 'boom 1) (list 'Get 2) (list 'job 2)
                           (list 'na 16) (list 'Sha 3) (list 'yip 9) (list 'Wah 1)))

(define code-tree (generate-huffman-tree symbol-pairs))
(define encoded-mesage (encode song code-tree))
(define decoded-message (decode encoded-mesage code-tree))

(define hofman-coded-song-length (length encoded-mesage)) ; 84
(define fixcode-coded-song-length (* 3 (length song))) ; 108

(displayln encoded-mesage)
(displayln decoded-message)
(displayln hofman-coded-song-length)
(displayln fixcode-coded-song-length)

