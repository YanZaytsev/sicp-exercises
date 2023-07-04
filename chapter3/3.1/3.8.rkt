#lang racket

    (define call-count 0)

(define (f num)
    
    (begin (set! call-count (+ call-count 1))
          (if (= call-count 1) num 0)
    )
)

(+ (f 0) (f 1))