(define (equal? list-a list-b)
    (cond ((and (null? list-a) (null? list-b)) #t)
        ((and (null? list-a) (not (null? list-b))) #f)
        ((and (null? list-b) (not (null? list-a))) #f)
        (else (and (eq? (car list-a) (car list-b)) (equal? (cdr list-a) (cdr list-b))))
))

(equal? (list 'a) (list 'a))