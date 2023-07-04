(define (make-accumulator num)
    (lambda (to-add) 
        (begin (set! num (+ num to-add)) num)
    )
)

(define A (make-accumulator 5))

(A 10)
(A 7)