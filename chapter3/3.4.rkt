#lang racket

(define (call-the-cops)
    "COPS!")

(define (make-account balance password)
  (define wrong-password-count 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch provided-password m)
    (if  (not (eq? provided-password password))
            (if (> wrong-password-count 6) (lambda (x) (call-the-cops)) 
                (begin (set! wrong-password-count (+ 1 wrong-password-count)) (lambda (x) "Incorrect password")))
         (begin (set! wrong-password-count 0)
            (cond
                ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))
            )
         ))
          
  dispatch)