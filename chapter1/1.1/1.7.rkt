(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))


(define (square x)
    (* x x))




(define (good-enough? guess improved-guess)
  (< (/ (abs (- improved-guess guess)) guess) 0.0001)
)

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))


(my-sqrt 10000)