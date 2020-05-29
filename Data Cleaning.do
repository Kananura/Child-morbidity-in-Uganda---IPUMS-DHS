

use "C:\Users\Kananura Rornald\Dropbox\PhD Paper 3\IPUM DHS data\Data.dta", clear

keep if kidalive==1 /* keeping only those that are alive */ 


g Diarh_prev= diarrecent==23

keep  if kidliveswith==10 



g Fever=fevrecent==21


g ARI1=coushortbre==1 


g ARI2=couchestprob==1 | couchestprob==3 


g ARI=ARI1==1 & ARI2==1 

g Partner= marstat== 21 | marstat==22
replace Partner=0 if  marstat==98 

g Occup=0
replace Occup=0 if wkcurrjob==0
replace Occup=1 if wkcurrjob>=10 & wkcurrjob<=22
replace Occup=2 if wkcurrjob>=30 & wkcurrjob<=32
replace Occup=3 if wkcurrjob>=40 & wkcurrjob<=42
replace Occup=4 if wkcurrjob>=50 & wkcurrjob<=52
replace Occup=4 if wkcurrjob==60
replace Occup=4 if wkcurrjob==96 
replace Occup=0 if wkcurrjob==97


g Wall_structures=0
replace Wall_structures=0 if wall>=0 & wall<=132
replace Wall_structures=1 if wall>=200 & wall<=292
replace Wall_structures=1 if wall>=300 & wall<=400 


g Floor_struc=0
replace Floor_struc=0 if floor>=100 & floor<=123
replace Floor_struc=1 if floor>=200 & floor<300
replace Floor_struc=1 if floor>=300 & floor<=400 


g Roof_struc=0
labelbook roof_lbl
replace Roof_struc=0 if roof>=0 & roof<200
replace Roof_struc=1 if roof>=200 & roof<300
replace Roof_struc=1 if roof>=300 & roof<=400 

replace electrc=0 if electrc==6 | electrc==8 


g Cook_fuel=0
replace Cook_fuel=1 if cookfuel>=100 & cookfuel<230
replace Cook_fuel=1 if cookfuel>230 & cookfuel<500
replace Cook_fuel=2 if cookfuel>=500 & cookfuel<800
replace Cook_fuel=1 if cookfuel>=800 & cookfuel<900
replace Cook_fuel=1 if cookfuel>=800 & cookfuel<900
replace Cook_fuel=3 if cookfuel==520 

replace  kitchen=0 if kitchen==8 | kitchen==9 


g Cooking_Place=0
replace Cooking_Place=0 if cookwhere==1
replace Cooking_Place=1 if cookwhere==2 | cookwhere==3 | cookwhere==4 

g Toilet_shared=0
replace Toilet_shared=0 if toiletshareyn==0
replace Toilet_shared=1 if toiletshareyn==1 


g Treat_water=0
replace Treat_water=1 if treatwtryn==1
replace Treat_water=0 if treatwtryn==0 


g Radio=0
replace  Radio=1 if radiohh==1
replace  Radio=0 if radiohh==0 

g TV=0
replace TV=1 if tvhh==1
replace TV=0 if tvhh==0 

g hhmemberPersleeprooms=hhmemtotal/sleeprooms 


gen int Interview_date = ym(intyear, monthint)
format Interview_date %tm 

g birth_date=ym(kidbirthyr, kidbirthmo)

format birth_date %tm 

g child_age_Month= Interview_date- birth_date 

g Rota1= vacrota1==22 | vacrota1==23 | vacrota1==24
g Rota2= vacrota2==22 | vacrota2==23 | vacrota2==24
g Rota_all=Rota1==1 | Rota2==2

replace  hheadsex=0 if hheadsex==1 
replace  hheadsex=1 if hheadsex==2 

replace  kidsex=0 if kidsex==1 
replace  kidsex=1 if kidsex==2 

replace urban=0 if urban==2 

replace motorcycl=0 if motorcycl==8 
replace carhh=0 if carhh==8  

replace chicknum=0 if chicknum==96 | chicknum==97 | chicknum==98 | chicknum==99

