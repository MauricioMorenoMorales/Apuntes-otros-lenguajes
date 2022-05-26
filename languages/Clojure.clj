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

; or returns the first falsey value or the last truthy value

(or false nil :large_I_mean_venti :why_cant_I_just_say_large); why_cant

(or (= 0 1) (= "yes" "no")); false

(or nil); nil

; nad returns the first falsey value or the last truthy value

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