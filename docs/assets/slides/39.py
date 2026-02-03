# Tree to Dict

def as_dict(t):
    """Return a dictionary containing a key for each non-leaf label in t for which the
    corresponding value is a list of its children's labels. Assume all labels in t are unique.

    >>> as_dict(Tree(3, [Tree(4, [Tree(7), Tree(9, [Tree(1)])]), Tree(2, [Tree(6), Tree(5)])]))
    {3: [4, 2], 4: [7, 9], 9: [1], 2: [6, 5]}
    """
    result = {}
    def f(x):
        if not x.is_leaf():
            s = []
            result[x.label] = s
            for b in x.branches:
                s.append(b.label)
                f(b)
    f(t)
    return result

# 61A Fall 2015 Final Question 3

def one(b):
    if b:
        return 1
    else:
        return 0

def count_big(t, n):
    """Return the number of paths in t that have a sum larger or equal to n.

    >>> t = Tree(1, [Tree(2), Tree(3, [Tree(4), Tree(5)])])
    >>> count_big(t, 3)
    3
    >>> count_big(t, 6)
    2
    >>> count_big(t, 9)
    1
    """
    if t.is_leaf():
        return one(t.label >= n)
    else:
        return sum([count_big(b, n-t.label) for b in t.branches])


def print_big(t, n):
    """Print the paths in t that have a sum larger or equal to n.

    >>> t = Tree(1, [Tree(2), Tree(3, [Tree(4), Tree(5)])])
    >>> print_big(t, 3)
    [1, 2]
    [1, 3, 4]
    [1, 3, 5]
    >>> print_big(t, 6)
    [1, 3, 4]
    [1, 3, 5]
    >>> print_big(t, 9)
    [1, 3, 5]
    """
    def helper(t, p):
        p = p + [t.label]
        if t.is_leaf():
            if sum(p) >= n:
                print(p)
        else:
            for b in t.branches:
                helper(b, p)
    helper(t, [])

def big_links(t, n):
    """Yield the paths in t that have a sum larger or equal to n as linked lists.

    >>> t = Tree(1, [Tree(2), Tree(3, [Tree(4), Tree(5)])])
    >>> for p in big_links(t, 3):
    ...     print(p)
    (1 2)
    (1 3 4)
    (1 3 5)
    >>> for p in big_links(t, 6):
    ...     print(p)
    (1 3 4)
    (1 3 5)
    >>> for p in big_links(t, 9):
    ...     print(p)
    (1 3 5)
    """
    if t.is_leaf() and t.label >= n:
        yield Link(t.label)
    for b in t.branches:
        for rest in big_links(b, n - t.label):
            yield Link(t.label, rest)


# Link & Tree

class Link:
    """A linked list.

    >>> s = Link(3, Link(4, Link(5)))
    >>> s
    Link(3, Link(4, Link(5)))
    >>> print(s)
    (3 4 5)
    """
    empty = ()

    def __init__(self, first, rest=empty):
        assert rest is Link.empty or isinstance(rest, Link)
        self.first = first
        self.rest = rest

    def __repr__(self):
        if self.rest:
            rest_repr = ', ' + repr(self.rest)
        else:
            rest_repr = ''
        return 'Link(' + repr(self.first) + rest_repr + ')'

    def __str__(self):
        string = '('
        while self.rest is not Link.empty:
            string += str(self.first) + ' '
            self = self.rest
        return string + str(self.first) + ')'

class Tree:
    """A tree is a label and a list of branches."""
    def __init__(self, label, branches=[]):
        self.label = label
        for branch in branches:
            assert isinstance(branch, Tree)
        self.branches = list(branches)

    def __repr__(self):
        if self.branches:
            branch_str = ', ' + repr(self.branches)
        else:
            branch_str = ''
        return 'Tree({0}{1})'.format(repr(self.label), branch_str)

    def __str__(self):
        return '\n'.join(self.indented())

    def indented(self):
        lines = []
        for b in self.branches:
            for line in b.indented():
                lines.append('  ' + line)
        return [str(self.label)] + lines

    def is_leaf(self):
        return not self.branches
