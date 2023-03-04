;;! Inmutable recursion

(defn sum
	([vals] (sum vals 0)
	([vals accumulating-total]
		(if (empty? vals)
			accumulating-total
			(recur (rest vals) (+ (first vals) accumulating-total))))))

;; This returns this

(sum [39 5 1])
(sum [39 5 1] 0)
(sum [5 1] 39)
(sum [1] 44)
(sum [] 45); this value is returned

(require '[clojure.string :as s])

(defn clean [text]
	(s/replace (s/trim text) #"lol" "LOL"))
(clean "My boa constrictor is so sassy lol! "); My boa constrictor is so sassy LOL!

;;! Composicion de funciones
((comp inc *) 2 3); 7

(def character
  {:name "Smooches McCutes"
   :attributes {
      :intelligence 10
      :strength 4
      :dexterity 5
   }})

(def c-int (comp :inteligence :attributes))
(def c-str (comp :strength :attributes))
(def c-dex (comp :dexterity :attributes))

(c-int character); 10
(c-str character); 4
(c-dex character); 5

(defn spell-slots
  [char]
  (int (inc (/ (c-int char) 2))))

(spell-slots character)

;Example of composition
(defn two-comp
  [f g]
  (fn [& args]
    (f (apply g args))))

;;! Memoize
(defn sleepy-identity
  "Returns the given value after 1 second"
  [x]
  (Thread/sleep 1000)
  x)
(sleepy-identity "Mr Fantastico")
;; Si memoizas esta funcion solamente tardara 1000 milisegundos la primera llamada
(def memo-sleepy-identity (memoize sleepy-identity))
(memo-sleepy-identity "Mr Fantastico")