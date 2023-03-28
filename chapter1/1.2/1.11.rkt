(define (f n)
    (define (compute-f n-1 n-2 n-3 nth)
        (if (= n nth) n-1
            (compute-f 
                (+ n-1 (* 2 n-2) (* 3 n-3)) 
                    n-1 
                    n-2 
                    (+ 1 nth) 
            )
        ))

    (if (< n 3) n 
        (compute-f 2 1 0 2))
)



(define (f-recursive n)
    (if (< n 3) n
        (+ (f-recursive (- n 1))
            (* 2 (f-recursive (- n 2)))
            (* 3 (f-recursive (- n 3)))
        )
    )   
)

