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

