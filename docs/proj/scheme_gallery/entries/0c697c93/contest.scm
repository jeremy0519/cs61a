;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Pineappeo & Shroomiet
;;;
;;; Description:
;;;   The autograder may return 0 out of 20,
;;;   But love always returns True.
;;;   Kay and John can’t slice us apart.

(define (draw)
  (speed 0)
  (hideturtle)
  (bgcolor "black")

(define (L r c)
  (pu) (setpos r 0) (pd) (color c) 
  (begin_fill) (circle r) (end_fill))


(L 400 (rgb 0.8 0.55 0.2))
(L 380 (rgb 0.85 0.6 0.28))
(L 355 (rgb 0.9 0.15 0.1))
(L 300 (rgb 1 0.83 0.3))

(color "white")
(define (sl a) (pu) (setpos 0 0) (seth a) (pd) (fd 400))
(sl -45)(sl 0)(sl 45)

;pineapple
  (pu) (setpos 144 185) (seth 30)
  (pd) (color (rgb 1 0.984 0)) 
  (begin_fill)
  (circle 55 180) (fd 60) (circle 55 180)
  (end_fill)

; pineapple leaf
(define (tri f t)
  (begin_fill) (fd f) (rt t) (fd f) (end_fill))

(color (rgb .05 .55 .15))

(define (lf x y h ang rot)
  (pu) (setpos x y) (seth ang) (pd)
  (tri h rot))

(lf 110 265 50 57 130)
(lf 92 255 50 30 140) (lt 100) (tri 50 140)

(color (rgb .15 .65 .25))
(lf 80 255 35 30 130) (lt 100) (tri 35 130) (lt 100) (tri 35 130)

; mushroom
(color (rgb .71 .67 .57))
(pu)(setpos -30 230)(seth -20)
(pd)(begin_fill)(circle 55 210)(end_fill)

(setpos -40 200)(seth -30)
(begin_fill)(circle 30 180)(fd 30)(circle 30 180)(end_fill)


  (color "black")

;faces
(define (eye x y)
  (pu) (setpos x y) (pd)
  (begin_fill) (circle 5) (end_fill))

;pineapple face 
(eye 65 185)
(eye 95 175)

;mushroom face
(eye -100 220)
(eye -70 235)

;smile
(define (c a ex ey a2)
  (pu) 
  (seth a) (setpos ex ey) (pd)
  (begin_fill) (circle 20 a2) (end_fill)
)

;smiles
(c 120 60 160 60)
(c 90 -90 208 60)

;pineapple arms
(color (rgb 0.61 0.59 0.327))

(c 150 -5 200 90)
(c 570 120 150 90)

;mushroom arms
(c 480 -36 182 120)
(c 590 -88 165 120)

(exitonclick)
)

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)
