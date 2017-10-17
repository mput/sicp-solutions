#! /usr/local/bin/csi -s
(use sicp)


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))
(define (is-mobile? mobile) (pair? mobile))

(define (branch-weight branch)
  (cond ((not (pair? (branch-structure branch))) (branch-structure branch))
        (else (+ (branch-weight (left-branch (branch-structure branch)))
                 (branch-weight (right-branch (branch-structure branch)))))))

(define (mobile-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define (branch-moment branch)
  (cond ((not (pair? (branch-structure branch))) (* (branch-length branch) (branch-structure branch)))
        (else (* (branch-length branch) (+ (branch-moment (left-branch (branch-structure branch))) (branch-moment (right-branch (branch-structure branch))))))))
        
(define (isbalanced?_ mobile)
   (cond ((not (pair? mobile)) #t)
         ((and 
              (and (isbalanced? (left-branch (branch-structure mobile)))
                   (isbalanced? (right-branch (branch-structure mobile))))
              (= (branch-moment (left-branch mobile))
                 (branch-moment (right-branch mobile)))) #t)
         (else #f)))

(define (isbalanced? mobile)
    (cond ((not (is-mobile? mobile)) #t)
          ((and 
                (and (isbalanced? (left-branch (branch-structure mobile)))
                     (isbalanced? (right-branch (branch-structure mobile))))
                (= (branch-moment (left-branch mobile))
                   (branch-moment (right-branch mobile)))) #t)
          (else #f)))
      

(define right-left (make-branch 1 30))
(define right-right (make-branch 2 15))
(define right-sub-mobile (make-mobile right-left right-right))
(define left (make-branch 6 10))
(define right (make-branch 1 right-sub-mobile))
(define mobile (make-mobile left right))

(print (mobile-weight mobile))
(print (branch-moment right))
(print (branch-moment left))

(print (isbalanced? mobile))
