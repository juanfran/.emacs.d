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
    highlight-chars
    ido-ubiquitous
    groovy-mode
    less-css-mode
    jade-mode
    php-mode
    yasnippet
    helm
    helm-c-yasnippet
    web-mode
    dired+
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
