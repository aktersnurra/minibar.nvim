(setmetatable {}
              {:__index (fn [t k]
                          (match k
                            :setup (. (require :minibar.user) :setup)
                            :opts (require :minibar.opts)))})
