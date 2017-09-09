(defproject muffin "0.1.0-SNAPSHOT"
  :description "Muffin API allows online API muffin-ordering"
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [clj-time "0.11.0"] ; required due to bug in `lein-ring uberwar`
                 [metosin/compojure-api "1.0.0"]
                 [com.novemberain/monger "3.0.2"]]
  :ring {:handler muffin.services.muffin/app}
  :uberjar-name "server.jar"
  :profiles {:dev {:dependencies [[javax.servlet/servlet-api "2.5"]]
                   :plugins [[lein-ring "0.9.7"]]}})
