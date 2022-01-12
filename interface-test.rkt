#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  (check-import-list
   "compiler.rkt"
   '(check-values-lang
     uniquify
     sequentialize-let
     normalize-bind
     select-instructions
     uncover-locals
     assign-fvars
     replace-locations
     assign-homes
     flatten-begins
     patch-instructions
     implement-fvars
     check-paren-x64
     generate-x64

     interp-values-lang
     interp-paren-x64)))
