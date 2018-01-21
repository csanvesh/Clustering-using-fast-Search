%convert data into convert inti [ID1,ID2,Distance] form
function[out_data]= process_data(data)
    %size of data
    [numrows,~]=(size(data));
    out_data=zeros(numrows,3);
    index_i=1;
    %generating data in [ID1,ID2,Distance] form
    for idx=1:numrows
        for idy=1:numrows
            if idx==idy
                continue;
            end
            
            x1=data(idx,1);
            x2=data(idy,1);
            y1=data(idx,2);
            y2=data(idy,2);
            %calculating eucledian diastance
            dist=sqrt(power(x2-x1,2)+ power(y2-y1,2));
            out_data(index_i,:)=[idx,idy,dist];
            index_i=index_i+1;
        end 
    end
end