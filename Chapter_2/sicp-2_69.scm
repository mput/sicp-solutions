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
  


(define (encode messege tree)
  (if (null? messege)
      '()
      (append (encode-symbol (car messege) tree)
              (encode (cdr messege) tree))))

(define (encode-symbol symbol tree)
  (let ((branch-bit (cond ((has-symbol? symbol (symbols (left-branch tree))) (cons (left-branch tree) 0))
                          ((has-symbol? symbol (symbols (right-branch tree))) (cons (right-branch tree) 1))
                          (else (error "No such symbol in the coding tree")))))
       (let ((branch (car branch-bit)) (bit (cdr branch-bit)))
            (cond ((leaf? branch) (list bit))
                  (else (cons bit (encode-symbol symbol branch)))))))

(define (has-symbol? symbol symbols)
  (cond ((null? symbols) #f)
        ((eq? symbol (car symbols)) #t)
        (else (has-symbol? symbol (cdr symbols)))))
      
      
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

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; Exc 2_69

;; First solution
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
    (cond ((null? (cdr leaf-set)) (car leaf-set))
          (else (successive-merge (cons (make-code-tree (cadr leaf-set) (car leaf-set)) (cddr leaf-set))))))

;; Second iterativ solution
(define (generate-huffman-tree-2 pairs)
  (successive-merge-2 (make-leaf-set pairs)))

(define (successive-merge-2 leaf-set)
  (define (merge-iter rest-set code-tree)
    (cond ((null? rest-set) code-tree) 
          (else (merge-iter (cdr rest-set) (make-code-tree (car rest-set) code-tree)))))
  (merge-iter (cddr leaf-set) (make-code-tree (cadr leaf-set) (car leaf-set))))

;; Third recursive solution with change of order in leaf-set

(define (make-leaf-set-1 pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set-1 (make-leaf (car pair)
                               (cdr pair))
                    (make-leaf-set-1 (cdr pairs))))))

(define (adjoin-set-1 x set)
  (cond ((null? set) (list x))
        ((> (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set-1 x (cdr set))))))

(define (generate-huffman-tree-3 pairs)
  (successive-merge-3 (make-leaf-set-1 pairs)))

(define (successive-merge-3 leaf-set)
    (cond ((null? (cdr leaf-set)) (car leaf-set))
          (else (make-code-tree (car leaf-set) (successive-merge-3 (cdr leaf-set))))))



;;Tests1
(print "Test 1")
(define symbol-weight (list (cons 'M 4) (cons 'A 2) (cons 'X 1) (cons 'I 1) (cons 'P 1)))
(define code-tree (generate-huffman-tree symbol-weight))
(print code-tree)
(define coded-msg (encode '(M A X I M P A M) code-tree))
(print coded-msg)
(print (decode coded-msg code-tree))
(newline)

;;Tests2
(print "Test 2")
(define symbol-weight (list (cons 'M 4) (cons 'A 2) (cons 'X 1) (cons 'I 1) (cons 'P 1)))
(define code-tree (generate-huffman-tree-2 symbol-weight))
(print code-tree)
(define coded-msg (encode '(M A X I M P A M) code-tree))
(print coded-msg)
(print (decode coded-msg code-tree))
(newline)
;;Tests3
(print "Test 3")
(define symbol-weight (list (cons 'M 4) (cons 'A 2) (cons 'X 1) (cons 'I 1) (cons 'P 1)))
(define code-tree (generate-huffman-tree-3 symbol-weight))
(print code-tree)
(define coded-msg (encode '(M A X I M P A M) code-tree))
(print coded-msg)
(print (decode coded-msg code-tree))
(newline)
