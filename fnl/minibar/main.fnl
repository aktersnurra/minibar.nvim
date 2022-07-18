;; Winbar logic.

(local opts (require :minibar.opts))

(fn concat [tbl]
  (table.concat tbl ","))

(fn create-general-table [seq-tbl]
  (let [tbl {}]
    (each [_ v (ipairs seq-tbl)]
      (tset tbl v true))
    tbl))

(local events (let [events (. opts :events)]
                (concat events)))

(local ignore-filetypes
       (let [ignore-filetypes (. opts :ignore-filetypes)]
         (create-general-table ignore-filetypes)))

(fn is-empty [arg]
  (or (= arg nil) (= arg "")))

(fn get-filetype []
  vim.bo.filetype)

(fn ignore []
  (. ignore-filetypes (get-filetype)))

(fn get-winbar []
  (if (and (not= (ignore) true) (not= (is-empty (get-filetype)) true))
      (vim.api.nvim_set_option_value :winbar (.. " " "%t%m") {:scope :local})
      (vim.api.nvim_set_option_value :winbar "" {:scope :local})))

(nvim.create_autocmd events
                     {:callback (lambda []
                                  (get-winbar))})
