#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  (check-import-list
   "compiler.rkt"
   '(check-values-lang
     uniquify
     sequentialize-let
     impose-calling-conventions
     canonicalize-bind
     select-instructions
     assign-homes-opt
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-registers
     replace-locations
     optimize-predicates
     expose-basic-blocks
     resolve-predicates
     flatten-program
     patch-instructions
     implement-fvars

     generate-x64

     interp-paren-x64
     link-paren-x64)))
