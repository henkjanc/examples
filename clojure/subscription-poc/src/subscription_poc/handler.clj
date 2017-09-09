(ns subscription-poc.handler
  (:require [compojure.api.sweet :refer :all]
            [ring.util.http-response :refer :all]
            [schema.core :as s]
            [cheshire.core :as cheshire]))

(s/defschema Subscription ;schema used for validation and swag documentation
  {:name s/Str
   :external-id s/Str
   :provider-id s/Str
   (s/optional-key :certificate) s/Bool
   (s/optional-key :username) s/Str})

(defn parse-req [body] ;parse body back to json
  (cheshire/parse-string (slurp body) true))

(defmulti credentials :provider-id) ;http://clojure.org/reference/multimethods

(defmethod credentials "foovider" [subscription]
  (assoc subscription :certificate true))

(defmethod credentials "barvider" [subscription]
  (assoc subscription :certificate false :username ""))

;functions called by endpoints
(defn get-subscriptions [request]
  (ok [{:name "foo" :external-id "123" :provider-id "foovider" :certificate false :username "foo"}]))

(defn save-subscription [request]
  (let [data (:body request)
        subscription (cheshire/parse-string (slurp data) true)]
    (created (credentials subscription))))


(def subscription-routes ;all routes for subscriptions
  (context "/subscriptions" []
    :tags ["subscriptions"]
    (GET "/" []
      :summary "Gets all subscriptions"
      :return [Subscription]
      get-subscriptions)
    (POST "/" []
      :summary "Saves a subscription"
      :return Subscription
      :body-params [name :- String, external-id :- String, provider-id :- String]
      save-subscription)))

(def app ;the application server itself, starting point when running 'lein ring server'
  (api
    {:swagger
     {:ui "/"
      :spec "/swagger.json"
      :data {:info {:title "Subscription-poc"
                    :description "Compojure Api example"}
             :tags [{:name "api", :description "some apis"}
                    {:name "subscriptions", :description "the subscription endpoints"}]}}}

    (context "/api" []
      :tags ["api"]
      subscription-routes)))
