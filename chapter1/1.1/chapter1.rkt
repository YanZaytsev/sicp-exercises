(define (square x)
    (* x x))


(define (sum-of-squares x y)
    (+ (square x) (square y)))


(define (square-sum-larger a b c)
  (cond ((and (> a b) (> c b)) (sum-of-squares a c))
    ((and (> a c) (> b c)) (sum-of-squares a b))
    ((and (> b a) (> c a)) (sum-of-squares b c))))

(square-sum-larger 1 2 3)