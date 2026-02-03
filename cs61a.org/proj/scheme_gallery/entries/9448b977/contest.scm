;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: The Gears of Hypnosis
;;;
;;; Description:
;;;   Watch the wheels turn and spin,
;;;   Colors dance and pull you in,
;;;   You can't look away.

(define (ferris-wheel cx cy radius depth max-depth base-color)
  (if (or (< radius 3) (> depth max-depth))
      'done
      (begin
        (let ((t (/ depth max-depth)))
          (color (rgb (* (car base-color) (+ 0.7 (* 0.3 t)))
                     (* (car (cdr base-color)) (+ 0.7 (* 0.3 t)))
                     (* (car (cdr (cdr base-color))) (+ 0.7 (* 0.3 t))))))
        (pu)
        (goto cx (- cy radius))
        (pd)
        (circle radius)
        (define (draw-spokes n)
          (if (= n 8)
              'done
              (begin
                (pu)
                (goto cx cy)
                (seth (* n 45))
                (pd)
                (fd radius)
                (draw-spokes (+ n 1)))))
        (draw-spokes 0)
        (define (draw-pods n)
          (if (= n 8)
              'done
              (begin
                (let ((angle (* n 45)))
                  (let ((px (+ cx (* radius (cos angle))))
                        (py (+ cy (* radius (sin angle)))))
                    (ferris-wheel px py (* radius 0.35) (+ depth 1) max-depth base-color)))
                (draw-pods (+ n 1)))))
        (draw-pods 0))))

(define (draw)
  (ht)
  (bgcolor (rgb 0.05 0.05 0.15))
  (ferris-wheel 0 0 120 0 4 (list 1 0.80 0))
  (ferris-wheel -280 180 80 0 3 (list 1 0.4 0.6))
  (ferris-wheel 280 180 80 0 3 (list 0.5 0.3 1))
  (ferris-wheel -280 -180 80 0 3 (list 0.3 1 0.5))
  (ferris-wheel 280 -180 80 0 3 (list 0.2 0.7 1))
  (ferris-wheel -350 0 60 0 3 (list 1 0.5 0.2))
  (ferris-wheel 350 0 60 0 3 (list 0.8 0.2 0.8))
  (ferris-wheel 0 250 70 0 3 (list 0.4 1 0.8))
  (ferris-wheel 0 -250 70 0 3 (list 1 0.3 0.4))
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)