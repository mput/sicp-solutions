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

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
    (cond ((null? (cdr leaf-set)) (car leaf-set))
          (else (successive-merge (cons (make-code-tree (cadr leaf-set) (car leaf-set)) (cddr leaf-set))))))


;; Exc 2_70


(define song '(Get a job
              Sha na na na na na na na na
              Get a job
              Sha na na na na na na na na
              Wah yip yip yip yip yip yip yip yip yip
              Sha boom))

(define symbol-pair (list (cons 'a 2) (cons 'boom 1) (cons 'Get 2) (cons 'job 2)
                          (cons 'na 16) (cons 'Sha 3) (cons 'yip 9) (cons 'Wah 1)))


(define code-tree (generate-huffman-tree symbol-pair))

(define song-code (encode song code-tree))

(define song-decode (decode song-code code-tree))

(print song-code)
(print (length song-code))
(print (* 3 (length song)))
(print song-decode)


