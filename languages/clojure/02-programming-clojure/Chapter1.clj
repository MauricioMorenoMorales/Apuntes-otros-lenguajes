;;examples of params

(example-fn required-argument)
(example-fn optional-argument?)
(example-fn zero-or-more-arg*)
(example-fn one-or-more-arg+)
(example-fn & collection-of-variable-args)

;;Require statement
(require '[lib-name :refer [var-names+] :as alias])
(require '[clojure.java.io :as io])
(io/file "Hello.txt"); -> #<File Hello.txt>

;Searches for every composer that compose a Requien

(for [c compositions :when (= (:name c) "Requien")]
  (:composer c)); -> Mozart, Verdi

;Ways to call Java functions
;"Hello".getClass().getProtectionDomain()
(.. "hello" getClass getProtectionDomain)

;Threads
(.start (new Thread (fn [] (println "Hello" (Thread/currentThread)))))


;;! Reference types
; An example of reference type is the atom

(atom initial-state)

(def symbol initial-value?)

(def visitors (atom #[])); # 'user/visitors

(swap! r update-fn & args)
(swap! visitors conj "Stu"); #{"Stu"}

(deref visitors); -> #'{"Stu"}
@visitors; -> #'{"Stu"}

(defn hello
  "Writes hello message to *out*. Calls you by username.
  Knows if you have been here before."
  [username]
  (swap! visitors conj username)
  (format "Hello, %s." username))

;;! navigating Clojure Libraries

(require quoted-namespace-symbol)

; Puedes extraer el path de las librerias así
(require 'clojure.java.io)
(require 'examples.introduction)

(take 10 examples.introduction/fibs); -> (0 1 1 2 3 5 8 13 21 34)

; Puedes checar la documentacion de una funcion así
(doc str)

;Puedes agregar aliases a las funciones de este modo

(require '[clojure.repl :refer [source]])
(source identity)

;;! Flow control Do and if

;;Do ignores the return values of all its forms except the last and allows side effects

(defn is-small?
  [number]
  (if (< number 100)
    "Yes"
    (do
      (println "Saw a big number " number)
      "No")))

(loop [result [] x 5]
  (if (zero? x)
    result
    (recur (conf result x) (dec x))))

(defn countdown [result x]
  (if (zero? x)
    result
    (recur (conj result x) (dec x))))
;; Another ways to write the same funcion

(into [] (take 5 (iterate dec 5)))
(into [] (drop-last (reverse (range 6))))
(vec (reverse (rest (range 6))))


;; Encuentra el indice de un grupo denumeros dentro de un array ejemplo: ​"zzabyycdxx"​,[​'b'​,​'y'​] -> 3

(defn indexed [coll] (map-indexed vector coll)); (indexed "abcde") -> ([0 ​\a​] [1 ​\b​] [2 ​\c​] [3 ​\d​] [4 ​\e​])

(defn index-filter [pred coll]
  (when pred
    (for [[idx elt] (indexed coll) :when (pred elt)] idx)))

(index-filter #{\a \b} "abcdbbb"); -> (0 1 4 5 6)

(index-filter #{\a \b} "xyzxzy"); -> ()

(defn index-of-any [pred coll]
  (first (index-filter pred coll)))

(index-of-any #{\z \a} "zzabyycdxx"); -> 0
(index-of-any #{\b \y} "zzabyycdxx"); -> 3

