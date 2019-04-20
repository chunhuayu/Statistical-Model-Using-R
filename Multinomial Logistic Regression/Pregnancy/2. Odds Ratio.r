### calculate the odds ratio
> odds.ratio= exp(w$coefficients)
> odds.ratio
#  (Intercept)       nut     alco     smoke     age1      age2
# 1   1270.9929 0.9366729 7.713553 11.616934 3.614005 0.1878190
# 2    259.4585 0.9546141 2.906754  9.304833 3.717854 0.2018217

### calculate 95% confident interval for the odds ratio
> exp(ci.w.coef)
# , , 1

#                  2.5 %       97.5 %
# (Intercept) 12.84219201 1.257903e+05
# nut          0.90377953 9.707635e-01
# alco         1.91914793 3.100277e+01
# smoke        2.76960553 4.872649e+01
# age1         1.11043436 1.176209e+01
# age2         0.06883571 5.124660e-01

# , , 2

#                  2.5 %       97.5 %
# (Intercept) 5.25412624 1.281255e+04
# nut         0.92716508 9.828757e-01
# alco        0.81381849 1.038219e+01
# smoke       2.51150822 3.447328e+01
# age1        1.30189692 1.061716e+01
# age2        0.08205514 4.963977e-01

> levels(y)
[1] "1" "2" "3"
> levels(age.f)
[1] "1" "2" "3"
