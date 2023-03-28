(define (square x)
    (* x x))


(define x (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))


(define nil '())

(define (square-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
    )
)

(define (square-tree-map tree)
    (map 
        (lambda (sub-tree) 
            (if (not (pair? sub-tree)) (square sub-tree)
                (square-tree-map sub-tree)
            )
        )
        tree
    )
)


(square-tree-map x)