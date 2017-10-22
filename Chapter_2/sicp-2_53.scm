#! /usr/local/bin/csi -s
(use sicp)

(print (list 'a 'b 'c))

(print (list (list 'george)))

(print (cdr '((x1 x2) (y1 y2))))

(print (cadr '((x1 x2) (y1 y2))))

(print (pair? (car '(a short list))))

(print (memq 'red '((red shoes) (blue sock))))


(print (memq 'red '(red shoes blue sock)))

