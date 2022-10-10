((magit-commit
  ("--all"))
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-log
  ("-n256" "--decorate")
  (("--" "twenty-fourty-eight.el")
   "--graph" "--color"))
 (magit-pull nil
             ("--ff-only"))
 (magit-push nil))
