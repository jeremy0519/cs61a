;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Escher's Scheme 
;;;
;;; Description:
;;;   Tesselation based on "Regular division of the plane No. 99" by M. C. Escher 1954
;;;   Original image: [https://www.wikiart.org/en/m-c-escher/flying-fish](https://www.wikiart.org/en/m-c-escher/flying-fish)
;;;
;;;
;;; Flying fishes drift,
;;; Entangled in eternity -
;;; Python was easier.

(define (draw)


;; Constants

(define sideLen 100)
(define scaleFactor 0.12)


; Calculated from headListOrig - Angle for first line so that last point is in line with current heading
(define headListStartAngle 38.80972479924191)

(define headListOrig
(list 0 50
-6 50
-6 50
-6 50
-6 50
-6 25
-95 50
5 50
10 50
15 50
7 50
3 40
10 15
30 15
40 15
23 15
7 15
3 40
-2 50
4 50
10 40
15 70
-90 30
-10 50
-6 50
-6 50
-4 50
-4 50
-4 50
-4 47))

(define eyeList
(list 0 10
40 20
30 20
5 20
5 20
5 30
3 40
15 20
20 20
25 20
30 20
20 30
20 30
30 20
30 20
5 30
5 28
5 20
5 20
5 20
10 10
20 10
20 10))

; Calculated from halfWinglistOrig - Angle for first line so that last point is in line with current heading
(define halfWinglistOrigStartAngle 47.42440989687695)

(define halfWinglistOrig
(list 0 30
5 30
5 66
60 10
5 10
5 20
5 30
4 80
5 30
6 40
6 40
6 40
5 40
5 30
5 20
5 28))

(define decolines
(list
(list 483 485 75 100 10 70)
(list 552 464 45 60 -5 50)
(list 272 192 55 110)
(list 495 178 90 75)
(list 443 445 45 50 -25 50)
(list 550 400 85 50 15 50)
(list -5 112 14 100 -7 120)
(list 5 205 7 100 -7 120)
(list 45 300 -3 100 -13 110)
(list 260 100 3 70)
(list 427 110 -14 56)
(list 565 113 -4 60 -11 110 -5 100)
(list 565 153 -4 100 3 150)
(list 565 195 -2 100 9 50 9 90)
(list 370 60 85 50 -7 80 -6 80 -8 60 -2 60 -1 100 3 60 5 60 5 40)))




; Debug flag, if on, additional lines for tracing are drawn
(define debug? #f)


; Overloaded pendown for debug purposes
(define (pendownX)
    (pendown)
)


; Overloaded penup for debug purposes
(define (penupX)
  (if debug?
    (begin
      (color "green")
      (pendown)
    )
    (penup)
  )
)


; Set position and heading based on a list with format (list x y angle)
(define (setpos pos)
  (setposition (car pos) (car (cdr pos)))
  (setheading (+ 90 (car (cdr (cdr pos)))))
)


; Turn right then move forward assuming the position with format (list x y angle)
; Return the updated position 
(define (rightfwd oldPos angle dist)
  (right angle)
  (forward dist)
  (define newPos (calcNewPos oldPos angle dist))
  (setpos newPos)
  newPos
)


; Calculate new position with format (list x y angle) based on old position and angle/distance movement
; Return the updated position 
(define (calcNewPos oldPos angle dist)
  (define newAngle (+ (car (cdr (cdr oldPos))) angle))
  (define newAngleNeg (- newAngle))
  (define r (radians newAngleNeg))
  (define cosr (cos r))
  (define sinr (sin r))
  (define result
      (list (+ (car oldPos) (* dist (cos r))) ; new x
            (+ (car (cdr oldPos)) (* dist (sin r)))  ; new y
            newAngle)   ; new angle
  )
  result
)


; reverse list, optionally flip every angle
(define (reverseList lst turnAngle)
  (define (flip a)
    (if turnAngle (- a) a))

  (define (helper l)
    (if (null? l)
        '()
        (append (helper (cdr (cdr l)))
                (list (car (cdr l))        ; distance
                      (flip (car l))))))  ; angle 

  (append (cons 0 (helper lst)) (list 0))
)


; Move relative to current heading: forward x*factor, right 90, forward y*factor, left 90
(define (goRelative x y factor)
(penupX)
(forward (* x factor))
(right 90)
(forward (* y factor))
(left 90))



; Draws path for list [relX, relY, angle1, distance1, ..., angleN, distanceN] 
; Moves to (relX, relY) relative to current position and heading before drawing
; Path will be traced back so that position and heading will be same as at start
; factor scales the path length 
(define (drawPosPath path factor)
    (let ((x (car path))
          (y (car (cdr path))))

        (penup)
        (forward (* x factor))
        (right 90)
        (forward (* y factor))
        (left 90)
        (drawPath (cdr (cdr path)) factor #t #f)
        (penup)
        (right 90)
        (forward (- (* y factor)))
        (left 90)
        (forward (- (* x factor)))
    )
)

; Draws path for list [angle1, distance1, ..., angleN, distanceN] 
; factor scales the path length 
; traceback?=true causes the path to be traced back to start and restore original heading
(define (drawPath path factor traceback? eyeSpecial?)
    (define (innerDrawPath path factor traceback?)
        (if (not (null? path))
            (let ((angle (car path))
                (dist (car (cdr path))))
                (pendown)
                (right angle)
                (forward (* dist factor))     
                (innerDrawPath(cdr (cdr path)) factor traceback?) 
                (if traceback?
                    (begin
                        ; Special case: Don't undo the last angle
                        (if (not (null? (cdr (cdr path))))
                            (right (- (car (cdr (cdr path)))))
                        )
                        (forward (- (* dist factor)))
                    )
                )
            )
            (if eyeSpecial?  ;else branch  
              (begin
                (end_fill)
                (color "black") ; black on traceback
                (pendown)
              )
              (begin
                  (penup)
              ) 
            ) 
        )
    )
    (if eyeSpecial? (begin_fill))
    (innerDrawPath path factor traceback?)
    (if traceback?
        (right (- (car path))) ; Undo first angle
    )

)


; Scale distances in a list [angle1, distance1, ..., angleN, distanceN] based on a factor
(define (scaleList lst factor)
  (define (helper l idx)
    (cond
      ((null? l) '())
      (else
       (let ((val (car l)))
         (cons (if (odd? idx)
                   (* val factor)
                   val)
               (helper (cdr l) (+ idx 1)))))))
  (helper lst 0))



; Draws the head path; reverse option mirrors it for right side
(define (drawHead reverse?)
  (define scaledList (scaleList headListOrig scaleFactor))

  (define (innerDrawHead startAngle lst)
      (right startAngle)
      (drawPath lst 1 #f #f)
      (right (- startAngle 4))
  )
  (if reverse?
    (innerDrawHead (- headListStartAngle 73) (reverseList scaledList #t))
    (innerDrawHead headListStartAngle scaledList)
  )
) 


; drawWing: left side with two half wings (one reversed)
(define (drawWing)
  (let ((lst (scaleList halfWinglistOrig scaleFactor)))
    (let ((rlist (reverselist lst #t))
          (startangle halfWinglistOrigStartAngle ))
      (right startangle)
      (drawPath rlist 1 #f #f)
      (drawPath lst 1 #f #f)
      (left (+ startangle 180))
    )
  )
)


; drawEye: draws an eye at the current turtle location with scale factor.
(define (drawEye factor)
  (penupX)
  (color "white")
  (drawPath eyeList factor #t #t)
  (penupX)
  (right 110)
  (forward (* 80 factor))
  (pendownX)
  (color "black")
  (begin_fill)
  (circle (* 30 factor))
  (end_fill)
  ; traceback
  (penupX)
  (forward (* -80 factor))
  (left 110)
  (circle 1)
  (penupX)
  )

; Draws eyes and deco lines on fish
(define (drawFishDeco)
  (let ((factor scaleFactor))
    
    (goRelative 320 -78 factor)
    (drawEye factor)
    (goRelative -320 78 factor)
    (goRelative 412 -75 factor)
    (left 7)
    (drawEye factor)
    (right 7)
    (goRelative -412 75 factor)

    (color "black")

    (right 4)

    (define (drawList l factor)
      (if (not (null? l))
        (begin
          ( drawPosPath (car l) factor)
          (drawList (cdr l) factor)
        )
      )
    )
    (drawList decolines factor)
  )
)


; drawFish: draws the whole fish filled with a color.
(define (drawFish color-str pos)
  (color color-str)
  (begin_fill)
  ;; side 1
  (drawHead #f)
  (pendown)
  (define pos2 (calcNewPos pos 0 sideLen))
  (setpos pos2)
  ;; side 2
  (right 120)
  (drawHead #t)
  (define pos3 (calcNewPos pos2 120 sideLen))
  (setpos pos3)
  ;; side 3
  (right 120)
  (drawWing)
  (define pos4 (rightfwd (calcNewPos pos3 120 sideLen) 120 0))
  (setpos pos4)
  (end_fill)

  (drawFishDeco)
  (setposition (car pos4) (car (cdr pos4)))
  pos4
)


; Colors used for fishes
(define colors (list "#5AC8FA" "#FAC5DA" "#32D74B" "#FFF569" "#D580FF" "#FFCD9E"))


; drawFishCircle: draws 6 fish in a circle with pastel colors
(define (drawFishCircle lastPos)
  (define (loop colorList pos)
    (if (not (null? colorList))
        (begin
            (color "red")
            (define pos2 (drawFish (car colorList) pos))  
            (pendownX)
            (setpos pos2)
            (penupX)
            (define newPos (rightfwd (rightfwd pos2 60 sideLen) -120 0))
            (loop (cdr colorList) newPos)
        )
    )
  ) 
  (pendownX)
  (loop colors lastPos)
)

; Draw full picture with a total of 36 fishes arranged in 6 circles
(define (drawPictureFull)
  (penupX)
  (setposition -100 110)
  (right 90)
  (define (loop count lastPos)
    (if (<= count 3)
      (begin
        (penupX)
        (define pos1 (rightfwd lastPos 0 sideLen)) ; 
        (setposition (car pos1) (car (cdr pos1)))
        (define pos2 (rightfwd (rightfwd pos1 -60 sideLen) 60 0))
        
        (drawFishCircle pos2)
        (penupX)
        (define pos3 (rightfwd (rightfwd pos2 0 (* 2 sideLen)) 120 sideLen))

       (drawFishCircle pos3)
        (loop (+ count 1) pos3)
      )
    )
  )
  (loop 1 (list -100 110 0))
)


; Main setup and run
(bgcolor "white")
(speed 1)    


(drawPictureFull)


(exitonclick))


; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)