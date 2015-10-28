

base.pol  <- format_output(cb_pol_08, cb_pol_10, cb_pol_12, cb_pol_14, coef_type="OR")
base.fr   <- format_output(cb_fr_08, cb_fr_10, cb_fr_12, cb_fr_14, coef_type="OR")
base.time <- format_output(cb_time_08, cb_time_10, cb_time_12, cb_time_14, coef_type="OR")
base.est  <- format_output(cb_est_08, cb_est_10, cb_est_12, cb_est_14, coef_type="OR")

div.pol <- format_output(cb_pol_08_div, cb_pol_10_div, cb_pol_12_div, cb_pol_14_div, coef_type="OR")
div.fr  <- format_output(cb_fr_08_div, cb_fr_10_div, cb_fr_12_div, cb_fr_14_div, coef_type="OR")
cdiv.pol <- format_output(cb_pol_08_cdiv, cb_pol_10_cdiv, cb_pol_12_cdiv, cb_pol_14_cdiv, coef_type="OR")
cdiv.fr  <- format_output(cb_fr_08_cdiv, cb_fr_10_cdiv, cb_fr_12_cdiv, cb_fr_14_cdiv, coef_type="OR")

div1.pol <- format_output(cb_pol_08_div1, cb_pol_10_div1, cb_pol_12_div1, cb_pol_14_div1, coef_type="OR")
div2.pol <- format_output(cb_pol_08_div2, cb_pol_10_div2, cb_pol_12_div2, cb_pol_14_div2, coef_type="OR")
div3.pol <- format_output(cb_pol_08_div3, cb_pol_10_div3, cb_pol_12_div3, cb_pol_14_div3, coef_type="OR")
divc1.pol <- format_output(cb_pol_08_div_c1, cb_pol_10_div_c1, cb_pol_12_div_c1, cb_pol_14_div_c1, coef_type="OR")

sp.pol <- format_output(cb_pol_08_sp, cb_pol_10_sp, cb_pol_12_sp, cb_pol_14_sp, coef_type="OR")
sp.fr  <- format_output(cb_fr_08_sp, cb_fr_10_sp, cb_fr_12_sp, cb_fr_14_sp, coef_type="OR")
cp.pol <- format_output(cb_pol_08_cp, cb_pol_10_cp, cb_pol_12_cp, cb_pol_14_cp, coef_type="OR")
cp.fr  <- format_output(cb_fr_08_cp, cb_fr_10_cp, cb_fr_12_cp, cb_fr_14_cp, coef_type="OR")

pol.lv <- format_output(cb_pol_08_lv, cb_pol_10_lv, cb_pol_12_lv, cb_pol_14_lv, coef_type="OR")
fr.lv  <- format_output(cb_fr_08_lv, cb_fr_10_lv, cb_fr_12_lv, cb_fr_14_lv, coef_type="OR")
pol.uv <- format_output(cb_pol_08_uv, cb_pol_10_uv, cb_pol_12_uv, cb_pol_14_uv, coef_type="OR")
fr.uv  <- format_output(cb_fr_08_uv, cb_fr_10_uv, cb_fr_12_uv, cb_fr_14_uv, coef_type="OR")

pol.nov <- format_output(cb_pol_08_nov, cb_pol_10_nov, cb_pol_12_nov, cb_pol_14_nov, coef_type="OR")
fr.nov <- format_output(cb_fr_08_nov, cb_fr_10_nov, cb_fr_12_nov, cb_fr_14_nov, coef_type="OR")

mi.pol     <- format_output(mi_pol_08, mi_pol_10, mi_pol_12, mi_pol_14, coef_type="OR")
mi.fr      <- format_output(mi_fr_08, mi_fr_10, mi_fr_12, mi_fr_14, coef_type="OR")
mi.pol.div <- format_output(mi_pol_08_div, mi_pol_10_div, mi_pol_12_div, mi_pol_14_div, coef_type="OR")
mi.fr.div  <- format_output(mi_fr_08_div, mi_fr_10_div, mi_fr_12_div, mi_fr_14_div, coef_type="OR")
mi.pol.cdiv <- format_output(mi_pol_08_cdiv, mi_pol_10_cdiv, mi_pol_12_cdiv, mi_pol_14_cdiv, coef_type="OR")
mi.fr.cdiv  <- format_output(mi_fr_08_cdiv, mi_fr_10_cdiv, mi_fr_12_cdiv, mi_fr_14_cdiv, coef_type="OR")


miss.pol <- format_output(cb_pol_08_miss, cb_pol_10_miss, cb_pol_12_miss, cb_pol_14_miss, coef_type="OR")
miss.fr  <- format_output(cb_fr_08_miss, cb_fr_10_miss, cb_fr_12_miss, cb_fr_14_miss, coef_type="OR")
miss.pol.div <- format_output(cb_pol_08_miss_div, cb_pol_10_miss_div, cb_pol_12_miss_div, cb_pol_14_miss_div, coef_type="OR")
miss.fr.div <- format_output(cb_fr_08_miss_div, cb_fr_10_miss_div, cb_fr_12_miss_div, cb_fr_14_miss_div, coef_type="OR")
miss.pol.cdiv <- format_output(cb_pol_08_miss_cdiv, cb_pol_10_miss_cdiv, cb_pol_12_miss_cdiv, cb_pol_14_miss_cdiv, coef_type="OR")
miss.fr.cdiv <- format_output(cb_fr_08_miss_cdiv, cb_fr_10_miss_cdiv, cb_fr_12_miss_cdiv, cb_fr_14_miss_cdiv, coef_type="OR")



