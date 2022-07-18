;; Override default opts.

(fn setup [user-opts]
  (each [k v (pairs user-opts)]
    (tset (require :minibar.opts) k v)))

{: setup}