replace pignum=0 if pignum==96 | pignum==97 | pignum==98 | pignum==99 

 replace goatnum=0   if goatnum==96 | goatnum==97 | goatnum==98 | goatnum==99 
 
 replace exoticctnum=0   if exoticctnum==96 | exoticctnum==97 | exoticctnum==98 | exoticctnum==99 
 
 replace cattlenum=0 if cattlenum==96 | cattlenum==97 | cattlenum==98 | cattlenum==99
 
 g Numberold= hhmemtotal- hhkidlt5
 
 g WeightMiss=hwweight==9994 | hwweight==9995 | hwweight==9996 | hwweight==9997 | hwweight==9998 | hwweight==9999
 
 g Height_miss=hwheight==9994 | hwheight==9995 | hwheight==9996 | hwheight==9997 | hwheight==9998 | hwheight==9999
 
 g Chil_measured= hwwhynotmeas==10
 
 g H4age=hwhazwho<-200
replace  H4age=. if hwhazwho==9995 | hwhazwho==9996 | hwhazwho==9997 | hwhazwho==9998 | hwhazwho==9999

replace H4age=. if WeightMiss==1 | Height_miss==1 | Chil_measured==0 

 g W4height=hwwhzwho<=-200 
 replace  W4height=. if hwwhzwho==9995 | hwwhzwho==9996 | hwwhzwho==9997 | hwwhzwho==9998 | hwwhzwho==9999
 
 replace W4height=. if WeightMiss==1 | Height_miss==1 | Chil_measured==0 
 
 g Overweightight=hwwhzwho>300 
 replace  Overweightight=. if hwwhzwho==9995 | hwwhzwho==9996 | hwwhzwho==9997 | Overweightight==9998 | hwwhzwho==9999
 
  replace Overweightight=. if WeightMiss==1 | Height_miss==1 | Chil_measured==0 
 
 g W4age=hwwazwho<-200
 replace  W4age=. if hwwazwho==9995 | hwwazwho==9996 | hwwazwho==9997 | hwwazwho==9998 | hwwazwho==9999
 
   replace W4age=. if WeightMiss==1 | Height_miss==1 | Chil_measured==0 
 
 g overweight4age=hwwazwho>300
 replace  overweight4age=. if hwwazwho==9995 | hwwazwho==9996 | hwwazwho==9997 | hwwazwho==9998 | hwwazwho==9999
 
  replace overweight4age=. if WeightMiss==1 | Height_miss==1 | Chil_measured==0 
  
  g Elect=electrchh==1
  
  g Mobile_fone=mobphone==1 
 
keep year perweight idhsstrata hhnum clusterno strata Diarh_prev Partner Occup Wall_structures Floor_struc Roof_struc Cook_fuel Cooking_Place Toilet_shared Treat_water Radio TV age educlvl urban hhkidlt5 kidsex kidcurage kidbord kidtwin kidagemo wormtrekid hhmemtotal hheadage hheadsex sleeprooms electrchh toilsharnumt sleeprooms toilsharnumt hhmemtotal hhmemberPersleeprooms child_age_Month  motorcycl  carhh chicknum pignum  goatnum exoticctnum cattlenum Numberold  ARI2 ARI1 ARI Fever birthwt birthsz birthwtref brsfedmo hwwthtpctrm hwwtapct pregnant stockinhome H4age W4height Overweightight W4age overweight4age  WeightMiss Elect Mobile_fone


g Pregnant= pregnant==1 

replace  birthwt=. if birthwt==9995 | birthwt==9996 | birthwt==9997 | birthwt==9998 | birthwt==9999


g CattleNum=exoticctnum+cattlenum 

g smallAnimaNum=pignum+goatnum 


tab Occup, gen(Occup_) nofreq

tab Cook_fuel, g(Cook_fuel_) nofreq

tab educlvl, gen(educlvl_) nofreq

replace hheadage=.  if hheadage==98

g Singletone=kidtwin==10 



g AnimHouse=stockinhome==20 



save "C:\Users\Kananura Rornald\Dropbox\PhD Paper 3\IPUM DHS data\Diarhoea.dta", replace



tab1 Singletone educlvl Cook_fuel_3 Cook_fuel Occup ARI TV Radio Treat_water Toilet_shared Cooking_Place Cook_fuel Roof_struc Floor_struc Wall_structures Occup Partner  ARI2 ARI1 ARI Fever Diarh_prev motorcycl carhh kidtwin kidsex hheadsex [iw= perweight] if year==2006









