(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (* 2 x))
(define (halve x)
    (/ x 2))

(define (mul a b)
    (cond ((= b 0) 0)
        ((even? b) (mul (double a) (halve b)))
        (else (+ a (mul a (- b 1))))
    )
)