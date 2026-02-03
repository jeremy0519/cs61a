;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: pokemon or something (idk i don't play pokemon)
;;;
;;; Description:
;;;   my mom once told me
;;;   "i heard you like pokemon"
;;;   (i like digimon)


(define (draw)
  ; YOUR CODE HERE
  ;to run: python3 scheme contest.scm --turtle-save-path output 
  ;tokens: python3 scheme_tokens.py contest.scm
  ;buddy starts in the middle

  (ht)
  (speed 10)
  (define w (screen_width))
  (define h (screen_height)) ;this code should scale by screen size

  ;ball
  (pu)
  (goto (* 0.25 w) 0)
  (pd)
  (begin_fill)
  (color "#FF0000")
  (circle (* 0.25 w) 180)
  (end_fill)
  (color "#000000")
  (circle (* 0.25 w) 180)

  (goto (* 0.05 w) 0)
  (begin_fill)
  (circle (* 0.05 w))
  (end_fill)
  (goto (- 0 (* 0.25 w)) 0)

  (pu)
  (color "#FFFFFF")
  (goto (* 0.02 w) 0)
  (pd)
  (begin_fill)
  (circle (* 0.02 w))
  (end_fill)

  (pu)
  (color "#000000")
  (goto (* 0.01 w) 0)
  (pd)
  (begin_fill)
  (circle (* 0.01 w))
  (end_fill)

  ;eyes
  (color "#000000")

  (pu)
  (goto (* 0.20 w) (* 0.07 h))
  (pd)
  (begin_fill)
  (circle (* 0.05 w))
  (end_fill)
  (pu)

  (goto (- 0 (* 0.10 w)) (* 0.07 h))
  (pd)
  (begin_fill)
  (circle (* 0.05 w))
  (end_fill)
  (pu)


  (color "#FFFFFF")


  (goto (* 0.16 w) (* 0.095 h))
  (pd)
  (begin_fill)
  (circle (* 0.02 w))
  (end_fill)
  (pu)

  (goto (- 0 (* 0.12 w)) (* 0.095 h))
  (pd)
  (begin_fill)
  (circle (* 0.02 w))
  (end_fill)
  (pu)

  ;mouth
  (color "#000000")
  (goto (* 0.1 w) (- (* 0.075 h)))
  (pd)
  (begin_fill)
  (left 90)
  (forward (* 0.2 w))
  (left 90)
  (circle (* 0.1 h) 180)
  (end_fill)



  (exitonclick))
; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)