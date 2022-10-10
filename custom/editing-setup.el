(provide 'editing-setup)


;;******************
;; changing emacs config
;;******************
(setq global-mark-ring-max 5000
      mark-ring-max 5000
      mode-require-final-newline t)

(setq-default tab-width 4)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)


(setq-default indent-tabs-mode nil)

(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

(setq kill-ring-max 5000
      kill-whole-line t)  ; if NIL, kill whole line and move the next line up

;; show important whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
			    (setq-local whitespace-style
					'(face
					  tabs
					  tab-mark
					  spaces
					  space-mark
					  trailing
					  indentation::space
					  indentation::tab
					  newline
					  newline-mark))
                            (whitespace-mode 1)))

;;******************
;; CUSTOM FUNCTIONS
;;******************
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defcustom prelude-indent-sensitive-modes
  '(coffee-mode python-mode slim-mode haml-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list)


(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (unless (member major-mode prelude-indent-sensitive-modes)
    (save-excursion
      (if (region-active-p)
          (progn
            (indent-region (region-beginning) (region-end))
            (message "Indented selected region."))
        (progn
          (indent-buffer)
          (message "Indented buffer.")))
      (whitespace-cleanup))))

(global-set-key (kbd "C-c i") 'indent-region-or-buffer)



;;******************
;; ACTIVATING PACKAGES
;;******************
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

(require 'volatile-highlights)
(volatile-highlights-mode t)

;; (require 'smartparens-config)
;; (setq sp-base-key-bindings 'paredit)
;; (setq sp-autoskip-closing-pair 'always)
;; (setq sp-hybrid-kill-entire-symbol nil)
;; (sp-use-paredit-bindings)


(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'yasnippet)
(yas-global-mode 1)

;; go-to-address-mode
(add-hook 'prog-mode-hook 'goto-address-mode)
(add-hook 'text-mode-hook 'goto-address-mode)


;; SPELL CHECKING
;; (if (executable-find "aspell")
;;     (progn
;;       (setq ispell-program-name "aspell")
;;       (setq ispell-extra-args '("--sug-mode=ultra")))
;;   (setq ispell-program-name "ispell"))

;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'org-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

