(define (product term a next b)
    (if (> a b) 1
        (* (term a) (product term (next a) next b))
    )
)

(define (product-iter term a next b)
    (define (iter a result)
         (if (> a b) result
            (iter (next a) (* result (term a))))
    )
   (iter a a)
)

(define (cube x)
    ( * x x x))

(define (inc x)
    (+ x 1))

(define (product-of-cubes x y)
    (product-iter cube x inc y))

(define (identity x)
    x)

(define (factorial n)
    (product identity 1 inc n)
)

(factorial 3)