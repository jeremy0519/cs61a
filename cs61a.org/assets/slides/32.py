from lab10 import *

def eval_demo():
    """
    >>> exp =  Pair('+', Pair(2, Pair(Pair('*', Pair(3, Pair(3, nil))), Pair(5, nil))))
    >>> print(exp)
    (+ 2 (* 3 3) 5)
    >>> print(exp.rest)
    (2 (* 3 3) 5)
    >>> print(exp.rest.first)
    2
    >>> print(exp.rest.rest.first)
    (* 3 3)
    >>> print(exp.rest.rest.rest.first)
    5
    >>> calc_eval(exp.rest.rest.first)
    9
    >>> print(exp.rest.map(calc_eval))
    (2 9 5)
    >>> args = exp.rest.map(calc_eval)
    >>> args
    Pair(2, Pair(9, Pair(5, nil)))
    >>> calc_apply(addition, args)
    16
    >>> print(exp)
    (+ 2 (* 3 3) 5)
    >>> calc_eval(exp)
    16
    """

def lambda_demo():
    """
    scm> (lambda (x) (lambda (y) (* x y)))
    (lambda (x) (lambda (y) (* x y)))
    scm> (define f (lambda (x) (lambda (y) (* x y))))
    f
    scm> (f 3)
    (lambda (y) (* x y))
    scm> (define g (f 3))
    g
    scm> (g 5)
    15
    scm> ^D

    >>> globe = create_global_frame()
    >>> read_line('(lambda (x) (lambda (y) (* x y)))')
    <(lambda (x) (lambda (y) (* x y)))>
    >>> expr = read_line('(lambda (x) (lambda (y) (* x y)))')
    >>> type(expr)
    <class 'pair.Pair'>
    >>> expr.first
    'lambda'
    >>> expr.rest
    <((x) (lambda (y) (* x y)))>
    >>> scheme_eval(expr, globe)
    LambdaProcedure(<(x)>, <((lambda (y) (* x y)))>, <Global Frame>)
    >>> f = scheme_eval(expr, globe)
    >>> scheme_apply(f, Pair(3, nil), globe)
    LambdaProcedure(<(y)>, <((* x y))>, <{x: 3} -> <Global Frame>>)
    >>> g = scheme_apply(f, Pair(3, nil), globe)
    >>> g.formals
    <(y)>
    >>> g.body
    <((* x y))>
    >>> g.env
    <{x: 3} -> <Global Frame>>
    >>> scheme_apply(g, Pair(5, nil), globe)
    15
    >>> globe.lookup('x')
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "/Users/denero/Documents/workspace/lectures/fa23/scheme_sol/scheme_classes.py", line 47, in lookup
        raise SchemeError('unknown identifier: {0}'.format(symbol))
    scheme_classes.SchemeError: unknown identifier: x
    >>> g.env.lookup('x')
    3
    """
