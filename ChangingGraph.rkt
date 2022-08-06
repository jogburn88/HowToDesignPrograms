;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChangingGraph) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define GRAPH-HEIGHT 25)
(define GRAPH-WIDTH 200)
(define GRAPH-COLOR "blue")
(define BAR-COLOR "red")

; render
; image image -> image
; draws the current happiness graph
(check-expect (render 0) (overlay/align "left" "middle"
                                         (rectangle 0 GRAPH-HEIGHT "solid" BAR-COLOR)
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" GRAPH-COLOR)))

(check-expect (render 50) (overlay/align "left" "middle"
                                         (rectangle (/ GRAPH-WIDTH 2) GRAPH-HEIGHT "solid" BAR-COLOR)
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" GRAPH-COLOR)))

(check-expect (render 100) (overlay/align "left" "middle"
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" BAR-COLOR)
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" GRAPH-COLOR)))

(check-expect (render -5) (overlay/align "left" "middle"
                                         (rectangle 0 GRAPH-HEIGHT "solid" BAR-COLOR)
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" GRAPH-COLOR)))

(check-expect (render 150) (overlay/align "left" "middle"
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" BAR-COLOR)
                                         (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" GRAPH-COLOR)))
(define (render score)
  (overlay/align "left" "middle"
                 (rectangle (render-score score) GRAPH-HEIGHT "solid" BAR-COLOR)
                 (rectangle GRAPH-WIDTH GRAPH-HEIGHT "solid" GRAPH-COLOR)))

; render-score
; number -> number
; calculates the score bar length
(check-expect (render-score 0) 0)
(check-expect (render-score 100) GRAPH-WIDTH)
(check-expect (render-score 50) (/ GRAPH-WIDTH 2))
(check-expect (render-score -5) 0)
(check-expect (render-score 120) GRAPH-WIDTH)
(define (render-score score)
  (cond
    [(<= score 0) 0]
    [(<= score 100) (* (/ score 100) GRAPH-WIDTH)]
    [else GRAPH-WIDTH]))


; clock-tick
; number -> number
; decreases the happiness
(check-expect (clock-tick 5) 4.9)
(check-expect (clock-tick 1) .9)
(define (clock-tick score)
  (- score 0.1))

; key-press event
; arrow-key -> number
; increases happiness
(check-expect (inc-score 30 "up") 63)
(check-expect (inc-score 30 "down") 50)
(check-expect (inc-score 30 "left") 30)
(define (inc-score score a-key)
  (cond
    [(key=? a-key "up") (+ score 33)]
    [(key=? a-key "down") (+ score 20)]
    [else score]))

;end?
; number -> boolean
; decides if the game is over
(check-expect (end? -1) #true)
(check-expect (end? 0) #true)
(check-expect (end? 1) #false)
(check-expect (end? 20) #false)
              
(define (end? level)
  (cond
    [(<= level 0) #true]
    [else #false]))


; this is the main loop
(define (gauge-prog score)
  (big-bang score
    [on-tick clock-tick]
    [on-key inc-score]
    [to-draw render]
    [stop-when end?]))

(gauge-prog 100)