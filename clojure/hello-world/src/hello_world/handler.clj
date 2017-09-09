(ns hello-world.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]))

(defroutes app-routes
  (GET "/" [] "<h1>Hello World</h1>")
  (GET "/greet/:name" [name] (str "Greetings user " name))
  (route/not-found "Not Found"))

(def app
  (wrap-defaults app-routes site-defaults))
