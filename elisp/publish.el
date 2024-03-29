;;; publish.el --- Publish reveal.js presentation from Org files on Gitlab Pages
;; -*- Mode: Emacs-Lisp -*-
;; -*- coding: utf-8 -*-

;; Copyright (C) 2017 Jens Lechtenbörger

;;; License: GPLv3

;;; Commentary:
;; Inspired by publish.el by Rasmus:
;; https://gitlab.com/pages/org-mode/blob/master/publish.el


;;; Code:
(package-initialize)
(require 'org)
(require 'ox-publish)

(setq org-export-with-smart-quotes t
      org-confirm-babel-evaluate nil)

(add-to-list 'load-path
	     (expand-file-name
	      "../emacs-reveal/" (file-name-directory load-file-name)))
; (require 'reveal-config)
(require 'org-re-reveal)
(setq org-reveal-root "./reveal.js"
      org-reveal-title-slide nil)

(setq org-publish-project-alist
      (list
       (list "index"
	     :base-directory "."
	     :base-extension "org"
	     :exclude "config\\|license-template"
	     :publishing-function 'org-re-reveal-publish-to-reveal
	     :publishing-directory "./public")
       (list "images"
	     :base-directory "img"
	     :base-extension (regexp-opt '("png" "jpg" "ico" "svg" "gif" "webm"))
	     :publishing-directory "./public/img"
	     :publishing-function 'org-publish-attachment)
       (list "data"
	     :base-directory "data"
	     :base-extension (regexp-opt '("css" "js" "html"))
	     :publishing-directory "./public/data"
	     :publishing-function 'org-publish-attachment)
       (list "audios"
	     :base-directory "audio"
	     :base-extension (regexp-opt '("ogg" "mp3"))
	     :publishing-directory "./public/audio"
	     :publishing-function 'org-publish-attachment)
       (list "reveal-static"
	     :base-directory "emacs-reveal/reveal.js"
	     :exclude "\\.git"
	     :base-extension 'any
	     :publishing-directory "./public/reveal.js"
	     :publishing-function 'org-publish-attachment
	     :recursive t)
       (list "reveal-theme"
	     :base-directory "emacs-reveal/css"
	     :base-extension 'any
	     :publishing-directory "./public/reveal.js/css/theme"
	     :publishing-function 'org-publish-attachment)
       (list "reveal.js-plugins-anything"
	     :base-directory "emacs-reveal/reveal.js-plugins/anything"
	     :base-extension 'any
	     :publishing-directory "./public/reveal.js/plugin/anything"
	     :publishing-function 'org-publish-attachment
	     :recursive t)
       (list "reveal.js-plugins-audio-slideshow"
	     :base-directory "emacs-reveal/reveal.js-plugins/audio-slideshow"
	     :base-extension 'any
	     :publishing-directory "./public/reveal.js/plugin/audio-slideshow"
	     :publishing-function 'org-publish-attachment
	     :recursive t)
       (list "reveal.js-jump-plugin"
	     :base-directory "emacs-reveal/reveal.js-jump-plugin/jump"
	     :base-extension 'any
	     :publishing-directory "./public/reveal.js/plugin/jump"
	     :publishing-function 'org-publish-attachment
	     :recursive t)
       (list "site" :components '("index"))))

(provide 'publish)
;;; publish.el ends here

