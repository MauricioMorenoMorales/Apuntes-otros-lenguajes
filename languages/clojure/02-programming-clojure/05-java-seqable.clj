;; Returns a list with each word, like a split
(re-seq #"\w+" "the quick brown fox")

;; Agrega un valor en determinado indice
(assoc [0 1 2 3 4] 2 :two)

;; Es como un splice
(subvec [1 2 3 4 5] 3); [4 5]
(subvec [1 2 3 4 5] 1 3); [2 3]
(take 2 (drop 1 [1 2 3 4 5]))

(defn splice
  ([sequence ^Number from]
   (drop from sequence))
   ([sequence ^Number from ^Number to]
    (take to (drop from sequence ))))

;; Obtener data de los arrays
;(get iterable/object valueSearched defaultValue)

(get {:a "test" :b "value"} :a "default")
(get [1 2 3 4 5] 2 100)

;;! maps functions

(keys {:sundance "spaniel" :darwin "beagle"}); (:sundance :darwin)
(vals {:sundance "spaniel" :darwin "beagle"}); ("spaniel" "beagle")

({:sundance "spaniel" :darwin "beagle"} :darwin); "beagle"
(:darwin {:sundance "spaniel" :darwin "beagle"}); "beagle"

(def song {:name "Agnus Dei"
           :artist "Krzysztof Penderecki"
           :album "Polish Requiem"
           :genre "Classical"})

; agrega una llave y un valor
(assoc song :kind "MPEG Audio File")
; elimina el genero
(dissoc song :genre)
; devuelve un mapa con name y artist
(select-keys song [:name :artist])
; Mergea ambos objetos
(merge song {:size 8118166 :time 507245})

(merge-with
 concat
 {:rubble ["Barney"] :flinstone ["Fred"]}
 {:rubble ["Betty"] :flinstone ["Wilma"]}
 {:rubble ["Bam-Bam"] :flinstone ["Pebbles"]})
; ->{:rubble ("Barney" "Betty" "Bam-Bam") :flinstone ("Fred" "Wilma" "Pebbles")}

;;! functions on sets

(def languages #{"java" "c" "d" "clojure"})
(def beverages #{"java" "chai" "pop"})


(ns examples.sequences
    (:require [examples.utils :refer :all]
              [clojure.set :refer :all]
              [clojure.xml :refer :all]))

(def song {:name "Agnus Dei"
	   :artist "Krzysztof Penderecki"
	   :album "Polish Requiem"
	   :genre "Classical"})

(def compositions 
  #{{:name "The Art of the Fugue" :composer "J. S. Bach"}
    {:name "Musical Offering" :composer "J. S. Bach"}
    {:name "Requiem" :composer "Giuseppe Verdi"}
    {:name "Requiem" :composer "W. A. Mozart"}})
(def composers
  #{{:composer "J. S. Bach" :country "Germany"}
    {:composer "W. A. Mozart" :country "Austria"}
    {:composer "Giuseppe Verdi" :country "Italy"}})
(def nations
  #{{:nation "Germany" :language "German"}
    {:nation "Austria" :language "German"}
    {:nation "Italy" :language "Italian"}})


; TODO: add pretty-print that works with book margins.
(defdemo demo-map-builders
  (assoc song :kind "MPEG Audio File")
  (dissoc song :genre)
  (select-keys song [:name :artist])
  (merge song {:size 8118166 :time 507245}))

(defdemo demo-merge-with
  (merge-with 
   concat 
   {:flintstone, ["Fred"], :rubble ["Barney"]}
   {:flintstone, ["Wilma"], :rubble ["Betty"]}
   {:flintstone, ["Pebbles"], :rubble ["Bam-Bam"]}))

(def languages #{"java" "c" "d" "clojure"})
(def beverages #{"java" "chai" "pop"})

(defdemo demo-mutable-re
; don't do this!
(let [m (re-matcher #"\w+" "the quick brown fox")]
  (loop [match (re-find m)]
    (when match
      (println match)
      (recur (re-find m)))))
)

(defn minutes-to-millis [mins] (* mins 1000 60))

(defn recently-modified? [file]
  (> (.lastModified file) 
     (- (System/currentTimeMillis) (minutes-to-millis 30))))

(use '[clojure.java.io :only (reader)])
(use '[clojure.string :only (blank?)])
(defn non-blank? [line] (not (blank? line)))

(defn non-svn? [file] (not (.contains (.toString file) ".svn")))

(defn clojure-source? [file] (.endsWith (.toString file) ".clj"))

(defn clojure-loc [base-file]
  (reduce 
   +
   (for [file (file-seq base-file) 
	 :when (and (clojure-source? file) (non-svn? file))]
     (with-open [rdr (reader file)]
       (count (filter non-blank? (line-seq rdr)))))))

(defn demo-xml-seq []
(for [x (xml-seq 
	 (parse (java.io.File. "data/sequences/compositions.xml")))
      :when (= :composition (:tag x))]
  (:composer (:attrs x)))
)



