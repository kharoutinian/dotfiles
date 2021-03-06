; Basic plugin loading
(add-to-list 'load-path "/home/krikor/.emacs.d/")
(add-to-list 'load-path "/home/krikor/.emacs.d/plugins/")

; I need my linums
(require 'linum)
(linum-mode)

; Clean up backups and autosaves
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms~
      `((".*" ,temporary-file-directory t)))

; Enable ido mode for fuzzy file matching
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

; Load company-mode (autocompletion plugin)
(add-to-list 'load-path "~/.emacs.d/plugins/company")
(autoload 'company-mode "company" nil t)

; Geiser configuration
(setq geiser-impl-installed-implementations '(racket guile))
(load-file "~/src/geiser/elisp/geiser.el")

; Quack configuration
(require 'quack)

(autoload 'paredit-mode "paredit"
  "Minor mode for psuedo-structurally editing Lisp code." t)
(add-hook 'M-mode-hook (lambda () (paredit-mode +1)))

; REPL settings
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

(custom-set-variables
 '(inhibit-startup-screen t))
(custom-set-faces
 )
