;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Car model|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define WHEEL-RADIUS 5)

(define motorcar (overlay/align/offset "right" "bottom" (circle (* WHEEL-RADIUS 3) "solid" "black") 3 (* WHEEL-RADIUS 0)
                                       (overlay/align/offset "left" "bottom" (circle (* WHEEL-RADIUS 3) "solid" "black") -3 (* WHEEL-RADIUS -3)
                                       (above (rectangle (* WHEEL-RADIUS 10) (* WHEEL-RADIUS 4) "solid" "red")
                                              (rectangle (* WHEEL-RADIUS 20) (* WHEEL-RADIUS 5) "solid" "red")))))

(overlay motorcar (rectangle 200 200 "solid" "blue"))