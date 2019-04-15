# Analysis the response given temperature =31F, and the standard error.

> pre.ci=predict.glm(spacelog,data.frame(temp=31),se.fit=TRUE,type="response")
> pre.ci
$fit
        1 
0.9996088 

$se.fit
          1 
0.001580137 

$residual.scale
[1] 1
