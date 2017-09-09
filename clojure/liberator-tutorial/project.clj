(defproject liberator-tutorial "0.1.0-SNAPSHOT"
  :plugins [[lein-ring "0.8.11"]]
  :ring {:handler liberator-tutorial.core/handler}
:q
  :dependencies [[org.clojure/clojure "1.7.0"]
                 [liberator "0.13"]
                 [compojure "1.3.4"]
                 [ring/ring-core "1.2.1"]])
