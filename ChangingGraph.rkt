;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChangingGraph) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define GRAPH-HEIGHT 25)
(define GRAPH-WIDTH 200)
(define GRAPH-COLOR "red")

(define GRAPH (empty-scene GRAPH-WIDTH GRAPH-HEIGHT))

; number -> image
; definition: fills bar from percentage of full
(check-expect (bar .43) (rectangle (* GRAPH-WIDTH .43) GRAPH-HEIGHT "solid" GRAPH-COLOR))
(define (bar percent)
  (rectangle (* GRAPH-WIDTH percent) GRAPH-HEIGHT "solid" GRAPH-COLOR))

; number number -> number
; calculates percentage of bar
(check-expect (ratio 20 200) 0.1)
(check-expect (ratio 0 200) 0)
(check-expect (ratio 200 200) 1)
(define (ratio number GRAPH-WIDTH)
  (/ number GRAPH-WIDTH))

; image image -> image
; creates the graph image
; given: the fill bar and the empty graph
; expect: the fill bar to fit into the empty graph
(define (graph ws)
  (place-image (bar (ratio ws GRAPH-WIDTH)) 0 (/ GRAPH-HEIGHT 2) GRAPH))

; number -> number
; decreases ws by 1
(check-expect (clock-beat 3) 2)
(define (clock-beat ws)
  (sub1 ws))

; number -> boolean
; checks if ws is less than 0
(check-expect (end? 5) #false)
(check-expect (end? -1) #true)
(check-expect (end? 0) #false)
(define (end? ws)
  (> 0 ws))

             

; main
(define (main ws)
  (big-bang ws
    [on-draw graph]
    [on-tick clock-beat]
    [stop-when end?]))

;(main 400)