(setq display-line-numbers-type 'relative)
(setq highlight-indent-guides-method 'fill)
(setq highlight-indent-guides-responsive 'stack)
(setq highlight-indent-guides-auto-enabled t)

(add-hook! 'org-mode-hook #'flyspell-mode)

(after! ispell
  (setq ispell-program-name "aspell"
        ispell-dictionary "it"))

;(setq flyspell-delay 0.3)

(setq doom-theme 'doom-gruvbox)

;;(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 17)
      doom-big-font (font-spec :family "JetBrains Mono" :size 18))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

(set-fontset-font t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend)

 (custom-set-faces!
    '(font-lock-comment-face :slant italic)
    '(font-lock-keyword-face :slant italic)

    '(bold :height 1.05 :weight bold)

    ;; Org Headers
    '(org-level-1 :inherit outline-1 :height 1.55 :weight extra-bold :foreground "#83a598")
    '(org-level-2 :inherit outline-2 :height 1.50 :weight extra-bold :foreground "#d3869b")
    '(org-level-3 :inherit outline-3 :height 1.45 :weight bold       :foreground "#b8bb26")
    '(org-level-4 :inherit outline-4 :height 1.40 :weight bold       :foreground "#fabd2f")
    '(org-level-5 :inherit outline-5 :height 1.35 :weight semi-bold  :foreground "#458588")
    '(org-level-6 :inherit outline-6 :height 1.30 :weight semi-bold  :foreground "#b16286")
    '(org-level-7 :inherit outline-7 :height 1.25 :weight medium     :foreground "#98971a")
    '(org-level-8 :inherit outline-8 :height 1.20 :weight medium     :foreground "#d79921")

    '(org-table :height 1.10 :foreground "#8ec07c")

    ;; Code inline
    '(org-code :family "Fira Code" :height 1.0 :foreground "#fe8019" :background "#282828")
    '(markdown-inline-code-face :family "Fira Code" :height 1.0 :foreground "#fe8019")

    ;; Code block
    ;;'(org-block :family "Fira Code" :height 1.10)
    ;;'(markdown-code-face :family "Fira Code" :height 1.10)
    ))

;;(use-package all-the-icons :if (display-graphic-p))

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)

(setq org-directory "~/documents/org-documents")

(after! org

  (add-hook 'org-mode-hook #'org-modern-mode)

  (setq org-hide-emphasis-markers t
        org-insert-heading-respect-content t
        org-modern-star 'inherit
        org-modern-list '((43 . "➤") (45 . "–") (42 . "•"))
        )

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t)
     (latex . t)))

  (setq org-babel-python-command "python3"
        org-confirm-babel-evaluate nil
        org-startup-with-latex-preview t
        org-preview-latex-default-process 'dvisvgm
        org-format-latex-options (plist-put org-format-latex-options :scale 1)
        org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml)))

(defun my/org-roam-title-to-slug (title)
  "Convert title to kebab-case for Org-roam filenames."
  (when title
    (let ((slug (downcase (replace-regexp-in-string "[^[:alnum:] ]" "" title)))) ; Rimuove caratteri speciali
      (replace-regexp-in-string " +" "-" slug)))) ; Sostituisce spazi con trattini
(setq org-roam-directory "~/documents/my-second-brain")
;;(setq org-roam-capture-templates t)
(setq org-roam-capture-templates
      '(("d" "default" plain
        "%?"
        ;:if-new (file+head "${slug}.org" "#+title: ${title}\n")
        :if-new (file+head
                  "%(my/org-roam-title-to-slug \"${title}\").org"  ;; Usa la funzione con espansione
                  "#+title: ${title}\n")
        :unnarrowed t)
        ("n" "notes" plain (file "~/documents/my-second-brain/.templates/")
         :if-new (file+head "${slug}.org" "#+title: ${title}\n#+date: %U\n#+filetags:")
         :unnarrowed t)))
(map! :leader
      (:prefix ("n r" . "org-roam")
       :desc "Completion at point" "c" #'completion-at-point
       :desc "Find node"           "f" #'org-roam-node-find
       :desc "Show graph"          "g" #'org-roam-graph
       :desc "Insert node"         "i" #'org-roam-node-insert
       :desc "Capture to node"     "n" #'org-roam-capture
       :desc "Toggle roam buffer"  "r" #'org-roam-buffer-toggle))
