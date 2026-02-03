;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.

;;; Title: Snowy boy

;;; Description:
;;;   if melted = false:
;;;   he's a jolly happy soul
;;;   else: no more frosty

(define (draw)

(bgcolor "#87c9ff")
(speed 0)

(define (draw_circle col x y r)
  (color col)
  (pu) (goto (+ x r) y) (pd)
  (begin_fill) (circle r) (end_fill))

(define (draw_rectangle col x y w h)
  (color col)
  (pu) (goto x y) (pd)
  (begin_fill)
  (goto (+ x w) y)
  (goto (+ x w) (+ y h))
  (goto x (+ y h))
  (goto x y)
  (end_fill))

(define (snow n x y z a)
  (if (= n 0)
    '()
    (begin
      (draw_circle "#D3D3D3" x y 2) 
      (snow (- n 1) (+ x z) (+ y a) z (* -1 a)))))      

;; body
(draw_circle "#D3D3D3" 0 -120 60)
(draw_circle "#D3D3D3" 0 -30 45)
(draw_circle "#D3D3D3" 0  40 32) 

;; buttons
(draw_circle "#333333" 0 -10 3)
(draw_circle "#333333" 0 -30 3)
(draw_circle "#333333" 0 -50 3)
(draw_circle "#333333" 0 -100 3)
(draw_circle "#333333" 0 -120 3)
(draw_circle "#333333" 0 -140 3)

;; eyes
(draw_circle "#000000" -10 50 3)
(draw_circle "#000000" 10 50 3)

;; nose
(color "#ff9933")
(pu) (goto 0 35) (pd)
(begin_fill)
(goto 18 30)
(goto 0 30)(pu)
(end_fill)

;; mouth
(color "black")
(pu) 
(draw_circle "#333333" -8 25 1.5)
(draw_circle "#333333" 0 23 1.5)
(draw_circle "#333333" 8 25 1.5) (pd)

;; hat
(draw_rectangle "#222222" -30 70 60 5)
(draw_rectangle "#222222" -15 75 30 25)

;;arms 
(color "#964B00")
(pu) (goto -35 -5) (pd)
(goto -70 20)
(goto -60 15)
(pu) (goto 35 -5) (pd)
(goto 70 20)
(goto 60 15)

;; snow lmao im so cool
(snow 11 -160 160 28 -12)
(snow 10 -140  40 30 -10)
(snow 11 -160 -80 28 -12)

(ht)
(exitonclick))


; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)