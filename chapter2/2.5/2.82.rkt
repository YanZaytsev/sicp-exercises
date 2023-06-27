(define (accumulate op initial lst)
  (if (null? lst) '()
    (cons (op initial) (accumulate op (car lst) (cdr lst)))
  )
)

(define (apply-generic op . args)
   (define (no-method type-tags) 
     (error 
      "No method for these types" 
      (list op type-tags))) 
  

    (define (apply-generic-count op count args)
      (let ((type-tags (map type-tag args)))
        (if (= counter 0)
          (no-method type-tags)
          (let ((proc (get op type-tags)))(
            (if proc
              (apply proc (map contents args))
              (let ((coercion-list (get-coercion-list (car type-tags) (cdr type-tags))))
                (if (valid? coercion-list) 
                  (apply-generic-count op count
                    (car args)
                    (apply-coercion-list coercion-list (cdr args))
                  )
                  (apply-generic-count op (dec count) (cdr args) (car args))
                )
              )
            )
          ))
        )
      )
    )

    (define (get-coercion-list type type-list)
      (map (lambda (x) (get-coercion x type)) type-list)
    )

     (define (apply-coercion-list coercion-list type-list) 
     (map (lambda (f x) f x) coercion-list type-list))) 

    (define (valid? coercion-list) 
      (accumulate and true coercion-list)
    )

   (apply-generic-count op (length args) args) 
)