;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: 6ix 7even
;;;
;;; Description:
;;;   67
;;;   nice
;;;   insert meme

(define (teleport x y)(penup)(setpos x y)(pendown))

(define (drawpoly startx starty scale c points)(teleport (+ startx (* (car (car points)) scale))
  (+ starty (* (car (cdr (car points))) scale)))(color c)(begin_fill)(define (iter pts)(if (null? pts) 'done (begin (setpos (+ startx (* (car (car pts)) scale))(+ starty (* (car (cdr (car pts))) scale)))(iter (cdr pts)))))(iter points)(end_fill))

(define (drawrect x y w h c)(teleport x y)(color c)(begin_fill)(setheading 0)
  (forward w)(left 90)(forward h)(left 90)(forward w)(left 90)(forward h)(end_fill))

(define sixpoints
  '((0 0) (80 0) (80 75) (25 75) (25 95) (80 95) (80 120) (0 120) (0 0)))

(define sevenpoints
  '((0 120) (80 120) (80 95) (55 0) (30 0) (55 95) (0 95) (0 120)))

(define (draw67 cx cy s)
  (define totalw (* 180 s))(define totalh (* 120 s))(define startx (- cx (/ totalw 2)))
  (define starty (- cy (/ totalh 2)))(define gap (* 20 s))(define shadowd (* 10 s))
  (define sixx startx)(define sevenx (+ startx (* 80 s) gap))(drawpoly (+ sixx shadowd) (- starty shadowd) s "black" sixpoints)
  (drawpoly (+ sevenx shadowd) (- starty shadowd) s "black" sevenpoints)(drawpoly sixx starty s "#00CCFF" sixpoints)
  (drawrect (+ sixx (* 55 s)) (+ starty (* 20 s)) (* 30 s) (* 30 s) "white")(drawpoly sevenx starty s "#FF3333" sevenpoints))

(define (recursivefill x y s depth)
  (if (> depth 0)
      (begin (draw67 x y s)(define nexts (* s 0.5))(define offset (* 130 s))
        (define nextdepth (- depth 1))(recursivefill (- x offset) (+ y offset) nexts nextdepth)
        (recursivefill (+ x offset) (+ y offset) nexts nextdepth)(recursivefill (- x offset) (- y offset) nexts nextdepth)
        (recursivefill (+ x offset) (- y offset) nexts nextdepth))))

(define (draw)(speed 0)(hideturtle)(bgcolor "white")(recursivefill 0 0 1.5 7) ; anything less than 5 feels too empty
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)