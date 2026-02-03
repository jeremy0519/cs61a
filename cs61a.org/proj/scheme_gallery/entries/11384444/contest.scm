;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Nightmare
;;;
;;; Description:
;;;   Three times every term,
;;;   Grades are yours alone to earn.
;;;   So get up and learn!

(define (draw)
  ; YOUR CODE HERE
  (pixelsize 5)
  (define (draw-horizontal-line x-start x-end y)
  (if (> x-start x-end)
      'done
      (begin
        (pixel x-start y (rgb 0 0 0))
        (draw-horizontal-line (+ x-start 1) x-end y))))
  (define (draw-vertical-line x y-start y-end)
  (if (> y-start y-end)
      'done
      (begin
        (pixel x y-start (rgb 0 0 0)) 
        (draw-vertical-line x (+ y-start 1) y-end))))
        
(draw-horizontal-line -54 52 69)
(draw-horizontal-line -54 52 -69)
(draw-vertical-line -54 -69 69)
(draw-vertical-line 52 -69 69)
(draw-horizontal-line -50 48 65)
(draw-horizontal-line -50 48 64)
(draw-horizontal-line -50 48 49)
(draw-horizontal-line -50 48 48)
(draw-horizontal-line -50 -48 61)
(draw-horizontal-line -50 -50 60)
(draw-horizontal-line -50 -50 59)
(draw-horizontal-line -50 -50 58)
(draw-horizontal-line -50 -48 57)
(draw-horizontal-line -46 -44 61)
(draw-horizontal-line -46 -46 60)
(draw-horizontal-line -46 -44 59)
(draw-horizontal-line -44 -44 58)
(draw-horizontal-line -46 -44 57)
(draw-horizontal-line -42 -40 61)
(draw-horizontal-line -42 -42 60)
(draw-horizontal-line -42 -40 59)
(draw-horizontal-line -40 -40 58)
(draw-horizontal-line -42 -42 58)
(draw-horizontal-line -42 -40 57)
(draw-horizontal-line -38 -38 61)
(draw-vertical-line -37 58 61)
(draw-horizontal-line -38 -36 57)
(draw-horizontal-line -33 -33 59)
(draw-vertical-line -34 57 60)
(draw-vertical-line -32 57 60)
(draw-horizontal-line -33 -33 61)
(draw-horizontal-line -50 -48 55)
(draw-horizontal-line -49 -49 53)
(draw-vertical-line -50 51 55)
(draw-vertical-line -46 51 54)
(draw-vertical-line -44 51 54)
(draw-horizontal-line -45 -45 55)
(draw-horizontal-line -45 -45 53)
(draw-vertical-line -42 51 55)
(draw-vertical-line -38 51 55)
(draw-horizontal-line -42 -40 51)
(draw-horizontal-line -38 -36 51)
(draw-horizontal-line -30 -28 51)
(draw-horizontal-line -30 -28 53)
(draw-horizontal-line -30 -28 55)
(draw-horizontal-line -30 -30 52)
(draw-horizontal-line -28 -28 54)
(draw-horizontal-line -26 -24 55)
(draw-horizontal-line -26 -24 51)
(draw-vertical-line -26 51 55)
(draw-vertical-line -24 51 55)
(draw-horizontal-line -22 -20 51)
(draw-horizontal-line -22 -20 53)
(draw-horizontal-line -22 -20 55)
(draw-horizontal-line -22 -22 52)
(draw-horizontal-line -20 -20 54)
(draw-horizontal-line -18 -16 51)
(draw-horizontal-line -18 -16 53)
(draw-horizontal-line -18 -16 55)
(draw-horizontal-line -16 -16 52)
(draw-horizontal-line -18 -18 54)
(draw-horizontal-line -50 43 24)
(draw-horizontal-line -50 28 20)
(draw-horizontal-line -50 33 4)
(draw-horizontal-line -50 43 -12)
(draw-horizontal-line -50 18 -16)
(draw-horizontal-line -50 23 -32)

(ht)
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)