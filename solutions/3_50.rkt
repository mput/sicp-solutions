#lang racket
(require racket/stream)

#| Solution for exercise 3_50. |#
(provide streams-map)

(define (streams-map proc . argstreams)
  (if (stream-empty? (car argstreams))
      empty-stream
      (stream-cons
       (apply proc (map stream-first argstreams))
       (apply streams-map
        (cons proc (map stream-rest argstreams))))))


