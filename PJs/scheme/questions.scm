(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cadar x) (car (cdr (car x))))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 13
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 13
  (define (enumerate-helper s t num)
    (if (not (null? s)) (enumerate-helper (cdr s) (append t (list (list num (car s)))) (+ num 1)) t
    )
  )
  (enumerate-helper s () 0)
  ; END PROBLEM 13
  )


;; Problem 14

;; Return the value for a key in a dictionary list
(define (get dict key)
  ; BEGIN PROBLEM 14
  (
    if (or (null? dict)) #f (
      if (equal? (car (car dict)) key) (car (cdr (car dict))) (
        get (cdr dict) key
      )
    )
  )
  ; END PROBLEM 14
  )

;; Return a dictionary list with a (key value) pair
(define (set dict key val)
  ; BEGIN PROBLEM 14
  (
    if (equal? (get dict key) #f) (append dict (list (list key val)))
      (
        map (lambda (pair) 
          (
            if (equal? (car pair) key)
            (list key val)
            pair
          )
        ) dict
      )
  )
  ; END PROBLEM 14
  )

;; Problem 15

;; implement solution-code
(define (solution-code problem solution)
  ; BEGIN PROBLEM 15
  (cond ((equal? problem '_____) solution)
        ((list? problem) 
         (map (lambda (e) (solution-code e solution)) problem))
        (else problem))
  ; END PROBLEM 15
  )
