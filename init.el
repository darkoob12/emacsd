(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(add-to-list 'load-path "~/.emacs.d/custom/")
(add-to-list 'load-path "~/.emacs.d/wikiemacs/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-mark-ring-max 5000)
 '(package-selected-packages
   '(apheleia crux company-jedi ein elpy mic-paren gameoflife yasnippet-snippets rainbow-mode rainbow-delimiters zenburn-theme ample-zen-theme discover-my-major highlight-symbol highlight-numbers golden-ratio nyan-mode flycheck flycheck-tip magit diff-hl vlf ztree ido-completing-read+ recentf-ext flx-ido smex ibuffer-vc projectile expand-region company clean-aindent-mode duplicate-thing smartparens workgroups2 volatile-highlights yasnippet undo-tree vs-dark-theme))
 '(vlf-applicatoin 'dont-ask))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'editing-setup)
(require 'env-setup)
(require 'ide-setup)
(require 'fs-setup)
;; (require 'term-setup)
(require 'disp-setup)

(require 'workgroups2)
(workgroups-mode 1)			; prefix key is C_c z
