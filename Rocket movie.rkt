;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Rocket movie|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

; constants
(define WIDTH 200)
(define HEIGHT 600)
(define ROCKET (overlay (circle 10 "solid" "black")
                        (rectangle 40 4 "solid" "yellow")))
(define ROCKET-CENTER-TO-TOP (- HEIGHT (/ (image-height ROCKET) 2)))
(define MTSCN (empty-scene WIDTH HEIGHT "blue"))
(define ROCK (rectangle (* WIDTH 2) 10 "solid" "grey"))
(define XPLACEMENT 50)
(define TOP-OF-ROCK (- ROCKET-CENTER-TO-TOP 10))
(define MOUNTAIN (triangle 200 "solid" "green"))
(define MOUNTAIN2 (triangle 300 "solid" "purple"))
(define SCENE (place-image MOUNTAIN (/ WIDTH 2) HEIGHT (place-image MOUNTAIN2 (+ 50 (/ WIDTH 2)) HEIGHT MTSCN)))
(define V 3)

; functions

(define (picture-of-rocket.v4 t)
  (cond
    [(<= (distance t) TOP-OF-ROCK)
     (place-image ROCKET XPLACEMENT (distance t) (place-image ROCK 0 (- HEIGHT 5) SCENE))]
    [(> (distance t) TOP-OF-ROCK)
     (place-image ROCKET XPLACEMENT TOP-OF-ROCK (place-image ROCK 0 (- HEIGHT 5) SCENE))]))

(define (distance t) (* V t))