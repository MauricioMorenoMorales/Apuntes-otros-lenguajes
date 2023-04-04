; This is an if in clojure
(if true
	"By zeus hammer!"
	"By aquaman trident")

; you can wrap multiple forms in parentheses and run each of them

(if true
	(do (println "Success!")
			"By zeu's hammer!")
	(do (println "Failure")
			"By aquamans trident"))

; When is like a combination of "ifs" and "dos" but with no else

(when true
	(println "Success!")
	"Abra cadabra")

; or returns the first truthy value or the last value

(or false nil :large_I_mean_venti :why_cant_I_just_say_large); why_cant

(or (= 0 1) (= "yes" "no")); false

(or nil); nil

; and returns the first falsey value or the last truthy value

(and :free_wifi :hot_coffee); hot_coffee

(and :felling_sper_cool nil false); nil

; You can use def to bind values to a name in clojure

(def failed-protagonists-names
	["Larry Potter" "Doreen the Explorer" "The Incredible Bulk"])

; Example of error message

(defn error-message
	[severity]
	(str "OH GOD! ITS A DISASTER! WE'RE "
		(if (= severity :mild)
				"MILDY INCONVENIENCED!"
				"DO======OMED!")))

; The types of numbers are integers floats and ratios

93
1.2
1/5

; Scape strings

"\"Great cow of Moscow!\" - Hermes Conrad"

; There is no interpolation
(def name "Chewbacca")
(str "\"uggllglglglggglgl\" - " name)

;! Maps, are like objects

{:first-name "Charlie" :last-name "McFishwich"}

; Here we associate string-key with the + function

{"string-key" +}

{:name {:first "John" :middle "Jacob" :last "Jingleheimerschmidt"}}

; Alternative way to create

(hash-map :a 1 :b 2)

;You can look up values in maps with the get function:
(get {:a 0 :b 1} :b)
(get {:a 0 :b {:c "no hum"}} :b)

;The get-in function lets you look up values in nested maps:

(get-in {:a 0 :b {:c "ho hum"}} [:b :c])

;Another way to look up a value in a map is to treat the map like a function with the key as its argument
({:name "The human Cofeepot"} :name)

;Also you can use the keywords functions to acces data structures
(:a {:a 1 :b 2 :c 3})
(:d {:a 1 :b 2 :c 3} "this is a default value if d is not found")

; Vectors you can create vectors in this way
[1 2 3]
(vector "creppy" "fully" "moon")
; You can extract vectors from arrays in this way
(get [3 2 1] 0)
(get ["a" {:name "plugsley winterbottom"} "c"] 1)

