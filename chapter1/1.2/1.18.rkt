(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (* 2 x))
(define (halve x)
    (/ x 2))

(define (mul a b)
    (define (mul-iter a b result)
        (cond ((= b 0) result) 
            ((even? b) (mul-iter (double a) (halve b) result))
            (else (mul-iter a (- b 1) (+ result a)))
        )
    )

    (mul-iter a b 0)
)
