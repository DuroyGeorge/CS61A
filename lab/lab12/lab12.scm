(define (substitute s old new) 
  (if (null? s)
      nil
      (cond ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
            ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
            (else (cons (car s) (substitute (cdr s) old new))))))

; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s)
      nil
      (cons (fn (car s)) (map fn (cdr s)))))

(define (filter fn s)
  (cond 
    ((null? s)    nil)
    ((fn (car s)) (cons (car s) (filter fn (cdr s))))
    (else         (filter fn (cdr s)))))

(define (count x s) 
  (if (null? s)
      0
      (if (equal? (car s) x)
          (+ 1 (count x (cdr s)))
          (count x (cdr s)))))

(define (unique s) 
  (define (helper item s)
  (if (null? s)
    #f
    (if (equal? item (car s))
    #t
    (helper item (cdr s))
    )
  )
  )
  (define (unique-helper s sofar res)
    (if (null? s)
    res
    (if (helper (car s) sofar)
    (unique-helper (cdr s) sofar res)
    (unique-helper (cdr s) (cons (car s) sofar) (append res (list(car s))))
    )
    )
    )
    (unique-helper s '() '())
  )

(define (tally names) 
(define (helper names nums)
  (if (null? names)
  nil
    (cons(list (car names) (car nums))
    (helper (cdr names) (cdr nums)))
  )
)
(helper (unique names) (map (lambda (x) (count x names)) (unique names)))
)

