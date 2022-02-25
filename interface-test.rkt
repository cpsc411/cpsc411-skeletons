#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  (check-import-list
   "compiler.rkt"
   '(uniquify
     sequentialize-let
     impose-calling-conventions
     normalize-bind
     select-instructions
     uncover-locals
     undead-analysis
     conflict-analysis
     assign-call-undead-variables
     allocate-frames
     assign-registers
     replace-locations
     assign-frame-variables
     implement-fvars
     optimize-predicates
     expose-basic-blocks
     resolve-predicates
     flatten-program
     patch-instructions

     generate-x64)))
