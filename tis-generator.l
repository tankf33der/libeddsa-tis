# PicoLisp tis.config file generator
(de prn (F M)
   (prinl "{")
   (printsp "name" ': (pack F " - " M))
   (prinl ",")
   (printsp "files" ': "all")
   (prinl ",")
   (printsp "machdep" ': (text M))
   (prinl ",")
   (printsp "raw_options" ':)
   (prin "{ ")
   (printsp "-val-timeout" ': 10800)
   (prin ", ")
   (printsp "-no-results" ': "true")
   (prinl "} ,")
   (printsp "main" ': (text F))
   (prinl)
   (prinl "}") )
(setq
   *M
   (quote
      gcc_sparc_64 gcc_sparc_32
      gcc_x86_32 gcc_x86_16 gcc_x86_64
   )
   *F
   (quote
      sign_check sha512
   )
   *L
   (make
      (for F *F
         (for M *M
            (link (cons F M)) ) ) ) )
(out "tis.config"
   (prinl "// Auto genetated file")
   (prinl "[")
   (for (L *L L (cdr L))
      (let (F (caar L)  M (cdar L))
         (prn F M)
         (and (cdr L) (prinl ",")) ) )
   (prinl "]") )
(bye)
