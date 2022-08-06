;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ArrowKeys) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define BALL (circle 10 "solid" "red"))
(define LINE (line 200 0 "black"))

; image image -> image
; overlays the ball at x location on the line
(check-expect (place-ball 5) (overlay/xy BALL 5 10 LINE))

(define (place-ball x)
  (overlay/xy BALL x 10 LINE))

; KeyEvent -> Position
(check-expect (key-handler 20 "left") 25)
(check-expect (key-handler 20 "right") 15)
(check-expect (key-handler 20 "a") 20)
(define (key-handler position key)
  (cond
    [(string=? "left" key) (+ position 5)]
    [(string=? "right" key) (- position 5)]
    [else position]))

(define (main position)
  (big-bang position
    [to-draw place-ball]
    [on-key key-handler]))

(main 0)
