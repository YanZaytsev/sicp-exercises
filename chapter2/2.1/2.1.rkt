(define (gcd a b)
    (if (= b 0) a
        (gcd b (remainder a b))
    )
)

(define (make-rat n d)
    (let ((g (gcd n d)))
        (if (or (< n 0) (< d 0)) (cons (/ (- 0 (abs n)) (abs g)) (/  (abs d) (abs g))) 
            (cons (/ n g) (/ d g))
        )
    )
)

(define (num rat)
    (car rat))

(define (den rat)
    (cdr rat))

(define (display-rat rat)
    (newline)
    (display (num rat))
    (display '/)
    (display (den rat))
)

(display-rat (make-rat  2 -4))
(display-rat (make-rat -2  4))