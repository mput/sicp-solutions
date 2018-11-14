#lang racket
#| Solution for exercise 3_47. |#

;; a. Реализация семафора в терминах мьютекса:
;; Для данной реализации, нам в сущности потребуется создать счётчик, который берет мьютекс перед началом своего изменения, и возвращает после.

(define (make-semaphore max)
  (let ((counter max)
        (mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'take-semaphore)
             (mutex 'acquire)
             (if (> counter 0)
               (begin
                 (set! counter (- counter 1))
                 (mutex 'release))
               (begin
                 (mutex 'release)
                 (take-semaphore 'take-semaphore))))
            ((eq? m 'release-semaphore)
             (mutex 'acquire)
             (set! counter (+ counter 1))
             (mutex 'release))))
    take-semaphore))


;; b. Реализация семафора в терминах атомарной операции set-and-test!

(define (make-semaphore n)
  (let ((counter (list n)))
    (define (the-semaphore m)
      (cond ((eq? m 'take-semaphore)
             (if (test-and-set! counter)
               (the-semaphore 'take-semaphore)))
            ((eq? m 'release-semaphore)
             (release counter))))
    take-semaphore))



(define (test-and-set! counter)
  (if (= (car counter) 0)
    true
    (begin
      (set-car! counter (- (car counter) 1))
      false)))

(define (release counter)
  (set-car! counter (+ (car counter) 1)))

;; Данная реализация явно имеет проблему, связанную с тем что освободить семафор может тот кто его не брал, соответственно считчик может стать больше, чем он был при создание семафора. При этом проверять в процедуре release не превысил ли счётчик своё максимальное значение, не лучшая идея, так как это может привести к тому, что процедура которая действительно занимала светофор, не сможет его вернуть. Пока не знаю насколько значительна данная проблема, например если использовать семафор через процедуру, подобную make-serializer из текста главы, то проблемы с лишним возвратом семафора быть не должно, так как данная процедура изначально может возвращать семафор только после того как сама заняла его.

