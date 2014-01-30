(defun emacs-path(path)
  (expand-file-name path "~/.emacs.d"))

(load-file (emacs-path "packages.el"))
(load-file (emacs-path "utils.el"))

;; Default theme
(load-theme 'zenburn t)

;; highlight tabs
(toggle-highlight-tabs)
(toggle-highlight-trailing-whitespace)

;; Undo tree
(global-undo-tree-mode)

;; Autocomplete mode
(require 'auto-complete)
(global-auto-complete-mode t)

;; Volatile highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Smartparens
(smartparens-global-mode t)

;; Smex
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; ido-ubiquitous
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Move text
(move-text-default-bindings)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Projectile
(projectile-global-mode)
(setq projectile-require-project-root nil)

;; Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Visible Bookmarks
(global-set-key (kbd "<S-f1>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; Rainbow mode
(add-hook 'css-mode-hook 'rainbow-mode)

;; Rainbow delimiters
(global-rainbow-delimiters-mode)

;;Anzu
(global-anzu-mode +1)

;; Clean trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Hide default bars
(menu-bar-mode -1)
(tool-bar-mode -1)
;;(scroll-bar-mode -1)

;; Remove default start-up buffer
(setq inhibit-startup-message t)

;; Set Linum-Mode on
(global-linum-mode t)

;; Linum-Mode and add space after the number
(setq linum-format "%d ")

;; Go to line
(global-set-key (kbd "M-l") 'goto-line)

;; Comment/Uncomment
(global-set-key (kbd "C-c n") 'comment-region)
(global-set-key (kbd "C-c m") 'uncomment-region)

;; Disable auto-save
(setq auto-save-default nil)

;; Disable auto-backup
(setq make-backup-files nil)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Open next line
(global-set-key (kbd "C-o") 'open-next-line)

;; Indentation
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Default indentation is usually 2 spaces, changing to 4.
(add-hook 'html-mode-hook
  (lambda ()
    (set (make-local-variable 'sgml-basic-offset) 4)))

;; code from prelude
;; note - this should be after volatile-highlights is required
;; add the ability to copy and cut the current line, without marking it
(defadvice kill-ring-save (before smart-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-end-position)))))


(defadvice kill-region (before smart-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; delete the selection with a keypress
(delete-selection-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
