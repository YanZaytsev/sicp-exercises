#lang racket

(define (make-monitored func)
    (define counter 0)
    (define (mf param)
        (cond ((eq? param 'reset-count) (begin (set! counter 0) counter))
            ((eq? param 'how-many-calls?) counter)
            (else (begin (set! counter (+ 1 counter)) (func param))))
    )
    mf
)

(define msqrt (make-monitored sqrt))

(msqrt 2)
(msqrt 3)
(msqrt 3)
(msqrt 'how-many-calls?)
(msqrt 'reset-count)
(msqrt 3)
(msqrt 'how-many-calls?)