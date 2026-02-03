;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Pink Poop Party
;;;
;;; Description:
;;;   Soft pink sky above,
;;;   Happy poops dance all around,
;;;   Kawaii chaos.

(define (poop-layer x y size)
  (penup) (goto x y) (pendown)
  (begin_fill)
  (circle size 180)
  (end_fill))

(define (poop-body x y size)
  (color (rgb 0.55 0.35 0.2))
  (poop-layer x y size)
  (poop-layer x (+ y (* size 0.6)) (* size 0.85))
  (poop-layer x (+ y (* size 1.1)) (* size 0.7))
  (penup) (goto x (+ y (* size 1.5))) (pendown)
  (begin_fill) (circle (* size 0.4)) (end_fill))

(define (eye x y size)
  (penup) (goto x y) (pendown)
  (color (rgb 1 1 1))
  (begin_fill) (circle size) (end_fill)
  (color (rgb 0 0 0))
  (penup) (goto x (+ y (* size 0.3))) (pendown)
  (begin_fill) (circle (* size 0.5)) (end_fill))

(define (smile x y size)
  (penup) (goto x y) (pendown)
  (color (rgb 0 0 0))
  (begin_fill)
  (circle size 180)
  (left 180)
  (circle (* size 0.6) -180)
  (end_fill))

(define (poop x y size)
  (poop-body x y size)
  (eye (- x (* size 0.35)) (+ y (* size 1.2)) (* size 0.15))
  (eye (+ x (* size 0.35)) (+ y (* size 1.2)) (* size 0.15))
  (smile x (+ y (* size 0.85)) (* size 0.2)))

(define (heart x y size)
  (penup) (goto x y) (pendown)
  (color (rgb 1 0.4 0.6))
  (begin_fill)
  (left 45) (forward size) (circle (* size 0.35) 180)
  (right 90) (circle (* size 0.35) 180) (forward size)
  (right 135)
  (end_fill))

(define (draw)
  (speed 0)
  (bgcolor (rgb 1 0.85 0.9))
  (hideturtle)
  (heart -200 200 25)
  (heart 150 180 20)
  (heart -100 -150 30)
  (heart 200 -100 15)
  (heart -250 50 22)
  (heart 100 100 18)
  (heart -50 250 20)
  (heart 250 -200 25)
  (heart 0 -250 18)
  (heart -180 -220 20)
  (poop -150 -50 35)
  (poop 100 -80 40)
  (poop 0 50 45)
  (poop -200 -180 30)
  (poop 180 80 32)
  (poop -80 -220 28)
  (poop 220 -180 25)
  (poop -250 120 30)
  (exitonclick))

(draw)
