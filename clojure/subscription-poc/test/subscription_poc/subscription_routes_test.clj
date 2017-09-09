(ns subscription-poc.subscription_routes_test
  (:require [cheshire.core :as cheshire]
            [midje.sweet :refer :all]
            [subscription-poc.handler :refer :all]
            [ring.mock.request :as mock]
            [clojure.string :as str]))

(defn parse-body [body]
  (cheshire/parse-string (slurp body) true))

(defn to-json [body]
  (cheshire/generate-string body))

(def mock-subscription {:name "mock-sub" :external-id "externalid" :provider-id "barvider"})

(facts "Subscription routes"
  (fact "GET /subscriptions returns an array of subscription"
    (let [response (app (-> (mock/request :get  "/api/subscriptions")))
          body     (parse-body (:body response))]
      (:status response) => 200
      (type body) => clojure.lang.LazySeq
      (let [subscription (first body)]
        subscription => {:name "foo" :external-id "123" :provider-id "foovider" :certificate false :username "foo"})))

  (facts "POST /subscription"
    (fact "should give a 400 if the name is not present"
      (let [mock-req (-> (mock/request :post "/api/subscriptions")
                         (mock/content-type "application/json")
                         (mock/body (to-json (dissoc mock-subscription :name))))
            response (app mock-req)
            body     (parse-body (:body response))]
        (:status response) => 400
        (-> (body :errors)) => {:name "missing-required-key"}))
    (facts "foovider"
      (fact "should save the subscription if all parameters are present"
        (let [mock-req (-> (mock/request :post "/api/subscriptions")
                           (mock/content-type "application/json")
                           (mock/body (to-json (assoc mock-subscription :provider-id "foovider"))))
              response (app mock-req)
              body     (parse-body (:body response))]
          (:status response) => 201
          body               => (assoc mock-subscription :provider-id "foovider"
                                                         :certificate true))))

    (facts "barvider"
      (fact "should save the subscription if all parameters are present"
        (let [mock-req (-> (mock/request :post "/api/subscriptions")
                           (mock/content-type "application/json")
                           (mock/body (to-json (assoc mock-subscription :provider-id "barvider"))))
              response (app mock-req)
              body     (parse-body (:body response))]
          (:status response) => 201
          body               => (assoc mock-subscription :provider-id "barvider"
                                                         :certificate false
                                                         :username ""))))))
