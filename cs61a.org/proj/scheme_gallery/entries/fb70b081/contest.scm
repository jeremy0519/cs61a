;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Iterative Mandelbrot
;;;
;;; Description:
;;;   Falling, falling cause
;;;   there's an open door. Calling,
;;;   calling, I'm wanting more.

(define (draw)

  ; Complex numbers
  (define real? number?)
  (define (complex a b)
    (if (and (real? a) (real? b))
        (cons a b)))
  (define (re z)
    (if (real? z)
        z
        (car z)))
  (define (im z)
    (if (real? z)
        0
        (cdr z)))
  (define (add z1 z2)
    (complex (+ (re z1) (re z2))
             (+ (im z1) (im z2))))
  (define (mul z1 z2)
    (complex (- (* (re z1) (re z2)) (* (im z1) (im z2)))
             (+ (* (re z1) (im z2)) (* (im z1) (re z2)))))
  (define (sq z)
    (mul z z))
  (define (mag z)
    (re (add (sq (re z))
             (sq (im z)))))
  
  ; Screen coordinates
  (define screen-rad (/ (screen_height) 2))
  (define complex-rad 1.6)
  (define center -0.6)
  (define (complex-pixel x y)
    (add center
         (mul (/ complex-rad screen-rad)
              (complex x y))))
  
  ; Mandelbrot functions
  (define (mandelbrot-point c max-iterations)
    (define (helper z i)
      (define z (add c (sq z)))
      (cond ((> (mag z) 4) (/ i max-iterations))
            ((= i max-iterations) 1)
            (else (helper z (+ i 1)))))
    (helper 0 0))

  ; Drawing functions
  (define (draw-pixel x y i)
    (define stability (sqrt (mandelbrot-point (complex-pixel x y) i)))
    (define color
      (if (= stability 1)
          (rgb 0 0 0)
          (rgb (- 1 stability) stability 0.75)))
    (pixel x y color))
  (define (draw-mandelbrot i)
    (define (helper x y)
      (draw-pixel x y i)
      (cond ((> x screen-rad) (helper (- screen-rad) (+ y 1)))
            ((> y screen-rad) i)
            (else (helper (+ x 1) y))))
    (helper (- screen-rad) (- screen-rad)))
  (define (mandelbrot max-iterations)
    (define (helper i)
      (draw-mandelbrot i)
      (if (= i max-iterations)
          max-iterations
          (helper (+ i 1))))
    (helper 1))
  
  (ht) ;(speed 0)
  (draw-mandelbrot 100)
  ;(mandelbrot 100)

  (exitonclick))
(draw)