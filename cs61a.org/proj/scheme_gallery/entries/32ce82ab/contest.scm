;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Bay Area Transportation
;;;
;;; Description:
;;;   Bay be wildin' out:
;;;    freeways, stroads, buses, and trains
;;;    in 4-fractal star.

(define (draw)
  (bgcolor "#0c1d41")
  (color "#FEC427")
  (pendown)
  (fd 210)
  (define (triangle l) (if (< l 2) l (begin (pendown) (fd l) (rt 240) (fd l) (rt 240) (fd l) (rt 240) (triangle (/ l 2)) (penup) (fd (/ l 2)) (triangle (/ l 2)) (penup) (rt 240) (fd (/ l 2)) (rt 240) (triangle (/ l 2)))))
  (triangle 256)
  (color "#ffffff")
  (rt 90)
  (triangle 256)
  (color "#f3b0ba")
  (rt 90)
  (triangle 256)
  (color "#c8aa76")
  (rt 90)
  (triangle 256)
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)