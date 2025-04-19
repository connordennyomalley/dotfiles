;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; --------------------
;; Nano Emacs!
;;
;; Remember to install the fonts mentioned in the nano-emacs readme
(straight-use-package
  '(nano :type git :host github :repo "rougier/nano-emacs"))

;; Default layout (optional)
(require 'nano-layout)

;; Theme
(require 'nano-faces)
(require 'nano-theme)
(require 'nano-theme-dark)
(require 'nano-theme-light)

(nano-theme-set-dark)
(call-interactively 'nano-refresh-theme)

;; Nano default settings (optional)
(require 'nano-defaults)

;; Nano session saving (optional)
(require 'nano-session)

;; Nano header & mode lines (optional)
(require 'nano-modeline)

;; Nano key bindings modification (optional)
(require 'nano-bindings)

;; Nano counsel configuration (optional)
;; Needs "counsel" package to be installed (M-x: package-install)
;; (require 'nano-counsel)

;; Splash (optional)
(require 'nano-splash)

;; Help (optional)
(require 'nano-help)
;; --------------------


;; --------------------
;; Which Key!
(which-key-mode 1)
;; --------------------

;; --------------------
;; Evil!
(straight-use-package 'evil)
(require 'evil)
(evil-mode 1)
(evil-set-leader 'normal (kbd "<SPC>"))
;; --------------------

;; --------------------
;; Emacs options
(add-to-list 'default-frame-alist '(undecorated-round . t))
;; --------------------


;; --------------------
;; Org Mode Options
(setq org-directory "~/Developer/notes")
(setq org-agenda-files (list "inbox.org"))
(setq org-capture-templates
       `(("i" "Inbox" entry  (file "inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U"))))

(evil-define-key 'normal 'global (kbd "<leader>oa") 'org-agenda)

(defun org-capture-inbox ()
     (interactive)
     (call-interactively 'org-store-link)
     (org-capture nil "i"))
(evil-define-key 'normal 'global (kbd "<leader>oci") 'org-capture-inbox)
(evil-define-key 'normal 'global (kbd "<leader>occ") 'org-capture)
;; --------------------
