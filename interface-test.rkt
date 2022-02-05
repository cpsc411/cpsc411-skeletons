#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  (check-import-list
   "compiler.rkt"
   '(link-paren-x64
     interp-paren-x64
     interp-values-lang
     check-values-lang

     uniquify
     sequentialize-let
     normalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-registers
     replace-locations
     assign-homes-opt
     optimize-predicates
     expose-basic-blocks
     resolve-predicates
     flatten-program
     patch-instructions
     implement-fvars
     generate-x64)))
