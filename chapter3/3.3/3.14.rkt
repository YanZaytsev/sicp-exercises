#lang racket

 (define x '(foo)) 
 (define y (cons x x)) 
 (define str2 (list y)) 

  
 (define (count-pairs x) 
   (if (not (pair? x)) 
       0 
       (+ (count-pairs (car x)) 
          (count-pairs (cdr x)) 
          1))) 


(pair? x)