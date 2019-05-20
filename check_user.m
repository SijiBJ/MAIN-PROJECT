function out = check_user(id,pw)
data = importdata('login_details.csv');

num_users = length(data);

for i = 1:num_users
    p =  data{i};
    splitted = split(p,',');
    user = splitted{1};
    
    password = splitted{2};
    
    if strcmp(id,user) && strcmp(pw,password)
        
        out = 1;
        break
    else
        out = 0;
    end
end
disp(out)
end