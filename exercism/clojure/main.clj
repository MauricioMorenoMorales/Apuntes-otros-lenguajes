; retorna valores sobre como hacer una lasagna ===========================

(require '[clojure.string :as str :refer [join split trim includes? replace]])

(ns lucians-luscious-lasagna)

(def expected-time 40)
(def minutes-per-layer 2)

(defn remaining-time [actual-time]
  (- expected-time actual-time))

(defn prep-time [num-layers]
  (* minutes-per-layer num-layers))

(defn total-time [num-layers actual-time]
  (+ (prep-time num-layers) actual-time))

; Manejo de listas ========================================================

(ns tracks-on-tracks-on-tracks)

(defn new-list
  "Creates an empty list of languages to practice."
  []
  '())

(defn add-language
  "Adds a language to the list."
  [lang-list lang]
  (cons lang lang-list))

(defn first-language
  "Returns the first language on the list."
  [lang-list]
  (first lang-list))

(defn remove-language
  "Removes the first language added to the list."
  [lang-list]
  (rest lang-list))

(defn count-languages
  "Returns the total number of languages on the list."
  [lang-list]
  (count lang-list))

(defn learning-list
  "Creates an empty list, adds Clojure and Lisp, removes Lisp, adds
  Java and JavaScript, then finally returns a count of the total number
  of languages."
  []
  (->
    (new-list)
    (add-language "Clojure")
    (add-language "Lisp")
    (remove-language)
    (add-language "Java")
    (add-language "JavaScript")
    (count-languages)))

;! manejo de vectores ==============================================================

(ns bird-watcher)

; retorna un vector
(def last-week [0 2 5 3 7 8 4])

; retorna el ultimo elemento de un vector
(defn today [birds] (last birds))

; retorna el conteo de los pajaros pero incrementando solo el ultimo elemento
(defn inc-bird [birds]
  (let [new-count (inc (today birds))]
    (-> birds
        pop
        (conj new-count))))

; cuenta la cantidad de días en los que el conteo fue = 0
(defn day-without-birds? [birds]
  (if (some #{0} birds)
    true
    (empty? birds)))

; suma determinada cantidad de dias dentro de un vector
(defn n-days-count [birds n]
  (->> birds
    (take n)
    (apply +)))

; cuenta la cantidad de veces que en un día se mostraron más de 5 pajaros
(defn busy-days [birds]
  (->> birds
      (filter #(>= % 5))
      (count)))
  

; busca la aparicion de un patron similar a este [1 0 1 0 1 0 1]
(defn odd-week? [birds]
  (if (every? #{0 1} birds)
    (->> (rest birds)
        (reduce (fn [{:keys [prev]} n]
                  {:prev n :res (not= prev n)})
                {:prev (first birds)})
        :res)
    false))


;;! Check
(defn odd-week? [birds]
  (let [odds (take-nth 2 birds)
        evens (take-nth 2 (rest birds))
        check01 (fn [coll1 coll2]
                  (and (every? zero? coll1) (every? #(= 1 %) coll2)))]
    (case (first odds)
      0 (check01 odds evens)
      1 (check01 evens odds)
      false)))

;! Number manipulation ==============================================================


(defn production-rate1
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [total-production (float (* 221 speed))
        success-rate (cond
                       (>= speed 10) 0.77
                       (>= speed 9)  0.8
                       (>= speed 5)  0.9
                       (>= speed 1)  1
                       :defaut       0)]
    (* total-production success-rate)))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [total-production (float (* 221 speed))
        success-rate (case speed
                       (10)       0.77
                       (9)        0.8
                       (5 6 7 8)  0.9
                       (1 2 3 4)  1
                       0)]
    (* total-production success-rate)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (let [total-production (production-rate speed)
        production-per-minute (/ total-production 60)]
    (-> production-per-minute
        (Math/floor)
        (int))))
;; Manipulating floats =================================================

(defn interest-rate
  "TODO: add docstring"
  [balance]
  (cond
    (>= balance 5000) 2.475
    (>= balance 1000) 1.621
    (>= balance 0)    0.5
    :default  -3.213))

(defn annual-balance-update
  "TODO: add docstring"
  [balance]
  (->> (interest-rate balance)
    (bigdec)
    (#(if (neg? %)
       (-' %)
       %))
    (*' balance 0.01M)
    (+' balance)))

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (if (pos? balance)
    (int (* tax-free-percentage 0.01 balance 2))
    0))

;; Manipulating Strings =============================================
(defn message
  "Takes a string representing a log line
    and returns its message with whitespace trimmed."
  [string-parameter]
  (-> string-parameter
      (clojure.string/split #" ")
      (->> (drop 1)
           (clojure.string/join #" ")
           (clojure.string/trim))))

(defn log-level
  "Takes a string representing a log line
    and returns its level in lower-case."
  [string-parameter]
  (-> string-parameter
      (clojure.string/split #" ")
      (first)
      (clojure.string/replace #"(\[|\]|\:)" "")
      (clojure.string/lower-case)))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [string-parameter]
  (let [log-level (log-level string-parameter)
        message (message string-parameter)]
    (str message " (" log-level ")")))

(defn reformat
  "Takes another thing and returns the last element
  of the ")

;;! manipulating booleans

(ns annalyns-infiltration)

(defn can-fast-attack?
  "Returns true if a fast-attack can be made, false otherwise."
  [knight-awake?]
  (not knight-awake?))

(defn can-spy?
  "Returns true if the kidnappers can be spied upon, false otherwise."
  [knight-awake? archer-awake? prisoner-awake?]
  (or knight-awake? archer-awake? prisoner-awake?))

(defn can-signal-prisoner?
  "Returns true if the prisoner can be signalled, false otherwise."
  [archer-awake? prisoner-awake?]
  (and
    (not archer-awake?)
    prisoner-awake?))

(defn can-free-prisoner?
  "Returns true if prisoner can be freed, false otherwise."
  [knight-awake? archer-awake? prisoner-awake? dog-present?]
  (let [prisoner-sleeps? (not prisoner-awake?)
        knight-sleeps?   (not knight-awake?)
        archer-sleeps?   (not archer-awake?)
        guards-sleep?    (and knight-sleeps? archer-sleeps?)]
    (or
      (and guards-sleep? prisoner-awake?)
      (and archer-sleeps? dog-present?))))

;;! Manipulating vectors
;;? First iteration

(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [deck]
  (first deck))

(defn second-card
  "Returns the second card from deck."
  [deck]
  (second deck))

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [deck]
  (let [[first second & remaining] deck]
    (if (= remaining nil)
      [second first]
      [second first remaining])))


(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [deck]
  (let [[first & remaining] deck]
    [first remaining]))

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  ([deck]
   (if (empty? deck)
     face-cards
     (let [[first second third fourth & remaining] deck]
       (if (= remaining nil)
         '(first face-cards))))))

;;? Second iteration


(defn first-card
  "Returns the first card from deck."
  [[first _]]
  first)

(defn second-card
  "Returns the second card from deck."
  [[_ second]]
  second)

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [[first second & remaining]]
  (->> [second first remaining]
    (flatten)
    (remove nil?)))

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [[first & remaining]]
  [first remaining])

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  ([[first & remaining]]
   (->> [first face-cards remaining]
        (flatten)
        (remove nil?))))

;;! Default values

(defn two-fer
  ([]
   "One for you, one for me.")
  ([name]
   (format "One for %s, one for me." name)))


(defn two-fer
  ([]
   (two-fer "you"))
  ([name]
   (format "One for %s, one for me." name)))

(defn two-fer [& [recipient]]
  (format "One for %s, one for me." (or recipient "you")))

;;! Iterating through Numbers

(defn armstrong
  [parameter]
  (->> (str parameter)
       seq
       (map str)
       (map read-string)
       ((map #(reduce * (repeat (count (str n)) %))))
       (reduce +)
       (= parameter)))

;;! Armstrong numbers

(defn ^Boolean armstrong?
  [^String parameter]
  (->> (str parameter)
    (seq)
    (map str)
    (map read-string)
    (map #(reduce * (repeat (count (str parameter)) %)))
    (reduce +)
    (= parameter)))

;; Second iteration

(defn- to-digits
  [^Number parameter]
  (loop [num parameter
         digits nil]
      (if (< num 10)
        (conj digits num)
        (recur  (quot num 10)
                (conj digits (rem num 10))))))

(defn- expt [base n]
  (apply * (repeat n base)))

(defn armstrong? [^Number n]
  (let [digits (to-digits n)
        digits-count (count digits)]
    (= (reduce #(+ %1 (expt %2 digits-count)) 0 digits) n)))

;;! Reverses a string

(defn reverse-string
  (^String [^String parameter]
   (-> parameter
       (split #"")
       reverse
       (->> (join #"")))))

(defn reverse-string2
  (^String [^String s]
    (reduce #(str %2 %1) "" s)))

(defn reverse-string3
  (^String [^String s]
    (apply str (into ()))))

;; Manipula vector de numeros

(defn accumulate
  [function numbers]
  (if (empty? numbers)
    []
     (->> numbers
          (map function))))

;;! Acronym generator

(defn is-pascal-case?
  (^String [^String word]
   (re-matches #"^[A-Z][a-z]+(?:[A-Z][a-z]+)*$" word)))

(defn pascal-case-split
  "Splits the word if its pascal case if not returns the word"
  (^String [^String word]
   (if (is-pascal-case? word)
     (split word #"(?<!^)(?=[A-Z]|(?<!\d)\d)")
     word)))

(defn acronym
  "Converts phrase to its acronym."
  (^String [^String phrase]
   (if (= phrase "")
     ""
     (->> (split phrase #"\s|-")
          (map pascal-case-split)
          flatten
          (map first)
          (map upper-case)
          (join "")))))


;; Convierte numeros a cualquier base

(defn convert
  "This functions fails !!!!"
  [input-base input output-base]
  (let [convert-to-absolute (fn [numbers input-base]
                              (loop [numbers (reverse numbers)
                                     current-potency 0
                                     response '()]
                                (if (empty? numbers)
                                  (reduce + response)
                                  (recur (drop 1 numbers)
                                         (inc current-potency)
                                         (conj response (* (exp input-base current-potency) (peek numbers)))))))
        convert-to-binary (fn [numbers]
                            (loop [response '()
                                   current-number (Integer. (apply str numbers))]
                              (if (= 0 current-number)
                                response
                                (recur (conj response (rem current-number 2)) (quot current-number 2)))))]
    (convert-to-absolute input input-base)))

(defn convert2
  [input-base input output-base]
  (letfn [(guard [input input-base output-base]
            (and (seq input)
                (> output-base 1)
                (every? #(and (number? %) (<= 0 % (dec input-base)))
                        input)))
          (to-decimal [input-base number-list]
            (reduce #(+ (* %1 input-base) %2) 0 number-list))
          (to-specified-base [output-base number]
            (loop [response '()
                  current-number number]
              (if (= 0 current-number)
                response
                (recur (conj response (rem current-number output-base)) (quot current-number output-base)))))]
    (when (guard input input-base output-base)
      (if (every? #(zero? %) input)
        '(0)
        (->> input
            (to-decimal input-base)
            (to-specified-base output-base))))))

(defn convert3
  [input-base input output-base]
  (letfn [(guard
            [input input-base output-base]
            (and (seq input)
                  (> output-base 1)
                  (every? #(and (number? %) (<= 0 % (dec input-base)))
                          input)))
          (if-is-not-zero
            [iterable form]
            (if (every? #(zero? %) iterable)
              '(0)
              form))
          (to-decimal
            [input-base number-list]
            (reduce #(+ (* %1 input-base) %2) 0 number-list))
          (to-specified-base
            [output-base number]
            (loop [response '()
                   current-number number]
              (if (= 0 current-number)
                response
                (recur
                 (conj response (rem current-number output-base))
                 (quot current-number output-base)))))]
    (when (guard input input-base output-base)
      (if-is-not-zero input
        (->> input
             (to-decimal input-base)
             (to-specified-base output-base))))))

;;! verifies if a word is an anagram,

(defn anagrams-for
  "filtra las palabras que no son anagramas, por ejemplo bat, tab"
  [word prospect-list]
  (letfn [(format-word
            [word]
            (-> word
                lower-case
                sort))
          (has-same-letters
            [word1 word2]
            (= (format-word word1) (format-word word2)))
          (is-not-same-word
            [word1 word2]
            (not= (lower-case word1) (lower-case word2)))]
    (->> prospect-list
         (filter #(is-not-same-word word %))
         (filter #(has-same-letters word %)))))

;; Returns a response depending the input

(defn- does? [s, r trim includeseequirements]
  (every? #(% s) requirements))

(defn response-for
  [^String s]
  (letfn [(is-a-question? [s]
            (= (last (trim s)) \?))
          (is-yelling? [s]
            (= (upper-case s) s))
          (has-letters? [s]
            (some #(Character/isLetter %) s))
          (yells-question? [s]
            (does? s [is-yelling? is-a-question? has-letters?]))
          (is-white-space [s]
            (= (trim s) ""))]
    (cond
      (yells-question? s) "Calm down, I know what I'm doing!"
      (is-a-question? s) "Sure."
      (is-white-space s) "Fine. Be that way!"
      (not (has-letters? s)) "Whatever."
      (is-yelling? s) "Whoa, chill out!"
      :else "Whatever.")))

(defn response-for2
  [^String s]
  (letfn [(is-empty-string [s]
            (= (trim s) ""))
          (is-a-question? [s]
            (= (last (trim s)) \?))
          (is-yelling? [s]
            (= (upper-case s) s))
          (has-letters? [s]
            (some #(Character/isLetter %) s))]
    (cond
      (does? s [is-a-question? is-yelling? has-letters?]) "Calm down, I know what I'm doing!"
      (does? s [is-yelling? has-letters?]) "Whoa, chill out!"
      (is-a-question? s) "Sure."
      (is-empty-string s) "Fine. Be that way!"
      :else "Whatever.")))

(defn response-for
  [^String s]
  (let [is-empty-string? #(= (trim %) "")
        is-a-question?   #(= (-> % trim last) \?)
        is-yelling?      #(= (upper-case %) %)
        has-letters?     (fn [s]
                           (some #(Character/isLetter %) s))]
    (cond
      (does? s [is-a-question? is-yelling? has-letters?]) "Calm down, I know what I'm doing!"
      (does? s [is-yelling? has-letters?])                "Whoa, chill out!"
      (is-a-question? s)                                  "Sure."
      (is-empty-string? s)                                "Fine. Be that way!"
      :else                                               "Whatever.")))

;; Colatz conjecture iteration counter

(defn collatz
  [number]
  (letfn [(guard
            [number args]
            (if (<= number 0)
              (throw "Invalid number")
              args))]
    (guard number
      (loop [current-number  number
            iteration-count 0]
        (cond
          (<= current-number 1) iteration-count
          (odd? current-number) (recur (inc (* 3 current-number)) (inc iteration-count))
          :else (recur (/ current-number 2) (inc iteration-count)))))))

(defn collatz2
  [number]
    (if (<= number 0) (throw "Number cannot be negative")
      (loop [current-number number iteration-count 0]
        (cond
          (<= current-number 1) iteration-count
          (odd? current-number) (recur (inc (* 3 current-number)) (inc iteration-count))
          :else (recur (/ current-number 2) (inc iteration-count))))))

;; Cuenta las diferencias entre dos strings

(defn distance
  [strand1 strand2]
  (when (= (count strand1) (count strand2))
    (loop [current1 strand1
           current2 strand2
           differences 0]
      (cond
        (empty? current1) differences
        (not= (first current1) (first current2)) (recur (rest current1) (rest current2) (inc differences))
        :else (recur (rest current1) (rest current2) differences)))))

(defn distance2
  [strand1 strand2]
  (when (= (count strand1) (count strand2))
    (->> (map = strand1 strand2)
         (filter false?)
         count)))

;; Obtiener el nth numero primo
(defn nth-prime
  "Returns the prime number in the nth position."
  [n] ;; <- arglist goes here
  (letfn [(is-prime?
           [n]
           (loop [divisor 2]
             (cond (> (* divisor divisor) n) true
                   (zero? (rem n divisor)) false
                   :else (recur (inc divisor)))))]
    (when (< n 1)
      (throw (IllegalArgumentException. "Invalid index!")))
    (nth (filter is-prime? (iterate inc 2)) (dec n))))

(def ^:private primes
  (cons 2 (filter #(not-any?
                    (comp zero? (partial rem %))
                    (range 3 (inc (Math/sqrt %)) 2))
                  (iterate (partial + 2) 3))))
(defn nth-prime2 [n]
  (when-not (pos? n)
    (throw (IllegalArgumentException.)))
  (nth primes (dec n)))

;;! Using into to map an object

(defn transform
  [source]
  (into {}
    (for [[score letters] source
          letter letters]
      [(lower-case letter) score])))

;;! Cuenta las ocurrencias de ciertas letras, como si fuera un hash <<<
;; Tambien tiene pre condiciones

(defn count-of-nucleotide-in-strand
  [nucleotide strand]
   {:pre [(contains? #{\A \T \C \G} nucleotide)]}
   (->> strand
        (filter #(= % nucleotide))
        count))


(defn nucleotide-counts [strand]
  (->> [\A \T \G \C]
       (map #(identity [% (count-of-nucleotide-in-strand % strand)]))
       (into {})))

(defn nucleotide-counts [strand]
   (merge {\A 0 \T 0 \C 0 \G 0}
         (frequencies strand)))

(defn count-of-nucleotide-in-strand [nucleotide strand]
  {:pre [(contains? #{\A \T \C \G} nucleotide)]}
  ((nucleotide-counts strand) nucleotide))

;;! Verifica que un string contenga todas las letras del alfabeto inglés

(defn pangram?
  [phrase]
  (-> phrase
      lower-case
      (replace #"[^a-z]" "")
      set
      count
      (= 26)))

(defn pangram?2
  [phrase]
  (-> phrase
      lower-case
      set
      (every? "abcdefghijklmnopqrstuvwxyz")))

;; MApea un string en clusters de 3 elementos

(defn translate-codon
  [codon]
  (cond
    (= "AUG" codon)                        "Methionine"
    (= "UGG" codon)                        "Tryptophan"
    (contains? #{"UUU" "UUC"} codon)       "Phenylalanine"
    (contains? #{"UUA" "UUG"} codon)       "Leucine"
    (contains? #{"UAU" "UAC"} codon)       "Tyrosine"
    (contains? #{"UGU" "UGC"} codon)       "Cysteine"
    (contains? #{"UAA" "UAG" "UGA"} codon) "STOP"
    :else                                  "Serine"))

(defn translate-rna
  [rna]
  (loop [response []
         remaining rna]
    (let [current-translation (->> remaining (take 3) (apply str) translate-codon)
          next-value (->> remaining (drop 3) (apply str))]
      (if (or (empty? remaining) (= "STOP" current-translation))
        response
        (recur (conj response current-translation) next-value)))))

(defn translate-codon2
  [codon]
  (case codon
    ("AUG")             "Methionine"
    ("UGG")             "Tryptophan"
    ("UUU" "UUC")       "Phenylalanine"
    ("UUA" "UUG")       "Leucine"
    ("UAU" "UAC")       "Tyrosine"
    ("UGU" "UGC")       "Cysteine"
    ("UAA" "UAG" "UGA") "STOP"
                        "Serine"))

;; Alternate case version
(defn score-letter
  [x]
  (condp contains? (upper-case x)
    #{"A" "E" "I" "O" "U" "L" "N" "R" "S" "T"} 1
    #{"D" "G"} 2
    #{"B" "C" "M" "P"} 3
    #{"F" "H" "V" "W" "Y"} 4
    #{"K"} 5
    #{"J" "X"} 8
    #{"Q" "Z"} 10))

(defn translate-rna2
  [rna]
  (->> rna
       (partition 3) ;; (re-seq #".{3}") y con esto skipeas el (map join)
       (map join)
       (map translate-codon)
       (take-while #(not= "STOP" %))))

;;! Muta un valor dependiendo de los valores recibidos

(defn convert [number]
  (let [multiple-of-7 (if (= 0 (mod number 7)) "Plong" "")
        multiple-of-5 (if (= 0 (mod number 5)) "Plang" "")
        multiple-of-3 (if (= 0 (mod number 3)) "Pling" "")
        result (str multiple-of-3 multiple-of-5 multiple-of-7)]
    (if (empty? result) (str number) result)))

(defn convert [number]
  (cond-> nil
    (zero? (mod number 3)) (str "Pling")
    (zero? (mod number 5)) (str "Plang")
    (zero? (mod number 7)) (str "Plong")
    :always (or (str number))))

;;! Genera numeros romanos

(defn numerals
  [number]
  (let [number-string (-> number str reverse)
        [units tens hundreds thousands] number-string
        thousands-map {\1 "M" \2 "MM" \3 "MMM" \4 "MMMM"}
        hundreds-map  {\1 "C" \2 "CC" \3 "CCC" \4 "CD" \5 "D" \6 "DC" \7 "DCC" \8 "DCCC" \9 "CM"}
        tens-map      {\1 "X" \2 "XX" \3 "XXX" \4 "XL" \5 "L" \6 "LX" \7 "LXX" \8 "LXXX" \9 "XC"}
        units-map     {\1 "I" \2 "II" \3 "III" \4 "IV" \5 "V" \6 "VI" \7 "VII" \8 "VIII" \9 "IX"}]
    (cond-> ""
      thousands (str (get thousands-map thousands))
      hundreds  (str (get hundreds-map hundreds))
      tens      (str (get tens-map tens))
      units     (str (get units-map units)))))

(defn subtractive-conversions [numeral]
  (-> numeral
      (str/replace "VIIII" "IX")
      (str/replace "IIII" "IV")
      (str/replace "LXXXX" "XC")
      (str/replace "XXXX" "XL")
      (str/replace "DCCCC" "CM")
      (str/replace "CCCC" "CD")))
(defn additive-convertor[digits num]
  (str/join (cond
              (>= num 1000) (additive-convertor (conj digits "M") (- num 1000))
              (>= num 500)  (additive-convertor (conj digits "D") (- num 500))
              (>= num 100)  (additive-convertor (conj digits "C") (- num 100))
              (>= num 50)   (additive-convertor (conj digits "L") (- num 50))
              (>= num 10)   (additive-convertor (conj digits "X") (- num 10))
              (>= num 5)    (additive-convertor (conj digits "V") (- num 5))
              (> num 0)     (additive-convertor (conj digits "I") (- num 1))
              (= num 0)     digits)))
(defn subtractive-convertor [additive-number]
  (subtractive-conversions additive-number))
(defn numerals [x]
  (let [digits []]
    (subtractive-convertor (additive-convertor digits x))))

;;! ROta el orden de las palabras

(deftest rotate-punctuation
  (is (= (rotational-cipher/rotate "Let's eat, Grandma!" 21) "Gzo'n zvo, Bmviyhv!")))
(defn rotate [string change]
  (let [adjust-range (fn [number minimum maximum]
                       (cond
                         (< maximum number) (- number 26)
                         (> minimum number) (+ number 26)
                         :else              number))
        change (cond
                 (> change 26)  (- change 26)
                 (< change -26) (+ change 26)
                 :else          change)
        rotate #(cond
                  (.contains (range 97 123) %) (adjust-range (+ % change) 97 122)
                  (.contains (range 65 91) %)  (adjust-range (+ % change) 65 90)
                  :else                        %)]
    (->> string
         (seq)
         (map int)
         (map rotate)
         (map char)
         (join))))

(def ^:const alphabet "abcdefghijklmnopqrstuvwxyz")
(defn rotate2 [text key]
  (let [shifted (take 26 (drop (mod key 26) (cycle alphabet)))
        cipher (zipmap (str alphabet (s/upper-case alphabet))
                       (concat shifted (map s/upper-case shifted)))]
    (s/join (map #(cipher %1 %1) text))))