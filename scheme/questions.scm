(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cadar x) (car (cdr (car x))))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 13
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 13
  (define (function lst starting_index)
    (if (null? lst)
      nil
      (cons
        (list starting_index (car lst))
        (function (cdr lst) (+ starting_index 1)))))
  (function s 0)
  ; END PROBLEM 13
  )



;; Problem 14

;; Return the value for a key in a dictionary list
(define (get dict key)
  ; BEGIN PROBLEM 14
  (if (null? dict)
    #f
    (begin
      (if (equal? (caar dict) key)
        (cadar dict)
        (get (cdr dict) key))))
  ; END PROBLEM 14
  )

;; Return a dictionary list with a (key value) pair
(define (set dict key val)
  ; BEGIN PROBLEM 14
  (define (setfunction pre post key val)
    (if (null? post)
      (append pre (list (list key val)))
      (if (equal? (caar post) key)
        (append pre (list (list key val)) (cdr post))
        (setfunction (append pre (list (car post))) (cdr post) key val))))
  (setfunction nil dict key val)
  ; END PROBLEM 14
  )

;; Problem 15

;; implement solution-code
(define (solution-code problem solution)
  ; BEGIN PROBLEM 15
  ; 问了claude给提示
  (cond ((atom? problem) (if (equal? problem '_____) solution problem))
    ((list? problem) (cons (solution-code (car problem) solution) (solution-code (cdr problem) solution)))
    else problem)
  ; END PROBLEM 15
  )
