
(define (average x y)
  (/ (+ x y) 2))

(define (sqr x x)
    (* x x)
)

(define (improve guess x)
  (/ (+ (/ x (sqr guess)) (* 2 guess)) 3)
)


(define (cube x)
    (* x x x)
)

(define (good-enough? guess improved-guess)
  (< (/ (abs (- improved-guess guess)) guess) 0.0001)
)

(define (crt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (crt-iter (improve guess x)
                 x)))

(define (cube-root x)
  (crt-iter 1.0 x))


(cube-root 64)


