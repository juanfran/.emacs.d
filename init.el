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

;; dired+
(require 'dired+)
(require 'dired)

(define-key dired-mode-map "|" 'dired-create-file)

(defun dired-create-file (filename)
  "Create FILENAME from Dired in if not exists.
If FILENAME already exists do nothing."
  (interactive "FCreate file: ")
  (shell-command (format "touch %s" filename))
  (when (file-exists-p filename)
    (dired-add-file filename)
    (dired-move-to-filename)))

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

;; Wind Move
(windmove-default-keybindings)

;; Disable auto-save
;;(setq auto-save-default nil)

;; Auto-save files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Backup files
;;(setq make-backup-files nil)
(setq backup-directory-alist
      `(("." . "~/.emacs_saves")))

;; Disable lockfiles
;;(setq create-lockfiles nil)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Open next line
(global-set-key (kbd "C-o") 'open-next-line)

;; Maximize buffer
(global-set-key (kbd "C-c f") 'toggle-maximize-buffer)

;; Indentation
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default sgml-basic-offset 4)
(setq-default nxml-child-indent tab-width)
(setq-default nxml-outline-child-indent tab-width)

;; Default indentation is usually 2 spaces, changing to 4.
(setq web-mode-markup-indent-offset 4)

;; Display full path in the title bar
(setq-default frame-title-format "%f")

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

;; groovy
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.gsp\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

;; sass
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;;yasnippet
(yas-global-mode 1)
(global-set-key (kbd "C-x y") 'helm-yas-complete)
(setq yas/root-directory "~/emacs/snippets")
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

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
