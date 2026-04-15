(define (get-slicer a b)
  (define (slicer lst)
    (define (slicer-helper c i j)
      (cond 
        ((or (< i 0) (= i j) (null? c)) nil)
        ((= i 0) (cons (car c) (slicer-helper (cdr c) i (- j 1))))
        (else (slicer-helper (cdr c) (- i 1) (- j 1)))))
    (slicer-helper lst a b))
  slicer)

(define (reverse lst)
    (if (null? lst)
        nil
        (append (reverse (cdr lst)) (list (car lst))))
)