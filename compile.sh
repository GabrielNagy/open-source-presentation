#!/bin/bash
rm -rf ~/org-timestamps
emacs --batch --load elisp/publish.el --funcall org-publish-all

