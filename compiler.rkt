#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/2c-run-time)

(provide
 interp-paren-x64
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
 compile-a3)

;; TODO: Fill in.
;; You might want to reuse check-paren-x64 and generate-x64 from milestone-1

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/test-suite/public/a3)

  ;; You can modify this pass list, e.g., by adding check-assignment, or other
  ;; debugging and validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  (current-pass-list
   (list
    check-values-lang
    uniquify
    sequentialize-let
    canonicalize-bind
    select-instructions
    assign-homes-opt
    flatten-begins
    patch-instructions
    implement-fvars
    check-paren-x64
    generate-x64
    wrap-x64-run-time
    wrap-x64-boilerplate))

  (run-tests
   (a3-public-test-suite
    (current-pass-list)
    interp-paren-x64
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
    wrap-x64-run-time
    wrap-x64-boilerplate)))
