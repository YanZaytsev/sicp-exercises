#lang racket

(define (contains lst x)
    (cond ((null? lst) #f)
        ((eq? (car lst) x) #t)
        (else (contains (cdr lst) x)))
)


  (define counted-pairs '())
(define (count-pairs x)
  (if (not (pair? x))
      0
        (if (contains counted-pairs x) 0 
            (begin (set! counted-pairs (cons x counted-pairs ))
            (+ (count-pairs (car x))
                (count-pairs (cdr x))
                1)))
      )
)
      

(define x    (cons 'foo '()))
(define y    (cons x x))
(define str2 (cons y '()))


(define x1    (cons 'foo '())) 
(define y1    (cons x1 x1)) 
(define str3 (cons y1 y1)) 

(count-pairs y)