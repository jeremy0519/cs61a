;;; Digital Cipher Tiling - Featherweight
;;;
;;; Description:
;;;   <Generates a structured, repeating pattern by recursively dividing a square
;;;    area and drawing the internal boundaries. This creates a visually coherent
;;;    tiling effect resembling a Sierpinski Carpet, using only basic arithmetic.>
;;;
;;; Comments included for readability


(define START-X -500)
(define START-Y -500)
(define SIZE 1000.0) ; The size of the first square
(define ITERATIONS 6) ; Number of times sequence is repeated and is only large enough to create illusion of repetition forever


; Border Color: Bright Cyan/Blue
(define (c-border) (rgb 0.2 1.0 1.0))

; Draw Line (draw-line): Recursively draws a horizontal or vertical segment
; mode=0 (Horizontal), mode=1 (Vertical)
(define (draw-line x y len color mode)
  (if (> len 0)
      (begin
        (pixel (floor x) (floor y) color)
        (if (= mode 0) ; When mode is Horizontal
            (draw-line (+ x 1) y (- len 1) color mode)
            ; When mode is Vertical
            (draw-line x (+ y 1) (- len 1) color mode)))
      #f))

; Helper function 1 - Handles column iteration (j)
(define (s-carp-col x y size count i new-size c-str j)
  (if (< j 3)
      (begin
        ; Calculate the top-left corner of the current 1/9th tile
        (let ((current-x (+ x (* j new-size))))
          (let ((current-y (+ y (* i new-size))))
            ; Check if it's NOT the center square (i=1, j=1)
            (if (or (< i 1) (> i 1) (< j 1) (> j 1))
                ; Recurse on the smaller tile
                (s-carp current-x current-y new-size (- count 1))
                ; If it IS the center square (i=1, j=1), draw its boundary
                (begin
                  (draw-line current-x current-y new-size c-str 0) ; Top
                  (draw-line current-x (+ current-y new-size) new-size c-str 0) ; Bottom
                  (draw-line current-x current-y new-size c-str 1) ; Left
                  (draw-line (+ current-x new-size) current-y new-size c-str 1) ; Right
                  ))))
        ; Recurse to the next column (j + 1)
        (s-carp-col x y size count i new-size c-str (+ j 1)))
      #f))

; Helper function 2 - Handles row iteration (i)
(define (s-carp-row x y size count i new-size c-str)
  (if (< i 3)
      (begin
        ; Start column iteration (j=0) for the current row (i)
        (s-carp-col x y size count i new-size c-str 0)
        ; Recurse to the next row (i + 1)
        (s-carp-row x y size count (+ i 1) new-size c-str))
      #f))


; Sierpinski Carpet Approximation (s-carp): Main recursive splitter
(define (s-carp x y size count)
  (if (> count 0)
      (let ((new-size (/ size 3.0)))
        (let ((c-str (c-border)))
          (s-carp-row x y size count 0 new-size c-str)))
      #f))

(define (draw)
  (clear)
  (hideturtle)

  (bgcolor (rgb 0.1 0.0 0.2)) ; Cyan color that you see
  (s-carp START-X START-Y SIZE ITERATIONS) 
  
  (exitonclick))
(draw)