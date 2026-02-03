;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Fuzzy Cozy Christmas>
;;;
;;; Description:
;;;   <Can't retreat
;;;    From the sweet treats
;;;    That joyfully entice!>
(define a 0)
(define b 400) ;change b per frame to change body size 
(define d 100) 

(define colors '("blue" "red" "orchid" "mediumslateblue" "mediumspringgreen" "cyan" "fuchsia" "darkorange" "mediumturquoise" "orange"))
(define seed 1) ;change seed per frame to change star colors
(define (rand) (set! seed (modulo (+ (* seed 1103515245) 12345) 2147483648)) seed)
(define (randidx) (floor (* (/ (rand) 2147483648) 10)))

(define (getcolor c i)
  (if (= i 0) (car c) (getcolor (cdr c) (- i 1))))

(define (eye) (color "white") 
  (begin_fill) 
  (circle (/ b 12)) 
  (end_fill)
  (pu)
  (lt 90)
  (fd (- (/ b 12) 7))
  (rt 90)
  (pd)
  (begin_fill)
  (color "black")
  (circle 7)
  (end_fill)
  (rt 90)
  (pu)
  (fd (- (/ b 12) 7))
  (lt 90))

(define (fuzzy)
  (color "black")
  (if (> a b) (set! a 0)
  (begin 
    (fd a)
    (rt 170)
    (set! a (+ a 0.5))
    (fuzzy))))

(define (star) 
  (color (getcolor colors (randidx)))
  (define (str)
  (pd)
  (if (> a d) (set! a 0)
  (begin 
    (fd a)
    (rt 160)
    (set! a (+ a 0.5))
    (str))) 
  (pu))
  (str))

(define (body)
  (pd)
  (fuzzy)
  (fd (- (/ b 2) 5))
  (lt 90)
  (eye)
  (rt 90)
  (fd (+ 10 (/ b 6)))
  (pd)
  (lt 90)
  (eye))

(define (drawstar x y) (setposition x y) (star))

(define (draw)
  (bgcolor "navajowhite")
  (pu)
  (rt 10)
  (setposition -250 250)
  (body)
  (lt 40)
  (setposition 220 210)
  (body)
  (rt 20)
  (setposition -230 -220)
  (body)
  (lt 150)
  (setposition 240 -210)
  (body)
  (rt 160)
  (drawstar -50 5)
  (drawstar 0 200)
  (drawstar -430 430)
  (drawstar 420 440)
  (drawstar 430 -420)
  (drawstar 0 420)
  (drawstar 10 -410)
  (drawstar -420 -430)
  (drawstar 400 0)
  (drawstar -400 0)
  (ht)
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)