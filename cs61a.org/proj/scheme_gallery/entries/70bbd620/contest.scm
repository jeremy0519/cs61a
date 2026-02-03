;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <MM_PP_M_>
;;;
;;; Description:
;;;   <Nightmares fill my mind.
;;;    Mushrooms. Pineapple. Pizza.
;;;    Please, just let it end>

(define (move_to x y) (penup) (goto x y) (pendown))

(define (draw_rect side1 side2)
  (begin_fill)
  (forward side1)
  (right 90)
  (forward side2)
  (right 90)
  (forward side1)
  (right 90)
  (forward side2)
  (end_fill))

(define (pineapple x y)
  (color "#FFDD4A")
  (move_to x y)
  (setheading 0)
  (draw_rect 20 20))

(define (mushroom x y)
  (define cap-radius 16)
  (define stem-width 12)
  (define stem-height 20)
  (color "#D3B78A")
  (move_to x y)
  (setheading 90)
  (begin_fill)
  (forward 32)
  (left 90)
  (circle cap-radius 180)
  (end_fill)
  (color "#E3C79A")
  (move_to (+ x 22) y)
  (setheading 180)
  (draw_rect 20 12))

(define (fill_circle x y r c)
  (color c)
  (move_to x y)
  (begin_fill)
  (circle r)
  (end_fill))

(define (slice i)
  (color "black")
  (move_to 0 0)
  (setheading (* i 45))
  (forward 200)
  (if (> i 0) (slice (- i 1))))

(define (draw)
  (hideturtle)
  (speed 0)
  (setheading 90)
  (fill_circle 0 -200 200 "#DAC693")
  (fill_circle 0 -170 170 "#FFFAC8")
  (slice 8)
  (pineapple -80 -125)
  (pineapple -40 -88)
  (pineapple -36 -150)
  (pineapple 8 -60)
  (pineapple 26 -144)
  (pineapple 34 -96)
  (pineapple 70 -130)
  (mushroom -145 60)
  (mushroom -90 33)
  (mushroom 60 125)
  (mushroom 8 95)
  (mushroom 82 66)
  (mushroom 35 40)
  (mushroom 122 31)
  )

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)