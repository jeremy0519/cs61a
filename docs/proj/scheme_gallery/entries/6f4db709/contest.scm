;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Cosmic Orbit
;;;
;;; Description:
;;; Circles spin around
;;; As a sun begins to glow
;;; The cosmic orbit forms.    



(define (draw-layer n total-circles size c1 c2)
  (if (> n 0) (begin
        (if (= (modulo n 2) 0)
            (color c1)
            (color c2)
        ) (circle size)
        (right (/ 360 total-circles))
        (draw-layer (- n 1) total-circles size c1 c2)))
  )

(define (draw)
  (speed 0)
  (hideturtle)
  (bgcolor "black")
  (draw-layer 30 30 150 "cyan" "dodgerblue")
  (right 6)
  (draw-layer 15 15 100 "hotpink" "mediumpurple")
  (color "yellow")
  (begin_fill)
  (circle 20)
  (end_fill)
  (exitonclick)
  )


; Please leave this last line alone. You may add additional procedures above
; this line.
(draw) 