; Lists are similar to vectors but you can retrieve elements with get
'(1 2 3 4 5)
(nth '(:a :b :c) 0)
(nth '(:a :b :c) 2)
(list 1 "two" {3 4})

; Add elements
(conj '(1 2 3) 4)

; Vectors vs lists, you shold use lists with macros and when you need to add elements to the beginning of the list

;! Sets, filters repeated data
#{"Kurt vonnegut" 20 :icicle}
(hash-set "kurt vonnegut" 20 :icicle)

(conj ${:a :ab} :b); #{:a :b}
(set [3 3 3 4 4]); #{3 4}

; Functions ===================================================================0

; Example of functions
(+ 1 2 3 4 5)
(* 1 2 3 4 5)
(first [1 2 3 4 5])

; Functions that returns the addition function
(or + -)
((and (= 1 1) +) 1 2 3)
((first [+ 0]) 1 2 3)
; Example of high order function
(inc 1.1); 2.1
(map inc [0 1 2 3]); (1 2 3 4)

(+ (inc 199) (/ 100 (- 7 2)))
(+ 200 (/ 100 5))
(+ 200 20); --> 220



; Defining functions ==========================================================
(defn too-enthusiastic
	"Return a cherr that might be a bit too ethusiastic"
	[name]
	(str "Oh my god! " name "you are most definetiley like the best "
		"Man slash woman ever i love you and we should run away somewhere"))

(too-enthusiastic "Zelda")

; Functions also support arity

(defn no-params
	[]
	"I take no parameters")

(defn one-param
	[x]
	(str "I take one parameter: " x))

(defn two-params
	[x y]
	(str "Two parameters! That's nothing! Pah! I will smosh them "
	"togeter to spite you! " x y))

; an arity shortcut

(defn multy-arity
	([first-argument second-argument third-argument]
		(do-things first-argument second-argument third-argument))
	([first-argument second-argument]
		(do-things first-argument second-argument))
	([first-argument]
	(do-things first-argument)))

; We can use arity overloading to define default values

(defn x-chop
	"Describe the kind of chop you are inflicting on someone"
	([name chop-type]
		(str "I " chop-type " chop " name "! Take that!"))
	([name]
		(x-chop name "karate")))

; Also you can use arity to create completely different things

(defn weird-arity
  ([]
		"Destiny dressed you this morning, my friend, and now Fear is
		trying to pull off your pants. If you give up, if you give in,
		you're gonna end up naked with Fear just standing there laughing
		at your dangling unmentionables! - the Tick")
  ([number]
		(inc number)))

; Also you can use the rest parameters

(defn codger-communication
	[whisppersnapper]
	(str "Get off my lawn, " whisppersnapper "!!!"))

(defn codger
	[& whispersnappers]
	(map codger-communication whispersnappers))

(defn favorite-things
	[name & things]
	(str "Hi, " name ", here are my favorite things: "
		(clojure.string/join ", " things)))

; Also we can use destructuring

(defn my-first
	[[first-thing]]
	first-thing)

; We can combine this with rest parameters

(defn chooser
	[[first-choice second-choice & unimportant-choices]]
	(println (str "Your first choice is: " first-choice))
	(println (str "Your second choice is: " second-choice))
	(println (str "We're ignoring the rest of your choices. "
								"Here they are in case you need to cry over them: "
								(clojure.string/join ", " unimportant-choices))))

; Also you can destructure maps

(defn announce-treasure-location
	[{lat :lat lng :lng}] ; naming the keys
	(println (str "treasure lat: " lat))
	(println (str "treasure lng: " lng)))

(defn announce-treasure-location
	[{:keys [lat lng]}]; Only takes the keys with their original names
	(println (str "treasure lat: " lat))
	(println (str "treasure lng: " lng)))


(announce-treasure-location {:lat 28.22 :lng 81.33})

; Also we can retain the original map in this way

(defn receive
	[{:keys [lat lng] :as treasure-location}]; We retain access to the original object
	(println (str "treasure lat: " lat))
	(println (str "treasure lng: " lng)))

; Function body ========================================================

; Clojure returns the last form evaluated

(defn illustrative-function
	[]
	(+ 1 304)
	30
	"Joe"); => Joe

(defn number-content
	[y]
	(if (>= y 7)
		"Oh my gosh! What a big number!"
		"That number's OK, I guess"))

; Anonymous functions
(fn [param-list]
	function body)

(map (fn [name] (str "Hi, " name))
	["Darth vader" "Mr. Magoo"]); Here we pass the parameter

((fn [x] (* x 3)) 8)

(def my-special-multiplier (fn [x] (* x 3)))
(my-special-multiplier 12); 36

; Anonymous function shortcut
#(* % 3)
(#(* % 3) 8)

(map #(str "Hi, " %)
	["Darth Vader" "Mr. Magoo"])

(#(str %1 " and " %2) "Cornerbread" "butter beans")

;;Also you can use rest parameter
(#(identity %&) 1 2 3)

;;Closure =============================================================
(defn inc-maker
	"Create a custom incrementor"
	[inc-by]
	#(+ % inc-by))

(def inc3 (inc-maker 3))

;; !Putting all together ============================================

(def asym-hobbit-body-parts
	[{:name "head" :size 3}
	{:name "left-eye" :size 1}
	{:name "left-ear" :size 1}
	{:name "mouth" :size 1}
	{:name "nose" :size 1}
	{:name "neck" :size 2}
	{:name "left-shoulder" :size 3}
	{:name "left-upper-arm" :size 3}
	{:name "chest" :size 10}
	{:name "back" :size 10}
	{:name "left-forearm" :size 3}
	{:name "abdomen" :size 6}
	{:name "left-kidney" :size 1}
	{:name "left-hand" :size 2}
	{:name "left-knee" :size 2}
	{:name "left-thigh" :size 4}
	{:name "left-lower-leg" :size 3}
	{:name "left-achilles" :size 1}
	{:name "left-foot" :size 2}])

(defn matching-part
	[part]
	{:name (clojure.string/replace (:name part) #"^left-" "right-")}
	:size (:size part))

(defn symmetrize-body-parts
	"Expects a seq of maps that have a :name and :size"
	[asym-body-parts]
	(loop [remaining-asym-parts asym-body-parts
		final-body-parts []]
		(if (empty? remaining-asym-parts)
			final-body-parts
			(let [[part & remaining] remaining-asym-parts]
				(recur remaining
					(into final-body-parts
						(set [part (matching-part part)])))))))

;;! Let
; let allows you to declare variables inside the functions
(let [x 3] x); 3

(def dalmatian-list
	["Pongo" "Perdita" "Puppy 1" "Puppy 2"])
(let [dalmatians (take 2 dalmatian-list)] dalmatians)

; you can refer another values
(def x 0)
(let [x (inc x)] x)

; Rest parameter and destructuring
(let [[pongo & dalmatians] dalmatian-list]
	[pongo dalmatians]); ["Pongo" ("Perdita" "Puppy 1" "Puppy 2")]

; Try understand this

(let [[part & remaining] remaining-asym-parts]
	(recur remaining
		(into final-body-parts
			(set [part (matching-part part)]))))

;;! Loop

(loop [iteration 0]
	(println (str "Iteration " iteration))
	(if (> iteration 3)
		(println "Goodbye!")
		(recur (inc iteration)))); Else that iterates again

; Loop with recursive

(defn recursive-printer
	([]
		(recursive-printer 0))
	([iteration]
		(println iteration)
		(if (> iteration 3)
			(println "Goodbye!")
			(recursive-printer (inc iteration)))))

;;! regular expresions
(re-find #"left-" "left-eye"); "left-"
(re-find #"left-" "cleft-chin"); nil

;example

(defn matching-part
	[part]
	{:name (clojure.string/replace (:name part) #"left-" "right-")
	:size (:size part)})

(matching-part {:name "left-eye" :size 1}); {:name "right-eye" :size 1}]

;;! Reduce
(reduce + [1 2 3 4 ]); 10
(+ (+ (+ 1 2) 3) 4)
; with initial value
(reduce + 15 [1 2 3 4 5])

(defn my-reduce
	([f initial coll]
		(loop [result initial
					remaining coll]
			(if (empty? remaining)
				reulst
				(recur (f result (first remaining)) (rest remaining)))))
	([f [head & tail]]
		(my-reduce f head tail)))

(defn better-symmetrize-body-parts
	"Expects a seq of maps that have a :name and :size"
	[asym-body-parts]
	(reduce
		(fn [final-body-parts part]
			(into final-body-parts (set [part (matching-part part)])))
		[]
		asym-body-parts))

(defn hit
  [asym-body-parts]
  (let [sym-parts (better-symmetrize-body-parts asym-body-parts)
        body-part-size-sum (reduce + (map :size sym-parts))
        target (rand body-part-size-sum)]
    (loop [[part & remaining] sym-parts
          accumulated-size (:size part)]
      (if (> accumulated-size target)
        part
        (recur remaining (+ accumulated-size (:size (first remaining))))))))
