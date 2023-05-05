(defproject hello-world "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.3"]
                 [org.clojure/clojurescript "0.0-1450"]]
  :repl-options {:init-ns hello-world.core}
  :plugins [[lein-cljsbuild "0.2.7"]]
  :cljsbuild {:builds [{
                        :source-path "src/cljs"
                        :compiler {
                                   :output-to "resources/public/hello.js"
                                   :optimizations :whitespace
                                   :pretty-print true}}]})

