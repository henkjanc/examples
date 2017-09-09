(ns muffin.repositories.dao.muffin
  (:require [monger.core :as m]
            [monger.json]
            [monger.collection :as mc])
  (:import [org.bson.types ObjectId]))

(let [conn (m/connect)
      db   (m/get-db conn "clojure-bootcamp")
      coll :muffins]

  (defn create-id []
    (str (ObjectId.)))

  (defn all []
    (mc/find-maps db coll))

  (defn insert! [muffin]
    (mc/insert-and-return db coll (assoc muffin :_id (create-id))))

  (defn get-by-name [name]
    (mc/find-one-as-map db coll {:name name}))

  (defn get-by-id [id]
    (mc/find-map-by-id db coll id))

  (defn remove! [id]
    (mc/remove db coll {:_id id})
    nil)

  (defn update! [id body]
    (mc/update db coll {:_id id} body)
    nil)

  (defn remove-all! []
    (mc/remove db coll)
    nil))

(comment
  (insert! {:name "futu"})
  (insert! {:name "olvi"})
  (update-by-name! "olvi" {:name "olvi" :taste "good"})
  (get-by-name "olvi")
  (remove-by-name! "olvi")
  (all)
  (remove-all!))
