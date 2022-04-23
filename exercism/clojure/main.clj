; retorna valores sobre como hacer una lasagna

(ns lucians-luscious-lasagna)

(def expected-time 40)
(def minutes-per-layer 2)

(defn remaining-time [actual-time]
  (- expected-time actual-time))

(defn prep-time [num-layers]
  (* minutes-per-layer num-layers))

(defn total-time [num-layers actual-time]
  (+ (prep-time num-layers) actual-time))

; Manejo de listas

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
