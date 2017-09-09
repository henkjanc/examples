(ns clojure-noob.core
  (:use [liberator.core :only [defresource]]))

(defresource hello-world
  :available-media-types ["text/plain"]
  :handle-ok "Hello, world!")

  (:gen-class))

