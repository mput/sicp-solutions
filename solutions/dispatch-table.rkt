#lang racket

(provide put get attach-tag)

;;;-----------
;;;from section 3.3.3 for section 2.4.3
;;; to support operation/type table for data-directed dispatch

(define (mlist . items)
  (foldr mcons '() items))

(define (mcaar table)
  (mcar (mcar table)))

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (mcaar records)) (mcar records))
        (else (assoc key (mcdr records)))))

(define (make-table)
  (let ((local-table (mlist '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (mcdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (mcdr subtable))))
              (if record
                  (mcdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (mcdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (mcdr subtable))))
              (if record
                  (set-mcdr! record value)
                  (set-mcdr! subtable
                            (mcons (mcons key-2 value)
                                  (mcdr subtable)))))
            (set-mcdr! local-table
                      (mcons (mlist key-1
                                  (mcons key-2 value))
                            (mcdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(define (attach-tag tag x) (mcons tag x))
