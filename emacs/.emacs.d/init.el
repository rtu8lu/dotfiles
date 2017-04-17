;; some sane defaults

(setq gc-cons-threshold 10000000)
(setq large-file-warning-threshold 100000000)

(prefer-coding-system 'utf-8)

(setq auto-save-default nil
      make-backup-files nil)

(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(blink-cursor-mode -1)

(setq ring-bell-function 'ignore)

(setq inhibit-startup-screen t)

(setq scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)

(setq-default indent-tabs-mode nil
              tab-width 4)

(setq require-final-newline t)

(setq-default c-default-style "linux")

(setq-default ispell-program-name "hunspell")

;; local lisp packages
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; move custom out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; always load newest code
(setq load-prefer-newer t)

;; one use-package to rule them all
;;
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;;
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

;; theme loading should go after loading the terminal-specific library,
;; and I don't care about windowed emacs
(use-package apropospriate-theme
             :init
             (add-hook 'tty-setup-hook
                       (lambda () (load-theme 'apropospriate-dark t))))

(use-package whitespace
  :diminish whitespace-mode
  :init
  (add-hook 'prog-mode-hook #'whitespace-mode)
  (add-hook 'text-mode-hook #'whitespace-mode)
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face tabs empty trailing lines-tail))
  ;; colors according to the theme
  (custom-set-faces
   '(whitespace-empty ((t (:background "gray34"))))
   '(whitespace-trailing ((t (:background "gray34"))))
   '(whitespace-line ((t (:background "gray20"))))
   '(whitespace-tab ((t (:background "gray22"))))))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package paren
  :ensure nil
  :config
  (setq show-paren-delay 0.1)
  (show-paren-mode 1)
  (custom-set-faces
   '(show-paren-match
     ((t (:inherit nil
          :weight extra-bold
          :underline unspecified))))
   '(show-paren-mismatch
     ((t (:inherit nil
          :weight extra-bold
          :underline unspecified))))))

(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-ignore-buffers-re "^\\*"))

(use-package helm
  :diminish helm-mode
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-x C-f" . helm-find-files)))

(use-package helm-ag
  :bind (("C-x g" . helm-do-ag)))

(use-package crux
  :bind (([remap move-beginning-of-line] . crux-move-beginning-of-line)
         ([remap open-line] . crux-smart-open-line)
         ("M-o" . crux-smart-open-line-above)
         ([remap electric-newline-and-maybe-indent]
          . crux-kill-line-backwards)
         ("C-M-j" . crux-top-join-line)))

(use-package avy
  :bind (("C-x ," . avy-goto-word-or-subword-1)
         ("C-x ." . avy-goto-char-timer))
  :config
  (setq avy-background t))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(use-package anzu
  :bind (([remap query-replace]
          . anzu-query-replace)
         ([remap query-replace-regexp]
          . anzu-query-replace-regexp))
  :config
  (global-anzu-mode 1)
  (custom-set-variables
   '(anzu-mode-lighter "")
   '(anzu-replace-to-string-separator " → ")))

(use-package easy-kill
  :bind (([remap kill-ring-save] . easy-kill)
         ([remap mark-sexp] . easy-mark)))

(use-package imenu-anywhere
  :bind ("C-c i" . imenu-anywhere))

(use-package company
  :diminish company-mode
  :bind ("M-SPC" . company-complete-common)
  :config
  ;; no idle completion, manual only
  (setq company-idle-delay nil)
  (global-company-mode))

;;
(dolist (p '(yaml-mode
             markdown-mode
             js2-mode
             haskell-mode
             idris-mode
             erlang
             elixir-mode
             rust-mode
             elm-mode))
  (when (not (package-installed-p p))
    (package-install p)))
