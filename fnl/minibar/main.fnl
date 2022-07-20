;; Winbar logic.

(local opts (require :minibar.opts))

(local events (. opts :events))

(local ignore-filetypes (. opts :ignore-filetypes))

(fn is-empty [arg]
  (or (= arg nil) (= arg "")))

(fn get-filetype []
  vim.bo.filetype)

(fn get-filename []
  (vim.fn.expand "%:t"))

(fn ignore []
  (vim.tbl_contains ignore-filetypes (get-filetype)))

(fn get-winbar []
  (if (and (not= (ignore) true) (= (is-empty (get-filename)) false))
      (do
        (print (get-filename))
        (print (get-filetype))
        (vim.api.nvim_set_option_value :winbar (.. " " "%t%m") {:scope :local}))
      (set vim.opt_local.winbar nil)))

(vim.api.nvim_create_autocmd events
                             {:callback (lambda []
                                          (get-winbar))})
