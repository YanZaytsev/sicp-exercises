(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define nil '())

(define (subsets s)
    (println (list s))
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (sub-set) (cons (car s) sub-set)) rest)))))


(subsets (list 1 2 3))