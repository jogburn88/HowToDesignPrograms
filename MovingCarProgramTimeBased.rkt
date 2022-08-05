;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MovingCarProgramTimeBased) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define WIDTH-OF-WORLD 500)
(define WHEEL-RADIUS 3)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; graphical constants
(define MOTORCAR (overlay/align/offset "right" "bottom" (circle (* WHEEL-RADIUS 3) "solid" "black") 3 (* WHEEL-RADIUS 0)
                                       (overlay/align/offset "left" "bottom" (circle (* WHEEL-RADIUS 3) "solid" "black") -3 (* WHEEL-RADIUS -3)
                                       (above (rectangle (* WHEEL-RADIUS 10) (* WHEEL-RADIUS 4) "solid" "red")
                                              (rectangle (* WHEEL-RADIUS 20) (* WHEEL-RADIUS 5) "solid" "red")))))
(define (TREE scale) (overlay/align "middle" "top" (circle (* scale 3) "solid" "green")
                            (rectangle (* scale 2) (* scale 9) "solid" "brown")))

(define BACKGROUND (overlay (TREE 5) (empty-scene WIDTH-OF-WORLD (+ 10 (image-height MOTORCAR)))))


; WorldState -> Image
; places the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render x)
  (place-image MOTORCAR (+ (/ (image-width MOTORCAR) 2) x)  (+ (/ (image-height MOTORCAR) 2) 10) BACKGROUND))

; WorldState -> WorldState
; moves the car by 3 pixels for every clock tick
; examples:
;  given: 20, expect 23
;  given: 78, expect 81
(define (clock-tick-handler cw)
  (+ cw 10))

; WorldState -> WorldState
; detects when the program should end
(define (end? x) (> x WIDTH-OF-WORLD))

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down"
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
    [on-tick clock-tick-handler]
    [on-mouse hyper]
    [to-draw render]
    [stop-when end?]))

(main 1)

