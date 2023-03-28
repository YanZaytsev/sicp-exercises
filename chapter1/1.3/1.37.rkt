(define (cont-frac n d k)
    (define (inner n d i)
        (if (= i k) 0
            (let ((n-value (n i))
                (d-value (d i)))
                (/ n-value (+ d-value (inner n d (+ i 1))))
            )
        )
    )

    (inner n d 0)
)

(define k 100)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)