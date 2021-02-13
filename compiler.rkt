#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/2c-run-time)

(provide
 link-paren-x64
 interp-paren-x64
 interp-values-lang

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
 optimize-predicates
 expose-basic-blocks
 resolve-predicates
 flatten-program
 patch-instructions
 implement-fvars
 generate-x64)

;; TODO: Fill in.
;; You'll want to merge milestone-3 code in

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/langs/a4
   cpsc411/test-suite/public/a4)

  ;; You can modify this pass list, e.g., by adding check-assignment, or other
  ;; debugging and validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  (current-pass-list
   (list
    ;check-values-lang
    uniquify
    sequentialize-let
    canonicalize-bind
    select-instructions
    assign-homes-opt
    optimize-predicates
    expose-basic-blocks
    resolve-predicates
    flatten-program
    patch-instructions
    implement-fvars
    ;check-paren-x64
    generate-x64
    wrap-x64-run-time
    wrap-x64-boilerplate))

  (run-tests
   (a4-public-test-suite
    (current-pass-list)
    link-paren-x64
    interp-paren-x64
    interp-values-lang

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
    optimize-predicates
    expose-basic-blocks
    resolve-predicates
    flatten-program
    patch-instructions
    implement-fvars
    generate-x64
    wrap-x64-run-time
    wrap-x64-boilerplate)))
