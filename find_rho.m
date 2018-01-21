function[cut_of_distance,rho]=find_rho(input_data,percent,distance_matrix)
%finding cut of distance and rho
    ND=max(input_data(:,2));
    NL=max(input_data(:,1));
    if (NL>ND)
      ND=NL;
    end
    N=size(input_data,1);
    %calculating cut of distance
    position=round(N*percent/100);
    sda=sort(input_data(:,3));
    cut_of_distance=sda(position);
    %calculating rho local densities
    for i=1:ND
      rho(i)=0.;
    end
    for i=1:ND-1
      for j=i+1:ND
         rho(i)=rho(i)+exp(-(distance_matrix(i,j)/cut_of_distance)*(distance_matrix(i,j)/cut_of_distance));
         rho(j)=rho(j)+exp(-(distance_matrix(i,j)/cut_of_distance)*(distance_matrix(i,j)/cut_of_distance));
      end
    end
end