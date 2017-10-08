(define (count-change amount)
  (cc amount 2))
  
(define (cc amount kindsOfCoins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kindsOfCoins 0)) 0)
        (else (+ (cc amount
                      (- kindsOfCoins 1))
                (cc (- amount
                      (first-denomination kindsOfCoins))
                    kindsOfCoins)))))

(define (first-denomination kindsOfCoins) 
  (cond ((= kindsOfCoins 1) 5)
        ((= kindsOfCoins 2) 10)))

(print (count-change 2))
