class Link:
    "A Scheme list is a Link in which rest is a Link or nil."
    empty = ()
    def __init__(self, first, rest=empty):
        self.first = first
        self.rest = rest

    def __str__(self):
        result = '('
        curr = self
        while curr is not Link.empty:
            result += str(curr.first)
            if curr.rest is not Link.empty:
                result += ' '
            curr = curr.rest
        return result + ')'

nil = Link.empty

# Problem 1:
# 1.1:
# Python:  Link('+', Link(1, Link(Link('*', Link(2, Link(3, nil))), nil)))
# Scheme:  (+ 1 (* 2 3))

# 1.2:
# Python:  Link('and', Link(Link('<', Link(1, Link(0, nil))), Link(Link('/', Link(1, Link(0, nil))), nil)))
# Scheme: (and (< 1 0) (/ 1 0))

def print_evals(expr):
        """Print the expressions that are evaluated while evaluating expr.

        expr: a Scheme expression containing only (, ), +, *, and numbers.

        >>> nested_expr = Link('+', Link(Link('*', Link(3, Link(4, nil))), Link(5, nil)))
        >>> print_evals(nested_expr)
        (+ (* 3 4) 5)
        +
        (* 3 4)
        *
        3
        4
        5
        >>> print_evals(Link('*', Link(6, Link(7, Link(nested_expr, Link(8, nil))))))
        (* 6 7 (+ (* 3 4) 5) 8)
        *
        6
        7
        (+ (* 3 4) 5)
        +
        (* 3 4)
        *
        3
        4
        5
        8
        """
        if not isinstance(expr, Link):
            "*** YOUR CODE HERE ***"
            print(expr)


        else:
            "*** YOUR CODE HERE ***"
            print(str(expr))
            while expr is not Link.empty:
                print_evals(expr.first)
                expr = expr.rest