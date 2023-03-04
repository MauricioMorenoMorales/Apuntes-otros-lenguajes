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
