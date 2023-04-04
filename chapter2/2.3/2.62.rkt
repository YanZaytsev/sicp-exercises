(define (union-set s1 s2)
    (cond ((null? s1) s2)
        ((null? s2) s1)
        (else 
            (let ((car-s1 (car s1))
                (car-s2 (car s2)))
                (cond ((= car-s1 car-s2) (cons car-s1 (union-set (cdr s1) (cdr s2))))
                    ((> car-s1 car-s2) (cons car-s2 (union-set s1 (cdr s2))))
                    (else (cons car-s1 (union-set (cdr s1) s2)))
                )
            )
        )
    )
)

(union-set '( 2 3 6) '(1 2 3 4 5))