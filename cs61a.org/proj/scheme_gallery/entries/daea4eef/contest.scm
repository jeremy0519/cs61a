


(define (foreachloop lst  proc)
  ( define (iterate rest  i)
    (if (null? rest)
        'done
        (begin  
          (proc i (car rest))
          (iterate (cdr rest) (+ i 1)))))
  (iterate lst 0))

(define (drawSqr x y size fillColor )
(penup)
  (setposition x y)
(setheading 0)
  (pendown)
  (color fillColor)
  (begin_fill)
  (forward size)
  (right 90)
  (forward  size)
  (right 90)
  (forward size)
  (right 90)
  (forward size)
  (end_fill))


(define (drwDnero originx originy size)
 (define skin (rgb 1 0.85 0.7))
  (define hair (rgb 0.3 0.15 0))

   (define shirt (rgb 0 0.25 0.6))
  (define eye (rgb 0 0 0))
  (define frame (rgb 0.8 0.8 0.8))


(define mouth (rgb 0.8 0.4 0.3))
  (define ray (rgb 1 1 0))
  (define (cell col row color)
    (drawSqr (+ originx (* col size))
             (- originy (* row size))
             size
             color))


  ; jonnyz beautiful hair 
  (cell 0 0 hair)
  (cell 1 0 hair )
  (cell 2 0 hair )

  (cell 3 0 hair)
  (cell 4 0 hair)
  (cell 5 0 hair)
  (cell 6 0 hair)
  


  (cell 0 1  hair)
  (cell 1 1 hair)
  (cell 2 1 skin)
  (cell 3 1 skin)
  (cell 4 1 skin)
  (cell 5 1 hair)
  (cell 6 1 hair)
  

  (cell 1 2 frame)
  (cell 2 2 eye)
  (cell 3 2 frame)
  (cell 4 2 eye)
  (cell 5 2 frame)

  (cell 0 2 skin)
  (cell 6 2 skin)



  (cell 0 3 skin)
  (cell 1 3 skin)
  (cell 2 3 skin)
  (cell 3 3 skin)
  (cell 4 3 skin)
  (cell 5 3 skin)
  (cell 6 3 skin)


  (cell 2 4 mouth)
  (cell 3 4 mouth)
  (cell 4 4 mouth)
  (cell 1 4 skin)
  (cell 5 4 skin)


  (cell 2 5 skin)
  (cell 3 5 skin)
  (cell 4 5 skin)

  (cell 3 6 skin)
  (cell 1 7 shirt)
  (cell 2 7 shirt)
  (cell 3 7 shirt)
  (cell 4 7 shirt)
  (cell 5 7 shirt)
  (cell 2 8 shirt)
  (cell 3 8 shirt)
  (cell 4 8 shirt)

  (cell 0 7 shirt)
  (cell -1 7 shirt)
  (cell -2 7 skin)

  (cell 6 7 shirt)
  (cell 7 7 shirt)
  (cell 8 7 skin)
  (cell 2 -3 ray)
  (cell 3 -3 ray)
  (cell 4 -3 ray)




  (cell 1 -2 ray)
  (cell 5 -2 ray)
  (cell 0 -1 ray)
  (cell 6 -1 ray)


  (cell 1 0 ray)
  (cell 5 0 ray)


  (cell 1 9 shirt)
  (cell 2 9 shirt)
  (cell 3 9  shirt)
  (cell 4 9 shirt)
  (cell 5 9 shirt)


  (define legs (rgb 0.1 0.1 0.3))

  (cell 2 10 legs)
  (cell 3 10 legs)
  (cell 4 10 legs)
  (cell 2 11 legs)
  (cell 4 11 legs))


(define SEVENENNN
'((1 1 1 1 1)
  (0 0 0 0 1)
  (0 0 0 1 0)
  (0 0 1 0 0)
  (0 1 0 0 0))
)

(define   SIXXXX
  '((0 1 1 1 0)
    (1 0 0 0 0)
    (1 1 1 1 0)
    (1 0 0 0 1)
    (0 1 1 1 0))
)

(define (drawSIXXSEVENNNNNN cx cy blockSize depth)
  (define gap (* 2 blockSize))
  (define total-width (+ (* 2 (* blockSize 5)) gap))
  (define leftx (- cx (/ total-width 2)))
  (define topY (+ cy (/ (* blockSize 5) 2)))
  (drawnum SIXXXX leftx topY blockSize depth 0)
  (drawnum SEVENENNN (+ leftx (* blockSize 5) gap) topY blockSize depth 1)
)

(define (getuniquecolor   depth   row   col )
  (define (k) (modulo (+ depth row col) 4))
  (if (= (k) 0)
    (rgb 0.7 0   0)
      (if (= (k) 1)
          (rgb 0   0.5 0)
        (if (= (k) 2)
         (rgb 0.6 0.4 0)
          (rgb 0   0.3 0.6))))
)


(define (drawnum pattern basex basey blockSize depth offset)
  (foreachloop
   pattern
   (lambda (row-idx row)
     (foreachloop
      row
      (lambda (col-idx cell)
        (if (not (zero? cell))
            (drawSqr
             (+ basex (* col-idx blockSize))
              (- basey (* row-idx blockSize))
             blockSize
             (getuniquecolor (+ depth offset) row-idx col-idx))
            'skip)))))
  (if (> depth 0)
      (foreachloop
       pattern
       (lambda (row-idx row)
         (foreachloop
          row
          (lambda (col-idx cell)
            (if (and (not (zero? cell))
                     (= (modulo (+ row-idx col-idx depth offset) 5) 0))
                (drawSIXXSEVENNNNNN
                 (+ (+ basex (* col-idx blockSize))
                    (/ blockSize 2.0))
                 (- (- basey (* row-idx blockSize))
                    (/ blockSize 2.0))
                 (* 0.2 blockSize)
                 (- depth 1))
                'skip)))))
      'done))
;GOATED DRAWING BOIZZ
(define (draw)
  (bgcolor "dark green")
  (hideturtle)
  (speed 0)
  (pixelsize 3)
    (drawSqr -1000 1000 2000 (rgb 0 0.25 0))
     (drwDnero -120 160 30)
      (drawnum SIXXXX -380 40 50 3 0)
       (drawnum SEVENENNN 100 40 50 3 1)
  (exitonclick)
)



(draw)
