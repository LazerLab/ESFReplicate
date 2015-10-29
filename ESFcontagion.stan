data {
  int<lower=1> N;
  int<lower=0, upper=1> vote[N];
  vector[N] mvint_pol_both;
  vector[N] ideomd_pol_both;
  vector[N] ideosd0_pol_both;
  vector[N] party_rhhi_pol_both;
  int<lower=1, upper=5> vint[N];
  int<lower=0, upper=1> Female[N];
  int<lower=1, upper=4> Interest_pol[N];
  int<lower=1, upper=7> Ideology[N];
  int<lower=1, upper=4> Party[N];
  int<lower=1, upper=8> Race[N];
  int<lower=1, upper=4> SchYear[N];
  int<lower=1, upper=14> ChapterN[N];
}
parameters {
  real a0;
  real b0;
  real g0;

  real a_m_vint;
  vector[5] a_e_vint;
  real<lower=0> a_s_vint;

  real a_m_Interest_pol;
  vector[4] a_e_Interest_pol;
  real<lower=0> a_s_Interest_pol;

  real a_m_Ideology;
  vector[7] a_e_Ideology;
  real<lower=0> a_s_Ideology;

  real a_m_Party;
  vector[4] a_e_Party;
  real<lower=0> a_s_Party;

  real a_m_Race;
  vector[8] a_e_Race;
  real<lower=0> a_s_Race;

  real a_m_SchYear;
  vector[4] a_e_SchYear;
  real<lower=0> a_s_SchYear;

  real a_m_ChapterN;
  vector[14] a_e_ChapterN;
  real<lower=0> a_s_ChapterN;

}
transformed parameters {
  vector[N] linear_predictor;
  vector[5] a_vint;
  vector[4] a_Interest_pol;
  vector[7] a_Ideology;
  vector[4] a_Party;
  vector[8] a_Race;
  vector[4] a_SchYear;
  vector[14] a_ChapterN;
  a_vint <- a_s_vint * (a_m_vint + a_e_vint);
  a_Interest_pol <- a_s_Interest_pol * (a_m_Interest_pol + a_e_Interest_pol);
  a_Ideology <- a_s_Ideology * (a_m_Ideology + a_e_Ideology);
  a_Party <- a_s_Party * (a_m_Party + a_e_Party);
  a_Race <- a_s_Race * (a_m_Race + a_e_Race);
  a_SchYear <- a_s_SchYear * (a_m_SchYear + a_e_SchYear);
  a_ChapterN <- a_s_ChapterN * (a_m_ChapterN + a_e_ChapterN);
  for (n in 1:N) {
    linear_predictor[n] <- a0 +
      a_vint[vint[n]] +
      a_Interest_pol[Interest_pol[n]] +
      a_Ideology[Ideology[n]] +
      a_Party[Party[n]] +
      a_Race[Race[n]] +
      a_SchYear[SchYear[n]] +
      a_ChapterN[ChapterN[n]] +
      g0 * Female[n] +
      b0 * mvint_pol_both[n];
  }
}

model {
  a0 ~ normal(0, 10);
  b0 ~ normal(0, 10);
  g0 ~ normal(0, 10);
  a_m_vint ~ normal(0, 1);
  a_m_Interest_pol ~ normal(0, 1);
  a_m_Ideology ~ normal(0, 1);
  a_m_Party ~ normal(0, 1);
  a_m_Race ~ normal(0, 1);
  a_m_SchYear ~ normal(0, 1);
  a_m_ChapterN ~ normal(0, 1);
  a_e_vint ~ normal(0, 1);
  a_s_vint ~ cauchy(0, 2.5);
  a_e_Interest_pol ~ normal(0, 1);
  a_s_Interest_pol ~ cauchy(0, 2.5);
  a_e_Ideology ~ normal(0, 1);
  a_s_Ideology ~ cauchy(0, 2.5);
  a_e_Party ~ normal(0, 1);
  a_s_Party ~ cauchy(0, 2.5);
  a_e_Race ~ normal(0, 1);
  a_s_Race ~ cauchy(0, 2.5);
  a_e_SchYear ~ normal(0, 1);
  a_s_SchYear ~ cauchy(0, 2.5);
  a_e_ChapterN ~ normal(0, 1);
  a_s_ChapterN ~ cauchy(0, 2.5);
  vote ~ bernoulli_logit(linear_predictor);
}

generated quantities {
  vector[N] vote_rep;
  for (n in 1:N) {
    vote_rep[n] <- bernoulli_rng(inv_logit(linear_predictor[n]));
  }
}
