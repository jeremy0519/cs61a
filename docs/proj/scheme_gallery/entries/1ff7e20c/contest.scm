;;; Scheme Recursive Art Contest Entry
;;;
;;; Title: The Quantum Bloom
;;; Description: Neon spiral petals in a rotating mandala.

;; Quick teleport without drawing
(define (teleport x y)
  (penup)
  (setposition x y)
  (pendown))

(define (pencolor c)
  (color c))

(define (my-list-ref lst k)
  (if (= k 0)
      (car lst)
      (my-list-ref (cdr lst) (- k 1))))

(define (get-color i)
  (define colors
    (list "#ff0000" "#0000cd" "#008000" "#8b008b" "#ff4500" "#c71585"))
  (my-list-ref colors (modulo i (length colors))))

(define (draw-bloom size angle depth)
  (if (> depth 0)
      (begin
        (pencolor (get-color depth))
        (forward size)
        (right angle)
        (draw-bloom (* size 0.92) angle (- depth 1))
        (right 90)
        (forward (* size 0.1))
        (left 90))
      'done))

(define (draw-mandala count)
  (if (> count 0)
      (begin
        (teleport 0 0)
        (setheading (* count 36))
        (draw-bloom 100 92 12)
        (draw-mandala (- count 1)))
      'done))

(define (draw)
  (bgcolor "black")
  (speed 0)
  (hideturtle)
  (draw-mandala 10)
  (exitonclick))

(draw)
