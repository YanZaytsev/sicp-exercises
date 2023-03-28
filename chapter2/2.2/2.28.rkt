(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


(define nil '())




(define x (list (list (list 0) 1 2) (list 3 4 (list 5 6))))

(define (fringe lst)
    (let (
        (car-lst (car lst))
        (cdr-lst (cdr lst)))
        (append  
            (if (pair? car-lst) (fringe car-lst) (if  (null? car-lst) car-lst (cons car-lst '())))
            (if (pair? cdr-lst) (fringe cdr-lst) (if  (null? cdr-lst) cdr-lst (cons cdr-lst '())))
        )
    )
)


(fringe x)