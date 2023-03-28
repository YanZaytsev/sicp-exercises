(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (fast-expt b n)
    (define  (fast-expt-iter n b result)
        (cond ((= n 0) result)
            ((even? n) (fast-expt-iter (/ n 2) (square b) result))
            (else (fast-expt-iter (- n 1) b (* result b)))
        )
    )

    (fast-expt-iter n b 1)
)

(fast-expt 2 11)

