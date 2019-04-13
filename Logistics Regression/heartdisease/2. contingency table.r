#  Create a contingency table between all of the boolean and categorical variables that we are using to predict heart disease
> xtabs(~hd+sex,data=data)
           sex
hd            F   M
  healthy    71  89
  unhealthy  25 112
> xtabs(~hd+cp,data=data)
           cp
hd            1   2   3   4
  healthy    16  40  65  39
  unhealthy   7   9  18 103
> xtabs(~hd+fbs,data = data)
           fbs
hd            0   1
  healthy   137  23
  unhealthy 117  20
> xtabs(~hd+resteg,data = data)
Error in eval(predvars, data, env) : object 'resteg' not found
> xtabs(~hd+restecg,data = data)
           restecg
hd           0  1  2
  healthy   92  1 67
  unhealthy 55  3 79
> # in the aboving table, only 4 patients represent level 1, this could potentially get in the way of finding the best fitting line. however, for now we'll just leave it in and see what happens
> xtabs(~hd+exang)
Error in eval(predvars, data, env) : object 'hd' not found
> xtabs(~hd+exang,data = data)
           exang
hd            0   1
  healthy   137  23
  unhealthy  63  74
> xtabs(~hd+slope,data = data)
           slope
hd            1   2   3
  healthy   103  48   9
  unhealthy  36  89  12
> xtabs(~hd+ca,data = data)
           ca
hd            2   3   4   5
  healthy   129  21   7   3
  unhealthy  45  44  31  17
> xtabs(~hd+thal,data = data)
           thal
hd            2   3   4
  healthy   127   6  27
  unhealthy  37  12  88
