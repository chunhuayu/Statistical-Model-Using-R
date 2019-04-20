### calculate Zscores for each coefficients
> z.coef=w$coefficients/w$standard.errors
> z.coef
  (Intercept)       nut     alco    smoke     age1      age2
1    3.048858 -3.586785 2.878421 3.352545 2.133945 -3.265338
2    2.793799 -3.120311 1.642784 3.338117 2.452740 -3.485215

### calculate Pvalue
> p = (1 - pnorm(abs(z.coef), 0, 1)) * 2
> p
  (Intercept)          nut        alco        smoke       age1         age2
1 0.002297128 0.0003347796 0.003996709 0.0008007233 0.03284730 0.0010933347
2 0.005209293 0.0018066021 0.100427659 0.0008434830 0.01417726 0.0004917417

### Conclusion:
