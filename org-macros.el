;; This is all the macros I've created, I think, which are necessary to
;; compile this project to HTML. Just run `foo` or `comp-sci` or whatever,
;; to produce the HTML in the ./docs/ directory.
(require 'use-package)
(use-package org
  :config
  (require 'org-tempo)
  (require 'org-id)

  ;; tempo custom environment shortcuts
  (setq org-structure-template-alist '(("a" . "export ascii")
                                       ("c" . "center")
                                       ("C" . "comment")
                                       ("e" . "example")
                                       ("E" . "export")
                                       ("h" . "export html")
                                       ("l" . "export latex")
                                       ("q" . "quote")
                                       ("s" . "src")
                                       ("v" . "verse")
                                       ("rmk" . "remark")
                                       ("cor" . "corollary")
                                       ("thm" . "theorem")
                                       ("prop" . "proposition")
                                       ("lem" . "lemma")
                                       ("pz" . "puzzle")
                                       ("xca" . "exercise")
                                       ("ex" . "math-example")
                                       ("eg" . "math-example")
                                       ("d" . "definition")
                                       ("dan" . "danger")
                                       ("pf" . "proof")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((scheme . nil)
     (emacs-lisp . t)
     (haskell . nil)
     (lisp . nil)
     (sml . nil)
     (C . nil)))

  (setq org-html-htmlize-output-type 'css)
  (setq org-html-htmlize-font-prefix "org-")
  (setq org-src-preserve-indentation t)
  (setq org-src-fontify-natively t)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  )
(use-package haskell-mode)
(use-package sml-mode)
;;(use-package ob-sml)
;; (require 'ob-sml nil 'noerror)
(use-package htmlize) ;; apparently needed to export CSS syntax highlighting

;; https://writequit.org/articles/emacs-org-mode-generate-ids.html
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

(defun eos/org-custom-id-get (&optional pom create prefix)
  "Get the CUSTOM_ID property of the entry at point-or-marker POM.
   If POM is nil, refer to the entry at point. If the entry does
   not have an CUSTOM_ID, the function returns nil. However, when
   CREATE is non nil, create a CUSTOM_ID if none is present
   already. PREFIX will be passed through to `org-id-new'. In any
   case, the CUSTOM_ID of the entry is returned."
  (interactive)
  (org-with-point-at pom
    (let ((id (org-entry-get nil "CUSTOM_ID")))
      (cond
       ((and id (stringp id) (string-match "\\S-" id))
        id)
       (create
        (setq id (org-id-new (concat prefix "h")))
        (org-entry-put pom "CUSTOM_ID" id)
        (org-id-add-location id (buffer-file-name (buffer-base-buffer)))
        id)))))

(defun eos/org-add-ids-to-headlines-in-file ()
  "Add CUSTOM_ID properties to all headlines in the
   current file which do not already have one."
  (interactive)
  (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))

;; automatically add ids to saved org-mode headlines
(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      (lambda ()
                        (when (and (eq major-mode 'org-mode)
                                   (eq buffer-read-only nil))
                          (eos/org-add-ids-to-headlines-in-file))))))

(defun org-id-new (&optional prefix)
  "Create a new globally unique ID.

An ID consists of two parts separated by a colon:
- a prefix
- a unique part that will be created according to `org-id-method'.

PREFIX can specify the prefix, the default is given by the variable
`org-id-prefix'.  However, if PREFIX is the symbol `none', don't use any
prefix even if `org-id-prefix' specifies one.

So a typical ID could look like \"Org-4nd91V40HI\"."
  (let* ((prefix (if (eq prefix 'none)
                     ""
                   (concat (or prefix org-id-prefix) "-")))
         unique)
    (if (equal prefix "-") (setq prefix ""))
    (cond
     ((memq org-id-method '(uuidgen uuid))
      (setq unique (org-trim (shell-command-to-string org-id-uuid-program)))
      (unless (org-uuidgen-p unique)
        (setq unique (org-id-uuid))))
     ((eq org-id-method 'org)
      (let* ((etime (org-reverse-string (org-id-time-to-b36)))
             (postfix (if org-id-include-domain
                          (progn
                            (require 'message)
                            (concat "@" (message-make-fqdn))))))
        (setq unique (concat etime postfix))))
     (t (error "Invalid `org-id-method'")))
    (concat prefix unique)))


;; do not indent text to headline
(setq org-adapt-indentation nil)

(setq org-confirm-babel-evaluate nil) ; don't ask for confirmation before evaluating a code block
(setq org-export-babel-evaluate t)
(setq org-export-use-babel t)

(add-hook 'org-mode-hook (lambda ()
                           (setq require-final-newline nil)
                           (setq mode-require-final-newline nil)))
(setq require-final-newline nil)
(setq mode-require-final-newline nil)
(setq org-startup-folded 'overview)

;; window-system

(defvar alex.org/notes-base-dir
  (if (eq 'w32 window-system)
      "d:/src/org-notes/"
    "~/src/org-notes/")) ;; default

(require 'ox-publish)
(setq org-publish-project-alist '())

(defun make-org-project (name base-dir-relpath publish-dir-relpath)
  (let ((base-dir (concat alex.org/notes-base-dir base-dir-relpath))
        (publish-dir (concat alex.org/notes-base-dir publish-dir-relpath)))
    `(,name
      :base-directory ,base-dir
      :base-extension "org"
      :publishing-directory ,publish-dir
      :recursive t
      :publishing-function org-html-publish-to-html
      :exclude "\\(docs\\|ignore\\)/")))

(setq org-publish-project-alist
      (list (make-org-project "all-notes" "" "docs/")
            (make-org-project "comp-sci-notes" "comp-sci/" "docs/comp-sci/")
            (make-org-project "math-notes" "math/" "docs/math/")
            (make-org-project "physics-notes" "physics/" "docs/physics/")))

(add-to-list 'org-publish-project-alist
        `("org-css"
        :base-directory ,alex.org/notes-base-dir
        :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        :publishing-directory ,(concat alex.org/notes-base-dir "docs/")
        :recursive t
        :exclude "\\(docs\\|ignore\\)/"
        :publishing-function org-publish-attachment))
;; (string-match "\\(html\\)/" "html/css/proof.css")
;; (string-match "(html\\|ignore)" "html/css/proof.css")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'org-publish-project-alist
             '("all" :components ("all-notes" "org-css")))

(eval-after-load "ox-html" (setq org-html-postamble 't))

(setq org-html-postamble 't)
(setq org-html-postamble-format
      '(("en" "<p class=\"postamble\">Last Updated %C.</p>")))

(defun alex/css ()
  (interactive)
  (org-publish-project "org-css" t))

(defun physics (&optional force)
  (interactive)
  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (&rest args) t))
            ((symbol-function 'y-or-no-p) (lambda (&rest args) t)))
    (org-publish-project "physics-notes" force)))

(defun math-notes (&optional force)
  (interactive)
  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (&rest args) t))
            ((symbol-function 'y-or-no-p) (lambda (&rest args) t)))
    (org-publish-project "math-notes" force)))

(defun comp-sci (&optional force)
  (interactive)
  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (&rest args) t))
            ((symbol-function 'y-or-no-p) (lambda (&rest args) t)))
    (org-publish-project "comp-sci-notes" force)))

(defun foo (&optional force)
  (interactive)
  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (&rest args) t))
            ((symbol-function 'y-or-no-p) (lambda (&rest args) t)))
    ;; (org-publish-project "math-notes" t)
    (org-publish-project "all" force)))

(setq org-adapt-indentation nil)

(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%a %b %e %Y>" . "<%FT%T%:z>"))

(defun alex.org/include-org-macros (filename)
  (interactive)
  (insert "#+INCLUDE: ")
  (insert (file-relative-name
           (concat (file-name-as-directory alex.org/notes-base-dir) "org-macros.org")
           (file-name-directory filename)))
  (insert "\n"))

(defun alex.org/html-link-home (filename)
  (interactive)
  (insert "#+HTML_LINK_HOME: ")
  (insert (file-relative-name
           (concat (file-name-as-directory alex.org/notes-base-dir) "index.html")
           (file-name-directory filename)))
  (insert "\n"))

(defun alex.org/css-link (filename)
  (interactive)
  (insert "#+HTML_HEAD_EXTRA: <link rel=\"stylesheet\" type=\"text/css\" href=\"")
  (insert (file-relative-name
           (concat (file-name-as-directory (concat (file-name-as-directory alex.org/notes-base-dir) "css"))
                   "stylesheet.css")
           (file-name-directory filename)))
  (insert "\" />\n"))

(defun alex.org/html-link-up (filename)
  (interactive)
  (if (string-suffix-p "index.org" filename)
      (let ((subject-file (concat (directory-file-name (file-name-directory filename)) ".org"))
            (up-link (concat (directory-file-name (file-name-directory filename)) ".html")))
        (if (file-exists-p subject-file)
            (insert "#+HTML_LINK_UP: "
                    (file-relative-name up-link (file-name-directory filename))
                    "\n")
          (insert "#+HTML_LINK_UP: ../index.html\n")))
    (insert "#+HTML_LINK_UP: ./index.html\n")))

(defun alex.org/headers ()
  (interactive)
  (goto-char 0)
  (insert "#+TITLE: \n")
  (insert "#+AUTHOR: Alex Nelson\n")
  (insert "#+EMAIL: pqnelson@gmail.com\n")
  (insert "#+DATE: " (format-time-string "<%FT%T%:z>") "\n")
  (insert "#+LANGUAGE: en\n")
  (insert "#+OPTIONS: H:5\n")
  (insert "#+HTML_DOCTYPE: html5\n")
  ;; filename starts with alex.org/notes-base-dir
  (when (string-prefix-p (expand-file-name alex.org/notes-base-dir)
                         (expand-file-name (buffer-file-name)))
    (alex.org/include-org-macros (buffer-file-name))
    (alex.org/html-link-up (buffer-file-name))
    (alex.org/html-link-home (buffer-file-name))
    (alex.org/css-link (buffer-file-name)))
  (insert "# Created " (format-time-string "%A %B %e, %Y at %l:%M%p") "\n\n")
  )



(eval-after-load 'autoinsert
  '(progn
     (push '(org-mode . alex.org/headers) auto-insert-alist)
     (auto-insert-mode +1)))

(require 'autoinsert)

(add-to-list 'org-src-lang-modes '("latex-macros" . latex))

(defvar org-babel-default-header-args:latex-macros
  '((:results . "raw")
    (:exports . "results")))

(defun prefix-all-lines (pre body)
  (with-temp-buffer
    (insert body)
    (string-insert-rectangle (point-min) (point-max) pre)
    (buffer-string)))

(defun org-babel-execute:latex-macros (body _params)
  (concat
   (prefix-all-lines "#+LATEX_HEADER: " body)
   "\n#+HTML_HEAD_EXTRA: <div style=\"display: none\"> \\(\n"
   (prefix-all-lines "#+HTML_HEAD_EXTRA: " body)
   "\n#+HTML_HEAD_EXTRA: \\)</div>\n"))

;; Avoid exporting the time as a comment in HTML files
(setq org-export-time-stamp-file nil)

;; For org-mode 9.6.8, they introduced a mathjax template upgrading
;; Mathjax to version 3...which broke a lot of stuff. This fixes the
;; broken things.
(when (boundp 'org-html-mathjax-template)
  (setq org-html-mathjax-template "<script>
  window.MathJax = {
    loader: {source: { '[tex]/amsCd': '[tex]/amscd',
                       '[tex]/AMScd': '[tex]/amscd'}},
    tex: {
      ams: {
        multlineWidth: '%MULTLINEWIDTH'
      },
      inlineMath: {'[+]': [['$', '$']]},
      tags: '%TAGS',
      tagSide: '%TAGSIDE',
      tagIndent: '%TAGINDENT'
    },
    chtml: {
      scale: %SCALE,
      displayAlign: '%ALIGN',
      displayIndent: '%INDENT'
    },
    svg: {
      scale: %SCALE,
      displayAlign: '%ALIGN',
      displayIndent: '%INDENT'
    },
    output: {
      font: '%FONT',
      displayOverflow: '%OVERFLOW'
    }
  };
</script>

<script  type=\"text/javascript\"
  id=\"MathJax-script\"
  async
  src=\"%PATH\">
</script>"))

;; When possible, use the git commit timestamp as the "Last Updated" date.
;; Defaults to the current time.
(require 'subr-x)

(defun alex.org/html-postamble (plist)
  (let ((result (string-trim (shell-command-to-string (concat "git log -1 --format=%cD " (buffer-file-name))))))
    (concat "<p class=\"postamble\">Last Updated: "
    (if (string-prefix-p "fatal:" result)
        (format-time-string "%a, %d %b %Y %H:%M:%S %z")
      result))))

(setq org-html-postamble 'alex.org/html-postamble)
