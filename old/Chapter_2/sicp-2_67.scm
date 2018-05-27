#! /usr/local/bin/csi -s
(use sicp)


(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (if (eq? 'leaf (car object))
      #t
      #f))

(define (symbol-leaf leaf) (cadr leaf))
(define (weight-leaf leaf) (caddr leaf))


(define (make-code-tree left-branch right-branch)
  (list left-branch
        right-branch
        (append (symbols left-branch) (symbols right-branch))
        (+ (weight left-branch) (weight left-branch))))
  
(define (left-branch code-tree)
    (car code-tree))
  
(define (right-branch code-tree)
    (cadr code-tree))
  
(define (symbols object)
    (if (leaf? object)
        (cons (symbol-leaf object) '())
        (caddr object)))
  
(define (weight object)
    (if (leaf? object)
        (weight-leaf object)
        (cadddr object)))
  
(define (decode bits tree)
  (define (decode-symbol rest-bits branch)
    (if (null? rest-bits)
        '()
        (let ((bit (car rest-bits)))
             (let ((branch (cond ((= bit 0) (left-branch branch))
                                 ((= bit 1) (right-branch branch))
                                 (else (error "Bad value of bit:" bit)))))
                  (if (leaf? branch)
                      (cons (symbol-leaf branch) (decode-symbol (cdr rest-bits) tree))
                      (decode-symbol (cdr rest-bits) branch))))))
  (decode-symbol bits tree))
  
(define sample-tree
    (make-code-tree (make-leaf 'A 4)
                    (make-code-tree
                     (make-leaf 'B 2)
                     (make-code-tree (make-leaf 'D 1)
                                     (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(print (decode sample-message sample-tree))


