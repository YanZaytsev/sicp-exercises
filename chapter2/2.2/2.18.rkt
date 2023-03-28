
 (define nil '()) 

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


(define (reverse l)
    (if (null? (cdr l)) l
        (append (reverse (cdr l)) (cons (car l) nil))
    )
)

(reverse (list 1 4 9 16 25))