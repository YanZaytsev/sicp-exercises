(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define nil '())

(define (reverse l)
    (cond ((null? l) nil)
            ((not (pair? l)) l)
        (else
            (let (
                (car-l (car l))
                (cdr-l (cdr l)))
            (append 
                (if (pair? cdr-l) (reverse cdr-l) cdr-l)
                (cons (if (pair? car-l) (reverse car-l) car-l) nil)
            )))
    )
)

(define x (list (list 1 2 (list -1 0)) (list 3 4 (list 5 6))))

(reverse x)