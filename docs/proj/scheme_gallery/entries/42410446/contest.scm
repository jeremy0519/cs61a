;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <Fuelled by caffeine and ritalin,
;;;    I coded, it failed, coded, it failed, on and on until it worked;
;;;    Recursion!>
(define res 
    300
)

(define counter 
    25
)
;;; There are quite a few cool julia points! some ones I like are (list -0.5125 0.5213), (list 0.28 0.008), (list -0.6 1), (list -0.8 1.5), (list -0.12 -0.8), (list -0.501 -0.593), (list 0.359 0.599), and (list -1.5 0)
(define juliapoint 
    (list 
        0.359 
        0.599
    )
)

(define (cadr x)
    (car (cdr x))
)

(define (for i f)
    (if (> i 0)
        (begin 
            (f)
            (for (- i 1) f)
        )
    )
)

(define (complexsquare c)
    (define a 
        (car c)
    )
    (define b 
        (cadr c)
    )
    (list 
        (- (* a a) (* b b)) 
        (* 2 a b)
    )
)

(define (complexabs c)
    (define a 
        (car c)
    )
    (define b 
        (cadr c)
    )
    (sqrt (+ (* a a) (* b b)))
)

(define (screentransform c)
    (list 
        (* (car c) (/ (screen_width) res)) 
        (* (cadr c) (/ (screen_height) res))
    )
)

(define (zoom x y w c)
    (define x2 
        (+ (/ (* x w) res) (car c))
    )
    (define y2 
        (+ (/ (* y w) res) (cadr c))
    )
    (list 
        x2 
        y2
    )
)

(define (julia_check z count)
    (define z2 
        (list 
            (+ (car (complexsquare z)) (car juliapoint)) 
            (+ (cadr (complexsquare z)) (cadr juliapoint))
        )
    )
    (cond 
        ((> (complexabs z) 1.5) 
            count
        )
        ((> count 0) 
            (julia_check z2 (- count 1))
        )
        (else 
            counter
        )
    )
)

(define (draw)
    (pixelsize (+ (ceil (/ (screen_width) res)) 1))
    (define position 
        (list 
            (* 1 (- 0 res))
            (* 1 res)
        )
    )
    (for (* 2 res)
        (lambda ()
            (for (* 2 res)
                (lambda ()
                    (define color 
                        (julia_check 
                            (zoom 
                                (car position) 
                                (cadr position) 
                                2 
                                (list 0 0)
                            ) 
                            counter
                        )
                    )
                    (pixel 
                        (car (screentransform position)) 
                        (cadr (screentransform position)) 
                        (rgb 
                            (- 1 (/ color counter)) 
                            0 
                            (- 1 (/ color counter))
                        )
                    )
                    (set! position 
                        (list 
                            (+ (car position) 1) 
                            (cadr position)
                        )
                    )
                )
            )
            (set! position 
                (list 
                    (* 1 (- 0 res)) 
                    (- (cadr position) 1)
                )
            )
        )
    )
    (save-to-file "hi")
    (exitonclick)
)
; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)