;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: "Newton's Fractal"
;;;
;;; Description:
;;;   I thought this would be easy to make.
;;;   
;;;   

; Please leave this last line alone. You may add additional procedures above
(define max-iters 50)

(define (sq a) (* a a))
(define (im z) (car (cdr z)))
(define (mag2 z) (+ (sq (car z)) (sq (im z))))

(define (newton-step z)
  (let ((x (car z))
        (y (im z)))
    (let ((x2 (sq x)))
      (let ((y2 (sq y)))
        (let ((f-re (- (* (- x2 y2) x) 1))
              (f-im (* (* 3 x) y2)))
          (let ((df-re (* 3 (- x2 y2)))
                (df-im (* 6 x y)))
            (let ((den (+ (sq df-re) (sq df-im) 1e-6)))
              (let ((nx (- x (/ (+ (* f-re df-re) (* f-im df-im)) den)))
                    (ny (- y (/ (- (* f-im df-re) (* f-re df-im)) den))))
                (list nx ny)))))))))

(define root1 '(1 0))
(define root2 '(-0.5 0.8660254))
(define root3 '(-0.5 -0.8660254))

(define (dist2 z r)
  (let ((dx (- (car z) (car r)))
        (dy (- (im z) (im r))))
    (+ (sq dx) (sq dy))))

(define (root-index z)
  (let ((d1 (dist2 z root1))
        (d2 (dist2 z root2))
        (d3 (dist2 z root3)))
    (cond ((and (< d1 d2) (< d1 d3)) 1)
          ((< d2 d3) 2)
          (else 3))))

(define (newton-info x0 y0)
  (define (loop z n)
    (if (or (= n max-iters)
            (> (mag2 z) 9))
        (list z n)
        (loop (newton-step z) (+ n 1))))
  (loop (list x0 y0) 0))

(define (color z n)
  (if (= n max-iters)
      "black"
      (let ((t (/ n max-iters))
            (r (root-index z)))
        (cond
          ((= r 1)
           (rgb (+ 0.6 (* 0.4 t))
                (* 0.2 (- 1 t))
                (* 0.1 (- 1 t))))
          ((= r 2)
           (rgb (+ 0.4 (* 0.5 t))
                (+ 0.15 (* 0.3 t))
                0))
          (else
           (rgb (+ 0.2 (* 0.3 t))
                (* 0.1 t)
                (* 0.1 (- 1 t))))))))

(define (draw)
  (pixelsize 1)
  (define (row y)
    (if (> y 125)
        'done
        (begin
          (define (col x)
            (if (> x 225)
                'done
                (let ((cx (/ (+ x -160) 200.0)))
                  (let ((cy (/ (+ y -40) 200.0)))
                    (let ((info (newton-info cx cy)))
                      (let ((z-final (car info)))
                        (let ((n (car (cdr info))))
                          (let ((c (color z-final n)))
                            (pixel x y c)
                            (pixel (- x) y c)
                            (pixel x (- y) c)
                            (pixel (- x) (- y) c)))))
                    (col (+ x 1))))))
          (col 0)
          (row (+ y 1)))))
  (row 0))

; this line.
(draw)