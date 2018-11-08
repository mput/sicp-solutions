#lang sicp
#| A Simulator for Digital Circuits |#

(#%require "../solutions/digital-circuits.rkt")


(define (half-adder a b s c)
  (let ((d (make-wire))
        (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))


(define in1 (make-wire))
(define in2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

#| (or-gate in1 in2 sum) |#
(half-adder in1 in2 sum carry)

(probe 'input-1 in1)
(probe 'sum sum)
(probe 'carry carry)


(set-signal! in1 1)

(propogate)

(set-signal! in2 1)

(propogate)
