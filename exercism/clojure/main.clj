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
