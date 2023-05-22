#lang racket

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (install-mul-deriv-package)

    (define (variable? x) (symbol? x))

    (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

    (define (sum? x)
    (and (pair? x) (eq? (car x) '+)))

    (define (addend s) (cadr s))

    (define (augend s)
        (let ((s-cddr (cddr s)))
            (if (= (length s-cddr) 1)
                (car s-cddr)
                (make-sum-from-list s-cddr)
            )
        )
    )

    (define (product? x)
        (and (pair? x) (eq? (car x) '*)))

    (define (multiplier p) (cadr p))

    (define (multiplicand p) (caddr p))

    (define (make-product-from-list lst)
        (if (= (length lst) 2) (list '* (car lst) (cadr lst))
            (make-product (car lst) (make-product-from-list (cdr lst)))
        )
    )

    (define (make-product m1 m2)
        (cond ((or (=number? m1 0) (=number? m2 0)) 0)
                ((=number? m1 1) m2)
                ((=number? m2 1) m1)
                ((and (number? m1) (number? m2)) (* m1 m2))
                (else (make-product-from-list (list m1 m2)))))

 

    (define (make-sum-from-list lst)
        (if (= (length lst) 2) (list '+ (car lst) (cadr lst))
        (make-sum (car lst) (make-sum-from-list (cdr lst)))
        )
    )

    (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
            ((=number? a2 0) a1)
            ((and (number? a1) (number? a2)) (+ a1 a2))
            (else (make-sum-from-list (list a1 a2)))))

    (define (deriv-mul exp var)
        (make-sum
        (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
        (make-product (deriv (multiplier exp) var)
                        (multiplicand exp)))
    )

    (define (deriv-sum exp var)
              (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))

    (put 'deriv '(*) deriv-mul)
    (put 'deriv '(+) deriv-sum)
    (put 'make-sum '+ make-sum)
    (put 'make-product '+ make-product)

  'done)

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))