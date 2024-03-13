(def data
  [{:name "Renta" :value 8000}
   {:name "Jimmy Joy" :value 3300}
   {:name "Carro" :value 5000}
   {:name "Gasolina" :value 1000}
   {:name "viajes" :value 5000}])

(def total
  (reduce (fn [acc item] (+ acc (:value item))) 0 data))

(println total)
