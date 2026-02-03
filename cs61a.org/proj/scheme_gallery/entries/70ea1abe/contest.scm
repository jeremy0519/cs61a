;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Mandelbrot Set
;;;
;;; Description:
;;;   <This is so poorly
;;;    coded it takes twenty three
;;;    minutes to finish.>

(define colors (list "#0000FF" "#000CFF" "#0019FF" "#0026FF" "#0033FF" "#003FFF" "#004CFF" "#0059FF" "#0066FF" "#0072FF" "#007FFF" "#008CFF" "#0099FF" "#00A5FF" "#00B2FF" "#00BFFF" "#00CCFF" "#00D8FF" "#00E5FF" "#00F2FF" "#00FFFF" "#00FFF2" "#00FFE5" "#00FFD8" "#00FFCC" "#00FFBF" "#00FFB2" "#00FFA5" "#00FF99" "#00FF8C" "#00FF7F" "#00FF72" "#00FF66" "#00FF59" "#00FF4C" "#00FF3F" "#00FF33" "#00FF26" "#00FF19" "#00FF0C" "#00FF00" "#0CFF00" "#19FF00" "#26FF00" "#33FF00" "#3FFF00" "#4CFF00" "#59FF00" "#66FF00" "#72FF00" "#7FFF00" "#8CFF00" "#99FF00" "#A5FF00" "#B2FF00" "#BFFF00" "#CCFF00" "#D8FF00" "#E5FF00" "#F2FF00" "#FFFF00" "#FFFA00" "#FFF600" "#FFF100" "#FFED00" "#FFE800" "#FFE400" "#FFDF00" "#FFDB00" "#FFD600" "#FFD200" "#FFCD00" "#FFC900" "#FFC400" "#FFC000" "#FFBB00" "#FFB700" "#FFB200" "#FFAE00" "#FFA900" "#FFA500" "#FF9C00" "#FF9400" "#FF8C00" "#FF8400" "#FF7B00" "#FF7300" "#FF6B00" "#FF6300" "#FF5A00" "#FF5200" "#FF4A00" "#FF4200" "#FF3900" "#FF3100" "#FF2900" "#FF2100" "#FF1800" "#FF1000" "#FF0800"))

(define (getcolor n colorlist)
  (if (= n 0) (car colorlist) (getcolor (- n 1) (cdr colorlist))))

(define (calc a1 b1 a2 b2 iter)
  (define a22 (* a2 a2))
  (define b22 (* b2 b2))
  (cond
    ; change the iteration num to increase the accuracy and runtime
    ; runtime is probably directly proportional to the iteration num
    ; if changing make sure to increase the length of colors
    ((> iter 99) -1)
    ((> (+ a22 b22) 4) iter)
    (else (calc a1 b1 (+ a22 (- 0 b22) a1) (+ (* (+ a2 a2) b2) b1) (+ iter 1)))))

(define (maptocolor a b)
  (define x (calc a b 0 0 0))
  (if (= x -1) "black" (getcolor x colors)))

(define (loop f n)
  (if (= n 0) 0 (begin (f) (loop f (- n 1)))))

(define (draw)
  ; turtle setup
  ; change the pixelsize to decrease resolution and runtime
  ; runtime inversely proportional to psize^2
  (define psize 1)
  (define curx -500)
  (define cury 500)
  (speed 0)
  (ht)
  (pu)
  (right 90)
  (goto curx cury)

  ; function setup
  (define (drawpixel)
    (pd)
    (color (maptocolor (- (/ curx 375) 0.7) (/ cury 375)))
    (begin_fill)
      (fd psize) (right 90)
      (fd psize) (right 90)
      (fd psize) (right 90)
      (fd psize) (right 90)
    (end_fill)
    (pu)
    (fd psize)
    (set! curx (+ curx psize)))

  (define (drawrow)
    (loop drawpixel (/ 1000 psize))
    (set! curx -500)
    (set! cury (- cury psize))
    (goto curx cury))

  ; drawing
  (loop drawrow (/ 1000 psize))

  (exitonclick))

(draw)