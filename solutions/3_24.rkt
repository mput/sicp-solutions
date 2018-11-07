#lang sicp
#| Solution for exercise 3_24. |#

(#%provide make-table)


(define (make-table same-key?)
  (define table (list '*table*))
  (define (assoc key items)
    (cond ((null? items) false)
          ((same-key? key (caar items)) (car items))
          (else (assoc key (cdr items)))))
  (define (lookup key1 key2)
    (let ((subtable (assoc key1 (cdr table))))
      (if subtable
        (let ((record (assoc key2 (cdr subtable))))
          (if record
            (cdr record)
            false))
        false)))
  (define (insert! key1 key2 value)
    (let ((subtable (assoc key1 (cdr table))))
      (if subtable
        (let ((record (assoc key2 (cdr subtable))))
          (if record
            (set-cdr! record value)
            (set-cdr! subtable (cons (cons key2 value) (cdr subtable)))))
        (set-cdr! table
                  (cons (list key1 (cons key2 value))
                        (cdr table)))))
    'ok)
  (define (dispatch m)
    (cond ((eq? m 'get) lookup)
          ((eq? m 'put) insert!)
          (else (error "Wrong operation --- TABLE" m))))
  dispatch)
