;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Black Dragon Curve
;;;
;;; Description:
;;;   <Scheme programming sucks
;;;    Fractals are cool to look at
;;;    Fractals over scheme>

(define (draw)
  (define (DCR n len)
    (pd)
    (ht)
    (if (zero? n)
      (fd len)
      (begin
        (DCL (- n 1) len)
        (right 90)
        (DCR (- n 1) len))))

  (define (DCL n len)
    (if (zero? n)
      (fd len)
      (begin
        (DCL (- n 1) len)
        (left 90)
        (DCR (- n 1) len))))

  (DCR 12 5)

  (exitonclick))


; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)