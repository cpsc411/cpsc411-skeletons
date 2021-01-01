#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/2c-run-time)

(provide
 uniquify
 sequentialize-let
 canonicalize-bind
 select-instructions
 uncover-locals
 assign-fvars
 replace-locations
 assign-homes
 flatten-begins
 patch-instructions
 implement-fvars
 check-paren-x64
 generate-x64)

;; TODO: Fill in.
;; You might want to reuse check-paren-x64 and generate-x64 from milestone-1

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/test-suite/public/a2)

  (run-tests
   (a2-public-test-suite
    (list
     uniquify
     sequentialize-let
     canonicalize-bind
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
     wrap-x64-run-time
     wrap-x64-boilerplate))))
