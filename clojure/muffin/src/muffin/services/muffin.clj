(ns muffin.services.muffin
  (:require [compojure.api.sweet :refer :all]
            [ring.util.http-response :refer :all]
            [muffin.models.muffin :refer :all]
            [muffin.repositories.dao.muffin :as dao]))

(def app
  (api
    {:swagger
     {:ui "/"
      :spec "/swagger.json"
      :data {:info {:title "Muffin"
                    :description "Compojure Muffin Api. Order yours now via the Api."}
             :tags [{:name "api", :description "some apis"}]}}}

    (context "/api/muffins" []
      :tags ["muffins"]

      (GET "/" []
        :return [Muffin]
        :summary "Gets a list of muffins"
        (ok (dao/all) ))

      (GET "/:id" [id]
        :return Muffin
        :summary "Gets a muffin by id"
        (ok (dao/get-by-id id)))

      (DELETE "/:id" [id]
        :return Muffin
        :summary "Deletes a muffin"
        (ok (dao/remove! id)))

      (POST "/" []
        :return Muffin
        :body [muffin Muffin]
        :summary "Creates a Muffin"
        (dao/insert! muffin)
        (ok muffin))

      (PUT "/:id" [id]
        :return Muffin
        :body [muffin Muffin]
        :summary "Updates a Muffin"
        (dao/update! id muffin)
        (ok muffin)))))
