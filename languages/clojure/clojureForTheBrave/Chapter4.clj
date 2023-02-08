(defn titelize
	[topic]
	(str topic " for the brave and True")])

;; List
(map titelize ["Hasters" "Ragnarok"])

;; Vectors
(map titelize '("Empathy" "Decorating"))

;; Sets
(map titelize #{"Elbows" "Soap Carving"})

(map #(titelize (second %)) {:uncomfortable-thing "Winking"})

(seq '(1 2 3))
(seq [1 2 3])
(seq #{1 2 3})
;; >> (1 2 3)

(seq {:name "Bill Compton" :occupation "Dead mopey guy"})
;;>> ([:name "Bill Compton"] [:occupation "Dead moepey guy"])

;; Revert a map seq
(into {} (seq {:a 1 :b 2 :c 3}))


;;! Funciones de secuencias

;;? Map
(map inc [1 2 3])
; => (2 3 4)
(map str ["a" "b" "c"] ["A" "B" "C"])
; => ("aA" "bB" "cC")

(list (str "a" "A") (str "b" B) (str "c" "C"))

(def human-consumption [8.1 7.3 6.6 5.0])
(def critter-consumption [0.0 0.2 0.3 1.1])

(defn unify-diet-data
	[huma critter]
	{:human human
	:critter critter})

(map unify-diet-data human-consumption critter-consumption)

;; PAssing a collection of fcuncions

(def sum #(reduce + %))
(def avg #(/ (sum %) (count %)))

(defn stats
	[numbers]
	(map #(% numbers) [sum count avg]))

(stats [3 4 10])
; >> (17 3 17/3)

(stats [80 1 44 13 6])
; >> (144 5 144/5)

;; Using map to retrieve data

(def identities
	[{:alias "Batman"      :real "Bruce wayne"}
	{:alias "Spider-Man"   :real "Peter PArker"}
	{:alias "Santa"        :real "Your mom"}
	{:alias "Easter Bunny" :real "Your dad"}])

(map :real identities)

;;? Reduce

(reduce (fn [new-map [key val]]
	(assoc new-map key (inc val)))
	{}
	{:max 30 :min 10})
;;=> {:max 31 :min 11}

;; =========
(reduce (fn [new-map [key val]]
	(if (> val 4)
		(assoc new-map key val)
		new-map))
		{}
		{:human 4.1
		:critter 3.9})

(take 3 [1 2 3 4 5 6 7 8 9])
; => (1 2 3)

(drop 3 [1 2 3 4 5 6 7 8 9])
; => (4 5 6 7 8 9)

(def food-journal
  [{:month 1 :day 1 :human 5.3 :critter 2.3}
   {:month 1 :day 2 :human 5.1 :critter 2.0}
   {:month 2 :day 1 :human 4.9 :critter 2.1}
   {:month 2 :day 2 :human 5.0 :critter 2.5}
   {:month 3 :day 1 :human 4.2 :critter 3.3}
   {:month 3 :day 2 :human 4.0 :critter 3.8}
   {:month 4 :day 1 :human 3.7 :critter 3.9}
   {:month 4 :day 2 :human 3.7 :critter 3.6}])

(take-while #(< (:month %) 3) food-journal)
; >= ({:month 1 :day 1 :human 5.3 :critter 2.3}
      ;; {:month 1 :day 2 :human 5.1 :critter 2.0}
      ;; {:month 2 :day 1 :human 4.9 :critter 2.1}
      ;; {:month 2 :day 2 :human 5.0 :critter 2.5})

(drop-while #(< (:month %) 3) food-journal)
;; => ({:month 3 :day 1 :human 4.2 :critter 3.3}
;      {:month 3 :day 2 :human 4.0 :critter 3.8}
;      {:month 4 :day 1 :human 3.7 :critter 3.9}
;      {:month 4 :day 2 :human 3.7 :critter 3.6})

(filter #(< (:human %) 5) food-journal)
;; => ({:month 2 :day 1 :human 4.9 :critter 2.1}
;      {:month 3 :day 1 :human 4.2 :critter 3.3}
;      {:month 3 :day 2 :human 4.0 :critter 3.8}
;      {:month 4 :day 1 :human 3.7 :critter 3.9}
;      {:month 4 :day 2 :human 3.7 :critter 3.6})

(some #(> (:critter %) 5) food-journal)

(some #(> (:critter %) 3) food-journal)

(sort-by count ["aaa" "c" "bb"])
; => ("c" "bb" "aaa")

;;! Laszy sequences

(def vampire-database
  {0 {:makes-blood-puns? false, :has-pulse? true  :name "McFishwich"}
   1 {:makes-blood-puns? false, :has-pulse? true  :name "McMackson"}
   2 {:makes-blood-puns? true,  :has-pulse? false :name "Damon Salvatore"}
   3 {:makes-blood-puns? true,  :has-pulse? true  :name "Mickey Mouse"}})

(defn vampire-related-details
	[social-security-number]
	(Thread/sleep 1000)
	(get-vampire-database social-security-number))

(defn vampire?
	[record]
	(and (:makes-blood-puns? record)
		(not (:has-pulse? record))
		record))

(defn indentify-vampire
	[social-security-numbers]
	(first (filter vampire?
		(map vampire-related-details social-security-numbers))))


;;! Lazy sequences

(take 3 (repeatedly (fn [] (rand-int 10))))
; returns three random numbers lazy sequence

(defn even-numbers
	([] (even-numbers 0)
	([n] (cons n (lazy-seq (even-numbers (+ 2 n)))))))
(take 10 (even-numbers)) ; returns 0 2 4 6 8 10 12 14 16 18 20

(map identity {:sunlight-reaction "Glitter"})
; ([:sunlight-reaction "Glitter"])

(into {} (map identity {:sunlight-reaction "Glitter"}))
; {:sunlight-reaction "Glitter"}

(map identity [:garlic :sesame-oil :fried-eggs])
; (:garlic :sesame-oil :fried-eggs)

(into [] (map identity [:garlic :sesame-oil :fried-eggs]))
; [:garlic :sesame-oil :fried-eggs]


;;! difference between conj and into

(conj [0] [1]); [0 [1]]
(into [0] [1]); [0 1]
(conj [0] 1);   [0 1]

;;! Apply convierte un valor que incluye muchos valores en muchos valores en vez de uno

(max 0 1 2); 2
(max [0 1 2]); [0 1 2]
(apply max [0 1 2]) ; 2

(defn my-into [target additions] (apply conj target additions))
(my-into [0] [1 2 3])

;;! Partial
(def add10 (partial + 10))
(add10 3); 13
(add10 5); 15

(def add-missing-elements
	(partial conj ["water" "warth" "air"]))
(add-missing-elements "unobtanium" "adamantium")
; ["water" "warth" "air" "unobtanium" "adamantium"]


(defn my-partial
	[partialized-fn & args]
	(fn [& more-args]
		(apply partialized-fn (into args more-args))))
(defn add20 (my-partial + 20))
(add20 3); 23

(defn lousy-logger
	[log-level message]
	(condp = log-level
		:warn      (clojure.string/lower-case message)
		:emergency (clojure.string/upper-case message)))
(def warn (partial lousy-loger :warn))
(warn "Red light ahead"); Red light ahead

