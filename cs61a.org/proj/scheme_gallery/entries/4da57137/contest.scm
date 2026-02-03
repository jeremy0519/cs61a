;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;  Tiny troops collide,
;;;  A goblin cries mid-chaos-
;;;  Victory sparkles

(define (draw)
  ; YOUR CODE 
  (ht)
  (pu)
  (define pi 3.141592653589793)
  (define origin (list -300 0)) ;550 x 600

  (define (arcRight totalDeg radius absolute)
    (define step (/ totalDeg 4))
    (define step-angle (/ totalDeg step))
    (define step-rad (* radius (/ step-angle 180) pi))
    (define (loop i) (if (> i 0) (begin (fd step-rad) (rt step-angle) (loop (- i 1))))) 
    (begin (loop step) (setheading absolute))
  )

  (define (arcLeft totalDeg radius absolute)
    (define step (/ totalDeg 4))
    (define step-angle (/ totalDeg step))
    (define step-rad (* radius (/ step-angle 180) pi))
    (define (loop i) (if (> i 0) (begin (fd step-rad) (lt step-angle) (loop (- i 1))))) 
    (begin (loop step) (setheading (- 0 absolute)))
  )

  (define (messageBox) 
  (begin 
    (setposition (car origin) (car (cdr origin)))
    (pd) (fd 255) (arcRight 90 20 90) (fd 560) (arcRight 90 20 180) (fd 510) (arcRight 90 20 270) (fd 560) (arcRight 90 20 0) (fd 255) (pu))
  )
  
  (define (drawLeftArm) 
  (begin 
    (setposition (car origin) (- (car (cdr origin)) 50)) (setheading 0)
    (pd) (rt 60) (fd 100) (rt 30) (arcRight 70 100 160)) (arcRight 115 40 250) (pu) 
    (setheading 3) (fd 40) (setheading 165) (pd) (arcRight 115 40 195) (pu) (setheading 3) (fd 40) (setheading 165) (pd) (arcRight 100 40 295) (arcRight 50 20 345) (fd 20) (arcRight 120 5 315) (setheading 345) (fd 15) (bk 15) (setheading 255) (arcRight 90 35 345) (pu) (arcRight 270 35 225) (pd) (setheading 240) (fd 60) (pu)
  )

  (define (drawRightArm) 
  (begin 
    (setposition (+ (car origin) 600) (- (car (cdr origin)) 50)) (setheading 0)
    (pd) (lt 60) (fd 100) (lt 30) (arcLeft 70 100 160)) (arcLeft 115 40 250) (pu) 
    (setheading -3) (fd 40) (setheading -165) (pd) (arcLeft 115 40 195) (pu) (setheading -3) (fd 40) (setheading -165) (pd) (arcLeft 100 40 295) (arcLeft 50 20 345) 
    (fd 20) (arcLeft 120 5 315) (setheading -345) (fd 15) (bk 15) (setheading -255) (arcLeft 90 35 345) (pu) (arcLeft 270 35 225) (pd) (setheading -240) (fd 60) (pu)
  )

  (define (drawHead) 
  (begin 
    (setposition -165 -13) (setheading 357) (pd) (fd 200) (setheading 50) (arcRight 80 260 130) (setheading 183) (fd 215) (pu)
    (setposition 145 -120) (pd) (setheading 190) (arcRight 65 85 255) (setheading -15) (fd 10) (bk 10)
    (setheading 220) (arcRight 105 100 320) (pu)
    (setposition -145 -120) (pd) (setheading 170) (arcLeft 75 85 95) (setheading 15) (fd 10) (bk 10) (pu))
  )

  (define (drawEyes)
  (begin 
    (setposition 20 130) (setheading 0)
    (pd) (fd 25) (setheading 30) (fd 25) (pu)
    (setposition 70 155) (setheading 145) (pd) (fd 17) (pu)
    (setposition -20 130) (setheading 0)
    (pd) (fd 25) (setheading -30) (fd 25) (pu)
    (setposition -70 155) (setheading -145) (pd) (fd 17) (pu)

    (setposition 30 123) (setheading 145) 
    (pd) (fd 45) (setheading 105) (fd 80) (setheading 35) (fd 25) (setheading 290) (fd 75) (setheading 315) (fd 50) (setheading 210) (fd 30) (pu)
    (setposition 45 103) (setheading 235) (pd) (arcLeft 260 65 325) (pu)
    (setposition 55 90) (setheading 235) (pd) (begin_fill) (arcLeft 175 45 60) (setheading 330) (arcRight 175 10 145) (setheading 30) (arcLeft 60 45 50) (end_fill) (pu)
    
    (setposition -30 123) (setheading -145) 
    (pd) (fd 45) (setheading -105) (fd 80) (setheading -35) (fd 25) (setheading -290) (fd 75) (setheading -315) (fd 50) (setheading -210) (fd 30) (pu)
    (setposition -45 103) (setheading -235) (pd) (arcRight 260 65 25) (pu)
    (setposition -55 90) (setheading -235) (pd) (begin_fill) (arcRight 175 45 300) (setheading -330) (arcLeft 175 10 155) (setheading -30) (arcRight 60 45 90) (end_fill) (pu))
  )

  (define (drawNose) 
  (begin 
    (setposition 20 2) (setheading 90) 
    (pd) (arcRight 90 45 180) (setheading 225) (arcRight 93 90 250) (pu)
    (setposition -20 2) (setheading -90)
    (pd) (arcLeft 90 45 180) (pu))
  )

  (define (drawMouth) 
  (begin 
    (setposition 60 -145) (setheading 280) (pd) (arcLeft 70 50 220) (setheading -22) (arcLeft 80 50 270) 
    (pu) (setposition -20 -140) (setheading 60) (pd) (arcLeft 60 40 0) (fd 10) (pu))
  )

  (define (drawBody) 
  (begin 
    (setposition 105 -180) (setheading 186)
    (begin_fill)
    (pd) (fd 97) (pu)
    (setposition 115 -275) (setheading 6) (pd) (fd 115) (pu)
    (end_fill)

    (setposition 145 -120)
    (setheading 160)
    (pd)
    (arcRight 20.2 400 175) (pu)
    
    (setposition -105 -180) (setheading -186) 
    (begin_fill)
    (pd) (fd 97) (pu)
    (setposition -115 -275) (setheading -6) (pd) (fd 115) (pu)
    (end_fill)

    (setposition -145 -120)
    (setheading -160)
    (pd)
    (arcLeft 20.2 400 185) (pu))
  )

  (define (drawEars) 
  (begin 
    (setposition 152 30) (setheading 50) (pd) (fd 40) (setheading 140) (fd 10) (setheading 190) (arcRight 15 200 220) (pu)
    (setposition -170 30) (setheading -50) (pd) (fd 40) (setheading -140) (fd 10) (setheading -190) (arcLeft 15 200 220) (pu))
  )

  (messageBox)
  (drawLeftArm)
  (drawRightArm)
  (drawEars)
  (drawHead)
  (drawBody)
  (drawEyes)
  (drawNose)
  (drawMouth)

  (exitonclick)
)


; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)
