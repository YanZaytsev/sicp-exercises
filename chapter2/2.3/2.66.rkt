(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (key record) (car record))

(define (lookup given-key record-set)
    (cond ((null? record-set) false)
        ((equal? given-key (key (entry record-set))) (entry record-set))
        ((> given-key (key (entry record-set))) (lookup given-key (right-branch record-set)))
        (else (lookup given-key (left-branch record-set))))
)