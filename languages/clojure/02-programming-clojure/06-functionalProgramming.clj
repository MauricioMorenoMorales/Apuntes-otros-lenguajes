;;! functional programming


(defn stack-consuming-fibo
  "No es tail recursion por que esta llamando la funcion +
   despues de ejecutar la recursion"
  [^Number n]
  (cond
    (= n 0) 0
    (= n 1) 1
    :else (+ (stack-consuming-fibo (- n 1))
             (stack-consuming-fibo (- n 2)))))

(defn tail-fibo
  [^Number n]
  (letfn [(fib ;letfn creates local functions
           [current next n]
           (if (zero? n)
             current
             (fib next (+ current next) (dec n))))]; Still fails
    (fib 0N 1N n)))


(defn recur-fibo
  [^Number n]
  (letfn [(fib
           [current next n]
           (if (zero? n)
             current
             (recur next (+ current next) (dec n))))]
    (fib 0N 1N n)))

;;? Lazy seq for fibbonacci numbers

(defn lazy-seq-fibo
  ([]
   (concat [0 1] (lazy-seq-fibo 0N 1N)))
  ([a b]
   (let [new (+ a b)]
     (lazy-seq
      (cons new (lazy-seq-fibo b new))))))

(take 10 (lazy-seq-fibo))

; Shows the millionth element and format without 3 digits
(rem (nth (lazy-seq-fibo) 1000000) 1000); -> 875N

;; Some functions return lazy functions
(take 5 (iterate (fn [[a b]] [b (+ a b)]) [0 1]))
