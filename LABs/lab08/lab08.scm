(define (over-or-under num1 num2) 
  (if (= num1 num2) 0 (if (> num1 num2) 1 -1))
)

(define (over-or-under num1 num2)
  (cond ((= num1 num2) 0)
        ((> num1 num2) 1)
        ((< num1 num2) -1)
  )
)

(define (composed f g) 
  (lambda (x) (f (g x)))
)

(define (repeat f n) 
  (if (> n 1) 
      (composed f (repeat f (- n 1))) 
      f
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
  (
    if (= a b) 
    a 
    (gcd (min a b) (- (max a b) (min a b)))
  )
)

(define (exp b n)
  (define (helper n so-far) 
    (if (= n 0)
      so-far
      (helper (- n 1) (* b so-far))
    )
  )
  (helper n 1))

(define (swap s)
  (define (helper s t)
    (cond ((null? s) t)
          ((null? (cdr s)) (append t (list (car s))))
          (else (helper (cdr (cdr s))
                        (append t (list (car (cdr s)) (car s)))
                )
          )
    )
  )
  (helper s '()))

(define (make-adder num) 
  (lambda (inc) (+ num inc))
)