write.csv(base.pol,  row.names=F, file="tables/ESFnew-Voting-BASE-pol-08-15.csv") 
write.csv(base.fr,   row.names=F, file="tables/ESFnew-Voting-BASE-fr-08-15.csv") 
write.csv(base.time, row.names=F, file="tables/ESFnew-Voting-BASE-est-08-15.csv") 
write.csv(base.est,  row.names=F, file="tables/ESFnew-Voting-BASE-time-08-15.csv") 

write.csv(sp.pol,  row.names=F, file="tables/ESFnew-Voting-SAMEp-pol-08-15.csv") 
write.csv(sp.fr,   row.names=F, file="tables/ESFnew-Voting-SAMEp-fr-08-15.csv") 
write.csv(cp.pol, row.names=F, file="tables/ESFnew-Voting-CROSSp-pol-08-15.csv") 
write.csv(cp.fr,  row.names=F, file="tables/ESFnew-Voting-CROSSp-fr-08-15.csv") 

write.csv(pol.lv,  row.names=F, file="tables/ESFnew-Voting-LIKELYv-pol-08-15.csv") 
write.csv(fr.lv,   row.names=F, file="tables/ESFnew-Voting-LIKELYv-fr-08-15.csv") 
write.csv(pol.uv, row.names=F, file="tables/ESFnew-Voting-UNLIKELYv-pol-08-15.csv") 
write.csv(fr.uv,  row.names=F, file="tables/ESFnew-Voting-UNLIKELYv-fr-08-15.csv") 

write.csv(div.pol,  row.names=F, file="tables/ESFnew-Voting-DIV-pol-08-15.csv") 
write.csv(div.fr,   row.names=F, file="tables/ESFnew-Voting-DIV-fr-08-15.csv")
write.csv(cdiv.pol,  row.names=F, file="tables/ESFnew-Voting-CDIV-pol-08-15.csv") 
write.csv(cdiv.fr,   row.names=F, file="tables/ESFnew-Voting-CDIV-fr-08-15.csv") 

write.csv(div1.pol,  row.names=F, file="tables/ESFnew-Voting-DIV1-pol-08-15.csv") 
write.csv(div1.fr,   row.names=F, file="tables/ESFnew-Voting-DIV1-fr-08-15.csv")
write.csv(div2.pol,  row.names=F, file="tables/ESFnew-Voting-DIV2-pol-08-15.csv") 
write.csv(div2.fr,   row.names=F, file="tables/ESFnew-Voting-DIV2-fr-08-15.csv")
write.csv(div3.pol,  row.names=F, file="tables/ESFnew-Voting-DIV3-pol-08-15.csv") 
write.csv(div3.fr,   row.names=F, file="tables/ESFnew-Voting-DIV3-fr-08-15.csv")
write.csv(divc1.pol,  row.names=F, file="tables/ESFnew-Voting-DIVc1-pol-08-15.csv") 
write.csv(divc1.fr,   row.names=F, file="tables/ESFnew-Voting-DIVc1-fr-08-15.csv")

write.csv(pol.nov,  row.names=F, file="tables/ESFnew-Voting-NOV-pol-08-15.csv") 
write.csv(fr.nov,   row.names=F, file="tables/ESFnew-Voting-NOV-fr-08-15.csv") 

write.csv(mi.pol,  row.names=F, file="tables/ESFnew-Voting-MI-pol-08-15.csv") 
write.csv(mi.fr,   row.names=F, file="tables/ESFnew-Voting-MI-fr-08-15.csv") 
write.csv(mi.pol.div, row.names=F, file="tables/ESFnew-Voting-MIDIV-pol-08-15.csv") 
write.csv(mi.fr.div,  row.names=F, file="tables/ESFnew-Voting-MIDIV-fr-08-15.csv")  
write.csv(mi.pol.cdiv, row.names=F, file="tables/ESFnew-Voting-MICDIV-pol-08-15.csv") 
write.csv(mi.fr.cdiv,  row.names=F, file="tables/ESFnew-Voting-MICDIV-fr-08-15.csv")  

write.csv(miss.pol,  row.names=F, file="tables/ESFnew-Voting-MISS-pol-08-15.csv") 
write.csv(miss.fr,   row.names=F, file="tables/ESFnew-Voting-MISS-fr-08-15.csv") 
write.csv(miss.pol.div, row.names=F, file="tables/ESFnew-Voting-MISS_DIV-pol-08-15.csv") 
write.csv(miss.fr.div,  row.names=F, file="tables/ESFnew-Voting-MISS-DIV-fr-08-15.csv")
write.csv(miss.pol.cdiv, row.names=F, file="tables/ESFnew-Voting-MISS_CDIV-pol-08-15.csv") 
write.csv(miss.fr.cdiv,  row.names=F, file="tables/ESFnew-Voting-MISS-CDIV-fr-08-15.csv")    

