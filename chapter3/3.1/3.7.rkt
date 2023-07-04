#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch provided-password m)
    (cond ((not (eq? provided-password password)) (lambda (x) "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define (make-joint acc current-pass new-pass)
    (define (dispatch provided-pass m)
        (if (not (eq? provided-pass new-pass)) 
            (lambda (x) "Incorrect password")
            (acc current-pass m))
    )
    dispatch
)

  (define peter-acc (make-account 100 'secret-password))
  (define paul-acc (make-joint peter-acc 'secret-password 'all-mine))

((paul-acc 'all-mine 'withdraw) 40)
((paul-acc 'all-mine 'withdraw) 40)