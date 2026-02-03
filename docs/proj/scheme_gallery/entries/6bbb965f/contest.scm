;;; Scheme Recursive Art Contest Entry
;;;
;;; Title: <(Stud)Ants versus some Bs!>
;;;
;;; Description:
;;;   <To B or not to B?
;;;    That is the question.
;;;    The midterm stung us enough.>

(define (draw-B size)
  (begin
    (setheading 0) (pendown) (forward size) (right 90)
    (forward (* 0.2 size)) (circle (* -0.25 size) 180) (forward (* 0.2 size))
    (left 180) (forward (* 0.2 size)) (circle (* -0.25 size) 180) 
    (forward (* 0.2 size)) (left 180)
    (penup) (setheading 90) (forward (* 0.5 size))
  ))

(define (draw-o size)
  (begin
    (setheading 0)
    (forward (* 0.2 size))
    (right 90)
    (pendown)
    (circle (* -0.2 size))
    (penup) (left 90)
    (backward (* 0.2 size))
    (setheading 90)
    (forward (* 0.5 size))))

(define (draw-comma size)
  (begin
    (setheading 90) (pendown) (right 45)
    (circle (* 0.2 size) 90)
    (penup) (setheading 90)
  ))

(define (draw-reverse-comma size)
  (begin
    (setheading 270)
    (pendown)
    (right 45)
    (circle (* 0.2 size) 90)
    (penup)
    (setheading 90)
  ))

(define (draw-less size)
  (begin
    (setheading 0)
    (penup)
    (forward (* 0.2 size))
    (setheading 90)
    (pendown)
    (left 45)
    (forward (* 0.4 size))
    (backward (* 0.4 size))
    (right 90)
    (forward (* 0.4 size))
    (backward (* 0.4 size))
    (left 45)
    (penup)
    (setheading 180)
    (forward (* 0.2 size))
    (setheading 90)
    (forward (* 0.4 size))
  ))

(define (draw-antenna size)
  (begin
    (setheading 90)
    (pendown)
    (left 70)
    (forward (* 0.2 size))
    (backward (* 0.2 size))
    (right 70)
    (forward (* 0.1 size))
    (left 70)
    (forward (* 0.2 size))
    (backward (* 0.2 size))
    (right 70)
    (penup)
  ))

(define (draw-wing-arc size direction)
  (begin
    (setheading direction)
    (pendown)
    (circle (* 0.3 size) 120)
    (penup)
  ))

(define (draw-ant-segment size)
  (begin
    (define start-x 0)
    
    (left 90) (forward (* 0.6 size)) (right 90)
    (draw-comma size)
    (left 90) (backward (* 0.6 size)) (right 90)
    
    (left 90) (forward (* 0.25 size)) (right 90)
    (draw-o size)
    (left 90) (backward (* 0.25 size)) (right 90)
    (backward (* 0.5 size))
    
    (right 90) (forward (* 0.2 size)) (left 90)
    (draw-reverse-comma size)
    (left 90) (forward (* 0.2 size)) (right 90)

    (forward (* 0.6 size))
  ))

(define (draw-ant-body n size)
  (if (= n 0)
      (begin
        (pu)
        (left 90) (forward (* 0.1 size))
        (pd)
        (draw-less size)
      )
      (begin
        (draw-ant-segment size)
        (draw-ant-body (- n 1) size))))

(define (draw-ant size)
  (draw-ant-body 3 size))

(define (draw-bee size)
  (begin
    (setheading 90)
    (backward (* 0.2 size))
    (draw-wing-arc size 210)
    (setheading 90)
    (forward (* 0.2 size))
    
    (draw-B size)
    
    (left 90) (forward size) (left 90) (forward (* 0.4 size)) (right 180) ;; align
    (draw-antenna size)
    (left 90) (backward size) (right 90) (forward (* 0.4 size)) ;; return
    
    (setheading 0) (right 60) (pendown)
    (draw-wing-arc size 60)
    (penup) (setheading 90) (forward (* 0.5 size))))

(define (draw-B-row n size)
  (if (= n 0)
      (penup)
      (begin
        (draw-B size)
        (forward (* 0.1 size))
        (draw-B-row (- n 1) size))))

(define (draw-hive-recursive row size)
  (if (< row 7)
      (begin
         ; 3, 7, 9, 9, 7, 3
         (define count (cond ((= row 1) 3) ((= row 2) 7) ((= row 3) 9) ((= row 4) 9)
                             ((= row 5) 7) ((= row 6) 3) 
                             (else 0)))
         
         (define next-count (cond ((= row 1) 7) ((= row 2) 9) ((= row 3) 9) ((= row 4) 7)
                                  ((= row 5) 3) ((= row 6) 0)
                                  (else 0)))
         
         (draw-B-row count size)

         (penup)
         (left 180)
         (forward (* count 0.6 size))
         (left 180)

         (right 90)
         (forward (* 1.2 size)) 
         (left 90)

         (if (> next-count 0)
             (begin
                (if (> count next-count)
                    (forward (* 0.3 size (- count next-count)))
                    (backward (* 0.3 size (- next-count count)))
                )
                (draw-hive-recursive (+ row 1) size)
             )
         )
      )
      (penup)
  ))

(define (draw-hive size)
  (draw-hive-recursive 1 size))

(define (draw)
  (begin
    (speed 0)
    (hideturtle)
    (penup)
    (bgcolor "white")
    (color "black")

    (setposition -460 150)
    (draw-ant 60)
    
    (setposition -390 20)
    (draw-ant 60)
    
    (setposition -460 -80)
    (draw-ant 60)

    (setposition -30 150)
    (draw-bee 70)
    
    (setposition -80 50)
    (draw-bee 70)
    
    (setposition -30 -80)
    (draw-bee 70)

    (setposition 350 200)
    (draw-hive 60)

    (exitonclick)
  ))

(draw)