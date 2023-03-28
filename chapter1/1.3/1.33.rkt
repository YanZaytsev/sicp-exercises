(define (filtered-accumulate combiner null-value term a next b filter?)
    (if (> a b) null-value
     (combiner (if (filter? a) (term a) null-value) (filtered-accumulate combiner null-value term (next a) next b filter?))
    )
)