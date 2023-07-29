(define (ascending? asc-lst)
  (if (or (null? asc-lst)(null? (cdr asc-lst)))
      #t
      (if (> (car asc-lst) (cadr asc-lst))
          #f
          (ascending? (cdr asc-lst)))))

(define (my-filter pred s) 
  (cond ((null? s) '())
        ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) 
    (if (or (null? lst1) (null? lst2))
        (cond ((null? lst1) lst2)
              ((null? lst2) lst1))
        (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2))))))

(define (no-repeats lst)
  (define (unique? x seen)
    (cond ((null? seen) #t)
          ((= x (car seen)) #f)
          (else (unique? x (cdr seen)))))
  (define (no-repeats-helper lst seen)
    (cond ((null? lst) '())
          ((unique? (car lst) seen)
           (cons (car lst) (no-repeats-helper (cdr lst) (cons (car lst) seen))))
          (else (no-repeats-helper (cdr lst) seen))))
  (no-repeats-helper lst '()))