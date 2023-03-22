;; You will have rations instad of floating numbers if you do this

(/ 22 7); 22/7
(/ 22.0 7); 3.1418...

;; Forma de obtener el modulo y cociente
(quot 22 7)
(rem 22 7)

;; Puedes evitar que se te redondee el vlor con un BigDecimal

(+ 1 (/ 0.00001 10000000000000000)); 1.0
(+ 1 (/ 0.00001M 10000000000000000)); 10000000000000000

; For arbitrary-precision integers you can append N to cread a BigInt literalo

(* 1000N 1000 1000 1000 1000 1000 1000)