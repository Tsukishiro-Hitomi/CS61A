; Problem 1:
;;; Return whether there are n perfect squares with no repeats that sum to total
;;;
;;; scm> (fit 10 2)
;;; #t
;;; scm> (fit 9 2)
;;; #f
(define (fit total n)
    (define (f total n k)
        (if (and (= n 0) (= total 0))
            #t
        (if (< total (* k k))
            #f
            (or (f (- total (* k k)) (- n 1) (+ k 1)) (f total n (+ k 1)))
        )))
    (f total n 1))

(expect (fit 10 2) #t)  ; 1*1 + 3*3
(expect (fit 9 1)  #t)  ; 3*3
(expect (fit 9 2)  #f)  ;
(expect (fit 9 3)  #f)  ; 1*1 + 2*2 + 2*2 doesn't count because of repeated 2*2
(expect (fit 25 1)  #t) ; 5*5
(expect (fit 25 2)  #t) ; 3*3 + 4*4





; Probelm 2:
(define with-list
        (list
            (list 'a 'b) 'c 'd (list 'e)
        )
    )
(draw with-list)  ; Uncomment this line to draw with-list

(define with-quote
        '(
            (a b) c d (e)
        )

    )
(draw with-quote)  ; Uncomment this line to draw with-quote

(define first
    (cons 'a (cons 'b nil)))


(define with-cons
        (cons
            first (
                cons 'c (cons 'd (cons (cons 'e nil) nil))
            )
        )
    )
(draw with-cons)  ; Uncomment this line to draw with-cons





; Problem 3:
;;; Return a list with all numbers equal to x removed
;;;
;;; scm> (remove '(3 4 3 4 4 3) 3)
;;; (4 4 4)
;;; scm> (remove '(3 4 3 4 4 3) 4)
;;; (3 3 3)
(define (remove s x)
  (if (null? s) nil
    (if (equal? x (car s)) (remove (cdr s) x) (cons (car s) (remove (cdr s) x)))
))

(expect (remove '(3 4 3 4 4 3) 3) (4 4 4))
(expect (remove '(3 4 3 4 4 3) 4) (3 3 3))





; Problem 4:
;;; Return a list of pairs containing the elements of s.
;;;
;;; scm> (pair-up '(3 4 5 6 7 8))
;;; ((3 4) (5 6) (7 8))
;;; scm> (pair-up '(3 4 5 6 7 8 9))
;;; ((3 4) (5 6) (7 8 9))
(define (pair-up s)
    (if (<= (length s) 3)
        (
            if (= (length s) 3) 
            (list s)
            (pair-up s)
        )
        (
            cons (list (car s) (car (cdr s))) (pair-up (cdr (cdr s)))
            )

    ))

(expect (pair-up '(3 4 5 6 7 8)) ((3 4) (5 6) (7 8)) )
(expect (pair-up '(3 4 5 6 7 8 9)) ((3 4) (5 6) (7 8 9)) )






; Problem 5:
(define (up n)
    (define (helper n result)
        (define first (remainder n 10))  ; Using first will shorten your code
        (if (zero? n) result
            (helper
                (quotient n 10)
                (if (< first (car result))
                    (cons first result)
                    (list first result)
                )
                )))
    (helper
      (quotient n 10)
        (list (remainder n 10))
    ))

(expect (up 314152667899) (3 (1 4 (1 5 (2 6 (6 7 8 9 (9)))))))






; Problem 6:
(define (question-a x)
  (if (= x 0) 0
      (+ x (question-a (- x 1)))))
Your Answer: False

(define (question-b x y)
  (if (= x 0) y
      (question-b (- x 1) (+ y x))))
Your Answer: True

(define (question-c x y)
  (if (> x y)
      (question-c (- y 1) x)
      (question-c (+ x 10) y)))
Your Answer: True

(define (question-d n)
  (if (question-d n)
      (question-d (- n 1))
      (question-d (+ n 10))))
Your Answer: False

(define (question-e n)
  (cond ((<= n 1) 1)
        ((question-e (- n 1)) (question-e (- n 2)))
        (else (begin (print 2) (question-e (- n 3))))))
Your Answer: False