#! /usr/local/bin/csi -s
(use sicp)

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cdr pair))
                    (make-leaf-set (cdr pairs))))))

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
  

(define symbol-weight (list (cons 'A 4) (cons 'B 2) (cons 'C 1) (cons 'D 1)))

;;(print (make-leaf-set symbol-weight))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))



(define (successive-merge-1 leaf-set)
  (define (merge-iter rest-set code-tree)
    (cond ((null? rest-set) code-tree) 
          (else (merge-iter (cdr rest-set) (make-code-tree (car rest-set) code-tree)))))
  (merge-iter (cddr leaf-set) (make-code-tree (cadr leaf-set) (car leaf-set))))

(define (successive-merge leaf-set)
  (define (merge-iter rest-set code-tree)
    (cond ((null? rest-set) code-tree) 
          (else (merge-iter (cdr rest-set) (make-code-tree (car rest-set) code-tree)))))
  (merge-iter (cddr leaf-set) (make-code-tree (cadr leaf-set) (car leaf-set))))




(print (generate-huffman-tree symbol-weight))
(newline)
(print (left-branch (generate-huffman-tree symbol-weight)))
(newline)
(print (right-branch (generate-huffman-tree symbol-weight)))
(newline)
(print (left-branch (right-branch (generate-huffman-tree symbol-weight))))
(newline)
(print (left-branch (right-branch (right-branch (generate-huffman-tree symbol-weight)))))
(print (right-branch (right-branch (right-branch (generate-huffman-tree symbol-weight)))))
;; ((leaf D 1) (leaf C 1) (leaf B 2) (leaf A 4))
