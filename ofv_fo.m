%Individual contributions to the pop likelihood with the FO approximation
function ofv_i = ofv_fo(model,errmodel,tdata,cdata,theta,omega,sigma,eta,bInter)

eps = zeros(size(tdata,1),size(sigma,1));

cov = v(model,errmodel,tdata,cdata,theta,omega,sigma,eta,eps,bInter); %FO approximated covariance

tmp_chol = chol(cov,'upper');
lC=tmp_chol\eye(length(cov));

ipred = model(tdata,cdata,theta,eta); %Individual predictions

res = tdata(:,3)-ipred; %Individual residuals

R=(res'*lC);
ofv_i = log(det(cov))+R*R';%res'*inv_cov*res; %FO OFV

end