#lang sicp
#| A Simulator for Digital Circuits |#

(#%require "../solutions/3_21.rkt")
(#%provide inverter and-gate or-gate)

;; basic elements

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

(define inverter-delay 2)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define and-gate-delay 3)

(define (logical-and s t)
  (cond ((and (= s 1) (= t 1)) 1)
        ((and (= s 1) (= t 0)) 0)
        ((and (= s 0) (= t 1)) 0)
        ((and (= s 0) (= t 0)) 0)
        (else (error "Invalid signal" s))))


(define (or-gate i1 i2 out)
  (define (or-action-proc)
    (let ((new-out-val (logical-or (get-signal i1) (get-signal i2))))
      (after-delay or-gate-delay
                   (lambda () (set-signal! out new-out-val)))))
  (add-action! i1 or-action-proc)
  (add-action! i2 or-action-proc)
  'ok)

(define or-gate-delay 5)

(define (logical-or s t)
  (cond ((and (= s 1) (= t 1)) 1)
        ((and (= s 1) (= t 0)) 1)
        ((and (= s 0) (= t 1)) 1)
        ((and (= s 0) (= t 0)) 0)
        (else (error "Invalid signal" s))))

(define (probe name wire)
  (add-action! wire
               (lambda ()
                 (newline)
                 (display name)
                 (display " ")
                 (display (current-time the-agenda))
                 (display " New-value = ")
                 (display (get-signal wire)))))

;; wire representation

(define (make-wire)
  (let ((signal-value 0) (action-procedures '()))
    (define (set-signal! new-value)
      (if (not (= new-value signal-value))
        (begin
          (set! signal-value new-value)
          (call-each action-procedures))
        'done))
    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures)))
    (define (dispatch m)
      (cond
        ((eq? m 'get-signal) signal-value)
        ((eq? m 'set-signal!) set-signal!)
        ((eq? m 'add-action!) accept-action-procedure!)))
    dispatch))


(define (call-each procs)
  (if (null? procs)
    'done
    (begin
      ((car procs))
      (call-each (cdr procs)))))

(define (get-signal wire)
  (wire 'get-signal))

(define (set-signal! wire signal)
  ((wire 'set-signal!) signal))

(define (add-action! wire action)
  (wire 'add-action!) action)

;; agenda

(define (make-time-segment time queue)
  (cons time queue))

(define (segment-time s)
  (car s))

(define (segment-queue s)
  (cdr s))

(define (make-agenda) (list 0))

(define (current-time agenda) (car agenda))

(define (set-current-time! agenda time) (set-car! agenda time))

(define (segments agenda) (cdr agenda))

(define (set-segments! agenda segments)
  (set-cdr! agenda segments))

(define (first-segment agenda) (car (segments agenda)))

(define (rest-segments agenda) (cdr (segments agenda)))

(define (empty-agenda? agenda)
  (null? (segments agenda)))

(define (add-to-agenda! time action agenda)
  (define (belongs-before? segments)
    (or (null? segments)
        (< time (segment-time (car segments)))))
  (define (make-new-time-segment time action)
    (let ((q (make-queue)))
      (insert-queue! q action)
      (make-time-segment time q)))
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments) time))
      (insert-queue! (segment-queue (car segments))
                     action)
      (let ((rest (cdr segments)))
        (if (belongs-before? rest)
          (set-cdr! segments
                    (cons (make-new-time-segment time action)
                          rest)))
        (add-to-segments! rest))))

  (let ((segments (segments agenda)))
    (if (belongs-before? segments)
      (set-segments!
        agenda
        (cons (make-new-time-segment time action)
              segments)))
    (add-to-segments! segments)))

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
    (error "Empty agenda")
    (let ((first-seg (first-segment agenda)))
      (set-current-time! agenda (segment-time first-seg))
      (front-queue (segment-queue first-seg)))))

(define (remove-first-agenda-item! agenda)
  (let ((q (segment-queue (first-segment agenda))))
    (delete-queue! q)
    (if (empty-queue? q)
      (set-segments! agenda (rest-segments agenda)))))



(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda))

(define (propogate)
  (if (empty-agenda? the-agenda)
    'done
    (begin
      ((first-agenda-item the-agenda))
      (remove-first-agenda-item! the-agenda)
      (propogate))))

(define the-agenda (make-agenda))
