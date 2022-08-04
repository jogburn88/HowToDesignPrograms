;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MovingCarProgram) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; graphical constants

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (RECTANGLE ...WHEEL-RADIUS... "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define motorcar (overlay/align "middle" "bottom" (rectangle (* WHEEL-RADIUS 10) (* WHEEL-RADIUS 2) "solid" "red")
                                                  (rectangle (* WHEEL-RADIUS 5) (* WHEEL-RADIUS 4) "solid" "red")))

; a WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; render
; clock-tick-handler
; keystroke-handler
; mouse-event-handler
; end?

; WorldState -> Image
; places the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render x)
  BACKGROUND)

; WorldState -> WorldSate
; adds 3 to x to move the car right

(define (tock x)
  x)

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))

(main 13)