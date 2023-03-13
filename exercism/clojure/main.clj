; retorna valores sobre como hacer una lasagna ===========================

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
      (count))
  )

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
      [second first remaining]))
)

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [deck]
  (let [[first & remaining] deck]
    [first remaining])
)

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  ([deck]
  (if (empty? deck)
    face-cards
    (let [[first second third fourth & remaining] deck]
      (if (= remaining nil)
        '(first face-cards))
      ))))

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

