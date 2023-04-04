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

; Funciones constructoras de maps

(defrecord name [arguments])

(defrecord Book [title author])
(Book "Titulo" "Author")

;; Estructura de las funciones
;(defn name doc-string? attr-map [params*] prepost-map? body)

; Puedes establecer documentacion
(defn greeting
  "Returns a greeting of the form 'Hello, username.'"
  [username]
  (format "Hello, %s" username))

(doc greeting); Returns a greeting of the form 'Hello, username.'

; Puedes establecer valores por defecto usando recursividad

(defn greeting
  "Returns a greeting of the form 'Hello, username.'"
  ([] (greeing "world!"))
  ([username]
    (format "Hello, %s" username)))

  (defn date
    [person-1 person-2 & chaperones]
    (format "%s and %s went out with %3d chaperones."
      person-1 person-2 (count chaperones)))

(defn indexable-words [text]
  (let [indexable-word? #(> (count %) 2)]
    (filter indexable-word? (str/split text #​"\W+"​))))

;; Closure

(defn make-greeter [greeting-prefix]
  (fn [username] (str greeting-prefix ", " username)))

;;! Variables bindings and Namespaces

(def foo 10); Crea una variable
(var foo); retorna el nombre de la variable #'user/foo

;; Destructuracion

(defn greet-athor [author]
  (println "Hello, " (:first-name author)))
(greet-author-1 {:last-name "Vinge" :first-name "Vernor"})

(defn greet-author-2 [{fname :first-name}]
  (println "Hello, " fname))

(let [[x y _] [1 2 3]]
  [x y]); [1 2]

(​let​ [[x y :as coords] [1 2 3 4 5 6]]
​  (str ​"x: "​ x ​", y: "​ y ​", total dimensions "​ (count coords)))


; As binder

(requre '[clojure.string :as str])
(defn ellipsize [words]
  (let [[w1 w2 w3] (str/split words #"\s+")]
    (str/join " " [w1 w2 w3 "..."])))

(ellpispize "The quick brown fox jumps over the lazy dog.")

;; ! Namespaces
; Puedes crear nuevos namespaces de esta forma
(in-ns 'name)

;;! Comments

;Puedes comentar expresiones enteras de este modo

(defn triple [number]
  #_(println "debug triple" number)
  (* 3 number))

