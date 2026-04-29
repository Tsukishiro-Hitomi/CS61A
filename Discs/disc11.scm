; replace old into new in the origin expr
(define-macro (mystery-macro expr old new)
    (mystery-helper expr old new))

(define (mystery-helper e o n)
  (if (and (list? e) (not (null? e)))
      (cons (mystery-helper (car e) o n) (mystery-helper (cdr e) o n))
      (if (eq? e o) n e)))

; if e is a not-null list, begin recursion
; else if e = o return n else e
; eg:
; (* x x) x five-> mystery-helper(* x five) + mystery-helper((x x) x five)
; * + mystery-helper(x x five) + mystery-helper(x x five)
; (* five five)

; eval:提前“冻结” expr2 的值，在宏展开时提前计算
(define-macro (assign sym1 sym2 expr1 expr2)
  `(begin
     (define ,sym1 ,expr1)
     (define ,sym2 ,(eval expr2))))

(assign x y (+ 1 1) 3)
(assign x y y x)
(expect x 3)
(expect y 2)

; extra challenge:
(define z 'x)      ; z is bound to the symbol x
(assign v w 2 z)   ; now v is bound to 2 and w is bound to the symbol x
(assign v w w v)   ; swap the values of v and w
(expect v x)
(expect w 2)
; since expr2 is not a symbol instead, we should modify our answer:
(define-macro (assign sym1 sym2 expr1 expr2)
  `(begin
     (define ,sym1 ,expr1)
     (define ,sym2 (quote ,(eval expr2)))))
; thus, when the expression is flatten out, it equals to (define w (quote x)) instead of (define w x) which will cause an error (the intepreter will look up the value of x)

(define-macro (switch expr cases)
  `(begin
	(define val ,expr)
	,(cons
	`cond
	(map (lambda (case) (cons
			`(equal? val ,(car case))
			(cdr case)))
		cases))))