#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  (check-import-list
   "compiler.rkt"
   '(interp-paren-x64
     check-paren-x64
     interp-values-lang

     check-values-lang
     uniquify
     sequentialize-let
     canonicalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-registers
     replace-locations
     assign-homes-opt
     assign-homes
     flatten-begins
     patch-instructions
     implement-fvars
     generate-x64

     compile-a2
     compile-a3)))
