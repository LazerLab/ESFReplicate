#==============================================================================#
#
#  Conflict & Contagion Study
#  ESF Data, 2008-2014
#  Katya Ognyanova, kateto@gmail.com
#
#==============================================================================#

library(ESFpack)
load("ESF_Data.RData")
source("finish_data_prep.R")
load("analysis.Rdata")

# NOTE: There are quite a few conflict & contagion variables with names that are
#  not very intuitive. You can get the label for any variable in our models with
#  var.names(). E.g,
#  var.names("ideomd.pol.both")

# NOTE: When formatting the model output with format_output, add
# coef.type = "OR" to get the odds ratios instead of LOR. In the paper, results
# are reported as OR (more interpretable)

library(ReporteRs)
fo_list <- list(
  format_output(cb_pol_08, cb_pol_10, cb_pol_12, cb_pol_14),
  format_output(cb_fr_08, cb_fr_10, cb_fr_12, cb_fr_14),
  format_output(cb_time_08, cb_time_10, cb_time_12, cb_time_14),
  format_output(cb_est_08, cb_est_10, cb_est_12, cb_est_14),
  format_output(cb_no_08, cb_no_10, cb_no_12, cb_no_14),
  format_output(cb_aca_12, cb_aca_14),
  format_output(cb_pol_08_div1, cb_pol_10_div1, cb_pol_12_div1, cb_pol_14_div1),
  format_output(cb_pol_08_div2, cb_pol_10_div2, cb_pol_12_div2, cb_pol_14_div2),
  format_output(cb_pol_08_div3, cb_pol_10_div3, cb_pol_12_div3, cb_pol_14_div3),
  format_output(cb_pol_08_div_c1, cb_pol_10_div_c1, cb_pol_12_div_c1,
    cb_pol_14_div_c1),
  format_output(cb_pol_08_div, cb_pol_10_div, cb_pol_12_div, cb_pol_14_div),
  format_output(cb_fr_08_div, cb_fr_10_div, cb_fr_12_div, cb_fr_14_div),
  format_output(cb_pol_08, cb_pol_10, cb_pol_12, cb_pol_14),
  format_output(cb_pol_08_div, cb_pol_10_div, cb_pol_12_div, cb_pol_14_div),
  format_output(cb_fr_08, cb_fr_10, cb_fr_12, cb_fr_14),
  format_output(cb_fr_08_div, cb_fr_10_div, cb_fr_12_div, cb_fr_14_div),
  format_output(cb_pol_08_cdiv, cb_pol_10_cdiv, cb_pol_12_cdiv, cb_pol_14_cdiv),
  format_output(cb_fr_08_cdiv, cb_fr_10_cdiv, cb_fr_12_cdiv, cb_fr_14_cdiv),
  format_output(cb_pol_08, cb_pol_10, cb_pol_12, cb_pol_14),
  format_output(cb_pol_08_cdiv, cb_pol_10_cdiv, cb_pol_12_cdiv, cb_pol_14_cdiv),
  format_output(cb_fr_08, cb_fr_10, cb_fr_12, cb_fr_14),
  format_output(cb_fr_08_cdiv, cb_fr_10_cdiv, cb_fr_12_cdiv, cb_fr_14_cdiv),
  format_output(cb_pol_08_ns, cb_pol_10_ns, cb_pol_12_ns, cb_pol_14_ns),
  format_output(cb_fr_08_ns, cb_fr_10_ns, cb_fr_12_ns, cb_fr_14_ns),
  format_output(mi_pol_08_ns, mi_pol_10_ns, mi_pol_12_ns, mi_pol_14_ns),
  format_output(mi_fr_08_ns, mi_fr_10_ns, mi_fr_12_ns, mi_fr_14_ns),
  format_output(cb_pol_08_lv, cb_pol_10_lv, cb_pol_12_lv, cb_pol_14_lv,
    coef_type = "OR"),
  format_output(cb_fr_08_lv, cb_fr_10_lv, cb_fr_12_lv, cb_fr_14_lv,
    coef_type = "OR"),
  format_output(cb_pol_08_uv, cb_pol_10_uv, cb_pol_12_uv, cb_pol_14_uv,
    coef_type = "OR"),
  format_output(cb_fr_08_uv, cb_fr_10_uv, cb_fr_12_uv, cb_fr_14_uv,
    coef_type = "OR"),
  format_output(cb_pol_08_sp, cb_pol_10_sp, cb_pol_12_sp, cb_pol_14_sp),
  format_output(cb_fr_08_sp, cb_fr_10_sp, cb_fr_12_sp, cb_fr_14_sp),
  format_output(cb_pol_08_cp, cb_pol_10_cp, cb_pol_12_cp, cb_pol_14_cp),
  format_output(cb_fr_08_cp, cb_fr_10_cp, cb_fr_12_cp, cb_fr_14_cp),
  format_output(cb_pol_08_nov, cb_pol_10_nov, cb_pol_12_nov, cb_pol_14_nov),
  format_output(cb_fr_08_nov, cb_fr_10_nov, cb_fr_12_nov, cb_fr_14_nov),
  format_output(mi_pol_08, mi_pol_10, mi_pol_12, mi_pol_14),
  format_output(mi_fr_08, mi_fr_10, mi_fr_12, mi_fr_14),
  format_output(mi_pol_08_cdiv, mi_pol_10_cdiv, mi_pol_12_cdiv, mi_pol_14_cdiv),
  format_output(mi_fr_08_cdiv, mi_fr_10_cdiv, mi_fr_12_cdiv, mi_fr_14_cdiv),
  format_output(mi_pol_08_div, mi_pol_10_div, mi_pol_12_div, mi_pol_14_div),
  format_output(mi_pol_08, mi_pol_10, mi_pol_12, mi_pol_14),
  format_output(mi_pol_08_div, mi_pol_10_div, mi_pol_12_div, mi_pol_14_div),
  format_output(mi_fr_08, mi_fr_10, mi_fr_12, mi_fr_14),
  # format_output(mi_fr_08_div, mi_fr_10_div, mi_fr_12_div, mi_fr_14_div),
  format_output(cb_pol_08_nov, cb_pol_10_nov, cb_pol_12_nov, cb_pol_14_nov),
  format_output(cb_pol_08_miss, cb_pol_10_miss, cb_pol_12_miss, cb_pol_14_miss),
  format_output(cb_fr_08_miss, cb_fr_10_miss, cb_fr_12_miss, cb_fr_14_miss),
  format_output(cb_pol_08_miss_cdiv, cb_pol_10_miss_cdiv, cb_pol_12_miss_cdiv,
    cb_pol_14_miss_cdiv),
  format_output(cb_fr_08_miss_cdiv, cb_fr_10_miss_cdiv, cb_fr_12_miss_cdiv,
    cb_fr_14_miss_cdiv),
  format_output(cb_pol_08_miss_div, cb_pol_10_miss_div, cb_pol_12_miss_div,
    cb_pol_14_miss_div),
  format_output(cb_fr_08_miss_div, cb_fr_10_miss_div, cb_fr_12_miss_div,
    cb_fr_14_miss_div)#,
  # format_output(mi08, mi10, mi12, mi14)
)
tab_list <- lapply(fo_list, FlexTable)

doc1 <- docx(title = "C&Ctables")
lapply(tab_list, function(tab) {
  addFlexTable(doc1, tab)
  addPageBreak(doc1)
})
writeDoc(doc1, file = "C&Ctables.docx")
