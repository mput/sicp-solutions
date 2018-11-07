#lang sicp
#| Solution for exercise 3_25. |#

(#%provide make-table)

(define (make-empty-table) (list '*table*))
(define (table? items) (and (pair? items) (eq? (car items) '*table*)))

(define (make-table same-key?)
  (define table (make-empty-table))

  (define (assoc key items)
    (cond ((null? items) false)
          ((same-key? key (caar items)) (car items))
          (else (assoc key (cdr items)))))

  (define (insert! value . keys-arg) true
    (define (iter-key keys subtable)
      (let* ((first-key (car keys))
             (rest-keys (cdr keys))
             (record (assoc first-key (cdr subtable))))
        (if (null? rest-keys) ;; last key?
          (if record ;; when adding value to the last key.
            (set-cdr! record value)
            (set-cdr! subtable (cons (cons first-key value) (cdr subtable))))
          (if record ;; when we need to add new key in middle or change existing key.
            (if (table? (cdr record))
              (iter-key rest-keys (cdr record)) ;; add next key to existing table.
              (let ((new-table (make-empty-table))) ;; value will be replaced with subtable.
                (set-cdr! record new-table)
                (iter-key rest-keys new-table)))
            (let ((new-table (make-empty-table))) ;; create new empty subtable, and add to it.
              (set-cdr! subtable (cons (cons first-key new-table) (cdr subtable)))
              (iter-key rest-keys new-table)))))
      'ok)
    (iter-key keys-arg table))

  (define (lookup . keys-arg)
    (define (iter-lookup keys subtable)
      (let* ((first-key (car keys))
             (rest-keys (cdr keys))
             (record (assoc first-key (cdr subtable))))
        (if (not record)
          false
          (if (null? rest-keys)
            (cdr record)
            (iter-lookup rest-keys (cdr record))))))
    (iter-lookup keys-arg table))

  (define (dispatch m)
    (cond ((eq? m 'insert!) insert!)
          ((eq? m 'lookup) lookup)
          (else (error "Wrong operation" m))))
  dispatch)

