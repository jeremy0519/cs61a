;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Snake Game
;;;
;;; Description:
;;;   <Never ending game
;;;    Busy growing the blue snake
;;;    Yes, I am in class>


(define (draw_one_square input_color)
  (begin 
  
  (cond ((equal? input_color 0) (color "#aad750")) ; light green
     ((equal? input_color 1)(color "#a2d148")); dark green
     ) 
  
  (begin_fill) ; draws one square
    (fd 75)
    (rt 90)
    (fd 75)
    (rt 90)
    (fd 75)
    (rt 90)
    (fd 75)
    (rt 90)
  (end_fill)
)
  )


(define (draw_one_row_1) ; starts with daker green on bottom
  (begin
  (define (helper input_color length)
    (if (equal? length 0) (penup)
        (begin
          (draw_one_square input_color)
          (penup)
          (fd 75)
          (pendown)
          (helper (modulo (+ input_color 1) 2) (- length 1))
        )
    )
  )
  )
  (helper 0 8)
)

(define (draw_one_row_2) ; starts with light green on bottom 
  (begin
  (define (helper input_color length)
    (if (equal? length 0) (penup)
        (begin
          (draw_one_square input_color)
          (penup)
          (fd 75)
          (pendown)
          (helper (modulo (+ input_color 1) 2) (- length 1))
        )
    )
  )
  )
  (helper 1 8)
)

(define (draw_checkerboard)
  (define (helper row_type x_coord counter) 
    (if (equal? counter 0) (penup) (
    begin
      (if (equal? row_type 0) (draw_one_row_1) ; takes turned with the type of rows to make the checkerboard 
        (draw_one_row_2)
      )
      (penup)
      (setposition x_coord -300)
      (pendown)
      (helper (modulo (+ row_type 1) 2) (+ x_coord 75) (- counter 1)) ; 75 is sidelength of square
    
    )
    ))
  
  (helper 0 -300 9) ; first time around will copy the first row, so for 8x8 i need to start recursive call at 9
)



(define (draw_snake_2) ; version which draws whole snake with one fill call
 (begin
  (color "#4774ea")
  (begin_fill)
    (fd 75)
    (rt 90)
    (fd 150)
    (rt 90)
    (fd 75)
    (rt 90)
    (fd 150)
    (lt 90)
    (fd 300)
    (lt 90) ; tried to shorten tokens with lt but left and lt same # of tokens
    (fd 75)
    (left 90)
    (fd 300)
    (left 90)
    (fd 75)
  (setposition -150 -150)
  (left 270)
    (fd 75)
    (rt 90)
    (fd 225)
    (rt 90)
    (fd 75)
    (rt 90)
    (fd 225)
  (end_fill)

 )

)

(define (draw_apple) ; maybe put directly into draw function if too many tokens
  (color "red")
  (begin_fill) ; draws one square, call the draw one square and add another cond if this doesn't work
    (fd 75)
    (rt 90)
    (fd 75)
    (rt 90)
    (fd 75)
    (rt 90)
    (fd 75)
    (rt 90)
  (end_fill)
)


(define (draw)
  ; YOUR CODE HERE
  (speed 10) 
  (penup)
  (setposition -300 -300)
  (pendown) ; the drawing row funciton makes a vertical row so I'll make vertical rows left to right to create the baord

  (draw_checkerboard) ; checkerboard
  (penup)
  (setposition 150 -150)
  (pendown)
  (draw_apple) ; apple
  (penup)
  (setposition -225 150)
  (draw_snake_2) ; snake 
  (ht)

  (exitonclick)
  
)
;  (draw_one_row_1)
;  (penup)
;  (setposition -225 -300)
;  (pendown)
;  (draw_one_row_2)
; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)