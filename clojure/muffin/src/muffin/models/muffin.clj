(ns muffin.models.muffin
  (:require [schema.core :as s]))

(s/defschema Muffin
  {:name s/Str
   (s/optional-key :_id) s/Str
   (s/optional-key :description) s/Str
   :size (s/enum :L :M :S)
   :origin {:country (s/enum :NL :FI :PO)
            :city s/Str}})
