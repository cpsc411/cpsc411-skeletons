#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/ptr-run-time)

(provide
 check-exprs-lang
 uniquify
 implement-safe-primops
 specify-representation
 remove-complex-opera*
 sequentialize-let
 impose-calling-conventions
 canonicalize-bind
 select-instructions
 expose-allocation-pointer
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-call-undead-variables
 allocate-frames
 assign-registers
 assign-frame-variables
 replace-locations
 optimize-predicates
 implement-fvars
 expose-basic-blocks
 resolve-predicates
 flatten-program
 patch-instructions
 implement-mops
 generate-x64)

;; TODO: Fill in.
;; You'll want to merge milestone-7 code in

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/test-suite/utils
   cpsc411/test-suite/public/a8
   #;errortrace)

  ;; You can modify this pass list, e.g., by adding other
  ;; optimization, debugging, or validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  ;; If you do replace modify this list, be sure to replace the function's
  ;; counterpart in the arguments for a7-public-test-suite, as it may rely on
  ;; pointer equality between functions to navigate the current-pass-list.
  (current-pass-list
   (list
    check-exprs-lang
    uniquify
    implement-safe-primops
    specify-representation
    remove-complex-opera*
    sequentialize-let
    impose-calling-conventions
    canonicalize-bind
    select-instructions
    expose-allocation-pointer
    uncover-locals
    undead-analysis
    conflict-analysis
    assign-call-undead-variables
    allocate-frames
    assign-registers
    assign-frame-variables
    replace-locations
    optimize-predicates
    implement-fvars
    expose-basic-blocks
    resolve-predicates
    flatten-program
    patch-instructions
    implement-mops
    generate-x64
    wrap-x64-boilerplate
    wrap-x64-run-time))

  ;; Toggle to #f to enable fragile tests
  (parameterize ([current-enable-grading #t])
    (run-tests
     (a8-public-test-suite
      (current-pass-list)

      check-exprs-lang
      uniquify
      implement-safe-primops
      specify-representation
      remove-complex-opera*
      sequentialize-let
      impose-calling-conventions
      canonicalize-bind
      select-instructions
      expose-allocation-pointer
      uncover-locals
      undead-analysis
      conflict-analysis
      assign-call-undead-variables
      allocate-frames
      assign-registers
      assign-frame-variables
      replace-locations
      optimize-predicates
      implement-fvars
      expose-basic-blocks
      resolve-predicates
      flatten-program
      patch-instructions
      implement-mops
      generate-x64))))
