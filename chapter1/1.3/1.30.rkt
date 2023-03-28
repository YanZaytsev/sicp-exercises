(define (cube x)
    ( * x x x))

(define (inc x)
    (+ x 1))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

  (define (sum-of-cubes x y)
    (sum cube x inc y))

(sum-of-cubes 2 4)