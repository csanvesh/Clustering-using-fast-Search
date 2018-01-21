function[dist]=find_distance_matrix(input_data)
%finding distance from each point to all other points
ND=max(input_data(:,2));
NL=max(input_data(:,1));
if (NL>ND)
  ND=NL;
end
N=size(input_data,1);
for i=1:ND
  for j=1:ND
    dist(i,j)=0;
  end
end
for i=1:N
  ii=input_data(i,1);
  jj=input_data(i,2);
  dist(ii,jj)=input_data(i,3);
  dist(jj,ii)=input_data(i,3);
end