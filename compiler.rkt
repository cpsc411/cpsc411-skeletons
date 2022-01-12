#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/2c-run-time)

(provide
 check-values-lang
 uniquify
 sequentialize-let
 impose-calling-conventions
 normalize-bind
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
 link-paren-x64)

;; TODO: Fill in.
;; You'll want to merge milestone-4 code in

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/test-suite/utils
   cpsc411/test-suite/public/a5
   errortrace)

  ;; You can modify this pass list, e.g., by adding other
  ;; optimization, debugging, or validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  (current-pass-list
   (list
    check-values-lang
    uniquify
    sequentialize-let
    impose-calling-conventions
    normalize-bind
    select-instructions
    ;uncover-locals
    ;undead-analysis
    ;conflict-analysis
    ;assign-registers
    ;replace-locations
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

  ;; Toggle to #f to enable fragile tests
  (parameterize ([current-enable-grading #t])
    (run-tests
     (a5-public-test-suite
      (current-pass-list)

      link-paren-x64
      interp-paren-x64

      check-values-lang
      uniquify
      sequentialize-let
      impose-calling-conventions
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
      generate-x64))))
