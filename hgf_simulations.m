function hgf_simulations(idx_ka,idx_ze)
% Simulation replicating Figure 7, Mathys 2014

addpath(genpath('./tapas/HGF/'));

% This is Sandra's input trace, to feed into the HGF as a perceptual
% variable
load values
u = hgf.u;

% Run 100 iterations
num_iter = 100;

% Range of zeta and kappa values
ze_vals = [0.5:0.5:5];
kappa_vals = [0.5:0.5:3];

% Pick one zeta and kappa value
ka = kappa_vals(idx_ka);
ze = ze_vals(idx_ze);

% Simulate trajectories with set parameters
pars = [NaN 1 1 NaN 1 1 NaN 0 0 NaN ka NaN -4 log(0.0025)];

% Generate a trace based on the above parameters, then invert 

for i = 1:num_iter
    sim = tapas_simModel(u, 'tapas_hgf_binary', pars, 'tapas_unitsq_sgm',log(ze));
    y = sim.y;
    u = u;
    hgf_vb = tapas_fitModel(y,u,['tapas_hgf_binary_config_sim(' sprintf('%0.2f',ka) ')'],...
        ['tapas_unitsq_sgm_config_sim(' sprintf('%0.2f',ze') ')'],'tapas_quasinewton_optim_config');
    
    vb_pars(i) = hgf_vb.p_prc.ka(2);
end
