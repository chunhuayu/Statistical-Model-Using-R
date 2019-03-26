PROC IMPORT OUT=provider DATAFILE="H:\Active Clients\Hayburn, Anna\Survey Data.xlsx"
            DBMS=xlsx REPLACE;
			GETNAMES=YES;
SHEET="Sheet1";
run;

proc print data=provider (obs=5);
title "Survey Data";
run;

*ods rtf file="H:\Active Clients\Hayburn, Anna\MH4 Results.doc" style=journal;

/*---------------------------------
 *
 *       Linear Regression
 *
 *--------------------------------*/

proc reg data=provider plots=all;
title "Full model";
  model MH4 = MH1 MH2 MH3 / vif;
run;
proc reg data=provider plots=all;
title "Simple Linear Regression";
title2 "MH1";
model MH4 = MH1;
run;

proc reg data=provider plots=all;
title2 "MH2";
model MH4 = MH2;
run;

proc reg data=provider plots=all;
title2 "MH3";
model MH4 = MH3;
run;
*ods rtf close;

* Interaction Models;
proc glm data=provider plots=all;
title "Full Model";
model MH4 = MH1|MH2|MH3 / solution;
run;
proc glm data=provider plots=all;
title "No Three-way Interaction";
model MH4 = MH1|MH2|MH3 @2/ solution;
run;
proc glm data=provider plots=all;
title "Only MHI1*MH2 Interaction";
model MH4 = MH1 MH2 MH3 MH1*MH2;
run;



/*---------------------------------
 *
 *   Correlations and Descriptive
 *           Statistics
 *
 *--------------------------------*/

proc means data=provider;
title "Descriptive Statistics";
  var MH4 MH1 MH2 MH1;
run;
proc corr data=provider spearman;
title "Spearman Correlations";
 var MH4 MH1 MH2 MH3;
run;
proc sgscatter data=provider;
title "Scatterplots";
matrix MH4 MH1 MH2 MH3;
run;
proc univariate data=provider;
title "Descriptive Statistics";
var MH4 MH1 MH2 MH3;
histogram;
run;


/*---------------------------------
 *
 *    Ordinal and Multinomial
 *      Logistic Regression
 *
 *--------------------------------*/

proc logistic data=provider;
title "Ordinal Logistic Regression";
model MH4 = MH1 MH2 MH3;
run;
* proportional odd assumption violated;

proc logistic data=provider;
title "Multinomial Logistic Regression";
model MH4 = MH1 MH2 MH3 / link=glogit;
run;
* quasi-complete separation, can't interpret results;


/*---------------------------
 *
 *   Box-Cox Transformation
 *
 *---------------------------*/

proc transreg data = provider;
	model boxcox(MH4 / lambda=-4 to 4 by 0.25)=identity(MH1 MH2 MH3);
run;

data provider;
	set provider;
new_MH4 = MH4**2.25;
run;
proc reg data=provider plots=all;
title "Transformed Response";
  model new_MH4 = MH1 MH2 MH3/ vif;
run;


/*----------------------------------
 * 
 *        Sandwich Estimators
 *  (control for heteroskedasticity
 *
 *----------------------------------*/


proc reg data=provider;
title "Method 0";
  model MH4 = MH1 MH2 MH3 /  hccmethod=0 acov;
run;

proc reg data=provider;
title "Method 1";
  model MH4 = MH1 MH2 MH3 /  hccmethod=1 acov;
run;

proc reg data=provider;
title "Method 2";
  model MH4 = MH1 MH2 MH3 /  hccmethod=2 white;
run;

proc reg data=provider;
title "Method 3";
  model MH4 = MH1 MH2 MH3 /  acov hccmethod=3;
run;

