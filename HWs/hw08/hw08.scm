(define (ascending? s) 
    (if (or (null? s) (null? (cdr s))) #t (
            if (> (car s) (car (cdr s)))
            #f
            (ascending? (cdr s))
        )
    )
)

(define (my-filter pred s) 
    (define (helper pred s t) (
        if (null? s) t (
            if (pred (car s))
                (helper pred (cdr s) (append t (list (car s))))
                (helper pred (cdr s) t)
        )
    )
)
    (helper pred s ())
)

(define (interleave lst1 lst2) 
    (define (helper ans lst1 lst2) 
        (
            if (and (null? lst1) (null? lst2)) ans
                (
                    if (null? lst1) (helper (append ans (list (car lst2))) lst1 (cdr lst2))
                        (
                            if (null? lst2) (helper (append ans (list (car lst1))) (cdr lst1) lst2)
                            (helper (append ans (list (car lst1) (car lst2))) (cdr lst1) (cdr lst2))
                        )
                )
        )
    )
    (helper () lst1 lst2)
)

(define (no-repeats s)
    (if (null? s)
        ()
        (cons (car s)
            (no-repeats
                (filter (lambda (x) (not (= x (car s))))
                    (cdr s)
                )
            )
        )
    )
)
