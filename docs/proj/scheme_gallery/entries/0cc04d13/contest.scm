;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Six Seven (3D)
;;;
;;; Description:
;;;    How many lines did 
;;;    it take to code this drawing?
;;;    You know the answer.

(define (draw)
  (begin 
    (define (six) 
      (define (recurse deg)
        (if (<= deg 20) 
          (begin 
            (setheading deg)
            (forward 32) 
            (recurse (+ deg 3))
          )
          (if (<= deg 70)
            (begin
                (setheading deg)
                (forward 40) 
                (recurse (* deg 1.2))
            )
          )
        )
      )
      (begin
        (circle -150)
        (recurse 0)
      )
    )

    (define (seven) 
      (setheading 90)
      (forward 350) 
      (setheading 196.7)
      (forward 600) 
    )

    (define (repeat f n x y)
      (if (> n 0)
        (begin
          (penup)
          (goto x y)
          (pendown)
          (setheading 0)
          (f)
          (repeat f (- n 1) (+ x 1) (+ y 1))
        )
      )
    )

    (speed 10) 
    (repeat six 30 -367 -180)
    (repeat seven 30 67 250)
    (penup)

  )
  (exitonclick)
)
; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)