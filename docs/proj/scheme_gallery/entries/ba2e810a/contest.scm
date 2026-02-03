;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Unlimited Void
;;;
;;; Description:
;;;    naught but emptiness,
;;;    yet everything all at once. 
;;;    shoutout to my goat
(define (draw)  
  (define line-colors-list (list "hotpink" "mediumorchid" "lavender" "fuchsia" "darkviolet" "mediumpurple" "plum" "purple"))        
  (st)  
  (speed 10)
  (pixelsize 2000)
  (pixel -0.3 -0.3 "#170317")
  (pd)
  (define (lines-loop start end lst)   
    (if (< start end)  
      (begin  
          (setpos 0 0)
          (right start)
          (color (car lst))
          (fd 676)
          (if (null? (cdr lst))
            (lines-loop (+ start 1) end line-colors-list)
            (lines-loop (+ start 1) end (cdr lst)) 
          )
      )
      #t
    )
  )

  (lines-loop 67 167 line-colors-list)
  
;(define golden-list (list "#E6C077" "#DFC791"))
(define glow-colors-list (list "#230a35" "#0d0220" "#0d0220" "#0d0220" "#140332" "#140332" "#241440" "#241440" "#33254D" "#36274F" "#43355B" "#574B6D" "#796F8A" "#9A93A7" "#BCB7C4" "#DDDBE2"))
  (define (glow-loop start end step lst)   
    (if (> start end)  
      (begin  
          (setpos start 0)
          (color (car lst))
          (begin_fill)
          (circle start)
          (end_fill)
          (glow-loop (- start step) end step (cdr lst)) 
      )
      #t
    )
  )

;(define outer-glow-colors-list (list "#7E8A7C" "#99A395" "#AFB8A8" "#D0D6C6"))
;  (define (outer-glow-loop start end step lst sign angleshift heading)   
;    (if (> start end)  
;      (begin  
;          (seth heading)
;         (setpos (* start 0.98) (* start 0.05))
;          (color (car lst))
;          (circle (* (sign start) 0.98) (abs angleshift))
;          (begin_fill)
;          (circle (* (sign start) 0.98) (- (* start 0.95) (* (abs angleshift) 2)))
;          (end_fill)
;          (outer-glow-loop (- start step) end step (cdr lst) sign angleshift heading) 
;      )
;      #t
;    )
; )
  ; actually I removed this from the final because i think it was ugly D: ... but it was fun to make :D !

  (pu)
  (setpos 0 0)
  (seth 0)
  ;(glow-loop 190 180 5 golden-list) 
  ;(outer-glow-loop 200 180 5 outer-glow-colors-list (lambda (x) x) 0 0)
  ;(outer-glow-loop 205 185 5 outer-glow-colors-list (lambda (x) (* x -1)) -45 180)
  (glow-loop 180 100 5 glow-colors-list)

  (color "black")
  (setpos 96 0)
  (seth 0)
  (begin_fill)
  (circle 96)
  (end_fill)

  (ht)

(exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)