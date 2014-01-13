(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar my-packages
  '(
    zenburn-theme
    auto-complete
    undo-tree
    smex
    projectile
    ace-jump-mode
    rainbow-delimiters
    anzu
    expand-region
    move-text
    rainbow-mode
    volatile-highlights
    smartparens
    bookmark+
    bm
    whitespace-cleanup-mode
    highlight-chars
    ido-ubiquitous
    ))

(defun has-package-not-installed ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))

(defun install-packages()
  "install package list"
  (when (has-package-not-installed)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)

    (dolist (p my-packages)
      (when (not (package-installed-p p))
        (package-install p)))))

(install-packages)
