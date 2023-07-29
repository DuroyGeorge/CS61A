(define (over-or-under num1 num2) 
    (if (> num1 num2) 1 (if (= num1 num2) 0 -1)))

(define (make-adder num) 
  (lambda (inc) (+ num inc))
)

(define (composed f g) 
  (lambda (x) (f (g x)))
)

(define (repeat f n) 
  (cond ((= n 0) (lambda (x) x))
        ((> n 0) 
            (composed f (repeat f (- n 1))))
  )
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  (if (= (modulo (max a b) (min a b)) 0)
      (min a b)
      (gcd (min a b) (modulo (max a b) (min a b)))
  )
)
