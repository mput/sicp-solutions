#! /usr/local/bin/csi -s
(use sicp)

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key (key (entry set-of-records))) (entry set-of-records))
        ((< given-key (key (entry set-of-records))) (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (entry set-of-records))) (lookup given-key (right-branch set-of-records)))))



(define (make-entry data-value key-value) (cons data-value key-value))

(define (key entry) (cdr entry))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define set-of-rec-list (list (make-entry 'maxim 1) (make-entry 'olya 2) (make-entry 'masha 3) (make-entry 'lena 4) (make-entry 'gosha 5) (make-entry 'SICP 6)))

(define set-of-rec (list->tree set-of-rec-list))

(print (lookup 2 set-of-rec))



