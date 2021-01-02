#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  (check-import-list
   "compiler.rkt"
   '(check-paren-x64
     interp-paren-x64
     generate-x64
     wrap-x64-run-time
     wrap-x64-boilerplate)))
