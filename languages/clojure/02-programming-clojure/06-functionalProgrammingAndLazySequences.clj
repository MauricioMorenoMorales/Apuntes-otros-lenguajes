;;! functional programming

;; primes cannot be written efficiently as a function because
;; it needs to look back on the whole sequence. contrast with
;; fibs and powers-of-w which only need a fixed buffer of 1 or 2
;; previous values

(def primes
  (concat
   [2 3 5 7]
   (lazy-seq
    (let [primes-from
          (fn primes-from [n [f & r]]
            (if (some #(zero? (rem n %))
                      (take-while #(<= (* % %) n) primes))
              (recur (+ n f) r)
              (lazy-seq (cons n (primes-from (+ n f) r)))))
          wheel (cycle [2 4 2 4 6 2 6 4 2 4 6 6 2 6  4  2
                         6 4 6 8 4 2 4 2 4 8 6 4 6 2  4  6
                        2 6 6 4 2 4 6 2 6 4 2 4 2 10 2 10])]
      (primes-from 11 wheel)))))


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

;Holds the head (avoid!)

(def head-fibo (lazy-cat [0N 1N] (map + head-fibo (rest head-fibo))))

;
(defn count-heads-pairs1
  "Verifica si aparece el valor :h dos veces seguidas dentro de un vector"
  [coll]
  (loop [cnt 0 coll coll]
    (if (empty? coll)
      cnt
      (recur (if (= :h (first coll) (second coll))
               (inc cnt)
               cnt)
             (rest coll)))))

;; Overly complex, better approaches follow...

(defn by-pairs
  "Toma la misma logica de la funcion anterior pero retorna los valores agrupados
   [:h :t :t :h :h :h]
   [[:h :t] [:t :t] [:t :h] [:h :h] [:h :h]]"
  [coll]
  (let [take-pair (fn [c]
                    (when (next c) (take 2 c)))]
    (lazy-seq
     (when-let [pair (seq (take-pair coll))]
       (cons pair (by-pairs (rest coll)))))))

(defn count-heads-pairs
  "Toma la funcion anterior y cuenta cada vez que dos :h aparecen juntas"
  [coll]
  (count (filter (fn [pair] (every? #(= :h %) pair))
                 (by-pairs coll))))

;; Revisiting recursion

;; Allows you to declare functions before initialization
(declare my-odd? my-even?)

(defn my-odd?
  [n]
  (if (= n 0)
    false
    (my-even? (dec n))))

(defn my-even?
  [n]
  (if (= n 0)
    true
    (my-odd? (dec n))))

(defn parity
  [n]
  (loop [n n par 0]
    par
    (recur (dec n) (- 1 par))))

