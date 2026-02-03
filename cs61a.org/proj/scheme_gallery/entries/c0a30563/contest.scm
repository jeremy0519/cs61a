;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: 6-7
;;;
;;; Description:
;;;   Six and seven sit
;;;   brainrot enters CS class
;;;   numbers bring joy

(define (draw)
(color "blue")
;; 6
(penup)
(setposition -80 0)
(setheading 90)
(pendown)
(right 90)
(forward 60)
(left 90)
(forward 40)
(left 90)
(forward 30)
(left 90)
(forward 40)
(left 90)
(forward 15)

;; 7
(penup)
(setposition -20 0)
(setheading 90)
(pendown)
(forward 50)
(right 115)
(forward 70)
(hideturtle)
(save-to-file "67")
(exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)