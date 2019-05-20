clc
clear all
%close all
k=input('key');
si=input('si');
[fname,path]=uigetfile('choose encryption image');
I=imread([path,fname]);
r=256;
c=256;
I=rgb2gray(I);
I=imresize(I,[r,c]);
figure
imshow(I)
key=zeros(1,r*c);
key(1)=k;
NEQR=zeros(r,c);
mm=1;
nn=1;
for i=1:2:r
    for j=1:2:c
      imgg=I(i:i+1,j:j+1);  
        N = zeros(2);
      inc = 1;
      for kk=1:2
          for hh=1:2
            
              g=imgg(kk,hh);
              x=kk-1;
              y=hh-1;
              
              
              a=de2bi(g,8,'left-msb');
              ne(1)=taffoli(taffoli(double(a(1)),double(y),double(~x)),double(y),double(x));
             ne(2)=taffoli(taffoli(taffoli(double(a(2)),double(~y),double(x)),double(~x),double(y)),x,y);
             ne(3)=taffoli(taffoli(double(a(3)),double(x),double(~y)),double(x),double(y));
             ne(4)=taffoli(a(4),double(y),double(x));
             ne(5)=taffoli(taffoli(a(5),y,~x),double(y),double(x));
             ne(6)=taffoli(taffoli(a(6),double(x),double(~y)),double(x),double(y));
             ne(7)=taffoli(a(7),y,x);
             ne(8)=taffoli(a(8),y,x);
             neqr=(ne(1)*2^7)+(ne(2)*2^6)+(ne(3)*2^5)+(ne(4)*2^4)+(ne(5)*2^3)+(ne(6)*2^2)+(ne(7)*2^1)+(ne(8)*2^0);
              nn=nn+1;
              N(inc) = neqr;
              inc = inc+1;
          end
          mm=mm+1;
      end
        N = N';
        NEQR(i:i+1,j:j+1)=N;
        
    end
end

figure,imshow(uint8(NEQR))
title('NEQR Representation')





for m=2:r*c
    key(m)=mod((si*(key(m-1)-(key(m-1)*key(m-1)))+(4-si)*((sin(pi*key(m-1)))/4)),1);
end
key1=zeros(1,r*c);
m=1;
for  i=2:r*c
    key1(m)=mod(abs(fix((key(m)-fix(key(m)))*10^8)),256);
    m=m+1;
end
% 
% encryption=zeros(r,c); 
key_enc=reshape(key1,[r,c]);



NEQR1=zeros(r,c);
mm=1;
nn=1;
ne=[]
for i=1:2:r
    for j=1:2:c
      imgg=key_enc(i:i+1,j:j+1);  
        N = zeros(2);
      inc = 1;
      for kk=1:2
          for hh=1:2
            
              g=imgg(kk,hh);
              x=kk-1;
              y=hh-1;
              
              
              a=de2bi(g,8,'left-msb');
              ne(1)=taffoli(taffoli(double(a(1)),double(y),double(~x)),double(y),double(x));
             ne(2)=taffoli(taffoli(taffoli(double(a(2)),double(~y),double(x)),double(~x),double(y)),x,y);
             ne(3)=taffoli(taffoli(double(a(3)),double(x),double(~y)),double(x),double(y));
             ne(4)=taffoli(a(4),double(y),double(x));
             ne(5)=taffoli(taffoli(a(5),y,~x),double(y),double(x));
             ne(6)=taffoli(taffoli(a(6),double(x),double(~y)),double(x),double(y));
             ne(7)=taffoli(a(7),y,x);
             ne(8)=taffoli(a(8),y,x);
             neqr1=(ne(1)*2^7)+(ne(2)*2^6)+(ne(3)*2^5)+(ne(4)*2^4)+(ne(5)*2^3)+(ne(6)*2^2)+(ne(7)*2^1)+(ne(8)*2^0);
              nn=nn+1;
              N(inc) = neqr1;
              inc = inc+1;
          end
          mm=mm+1;
      end
        N = N';
        NEQR1(i:i+1,j:j+1)=N;
        
    end
end

figure,imshow(uint8(NEQR1))
title('NEQR Representation of key')














for i=1:r
    for j=1:c
      keyy=NEQR1(i,j);
      bin_key=de2bi(keyy,8,'left-msb');
      aa=NEQR(i,j);
      a=de2bi(aa,8,'left-msb');
       b(1)=xor(a(1),a(5));
        b(2)=xor(a(2),a(6)) ;
        b(3)=xor(a(3),a(7));
        b(4)=xor(a(4),a(8));
        b(5)=xor(a(5),b(4));
        b(6)=xor(a(6),b(3));
        b(7)=xor(a(7),b(2));
        b(8)=xor(a(8),b(1));
        a1=bin_key;
        b1(1)=xor(b(1),a1(1));
        b1(2)=xor(b(2),a1(2));
        b1(3)=xor(b(3),a1(3));
        b1(4)=xor(b(4),a1(4));
        b1(5)=xor(b(5),a1(5));
        b1(6)=xor(b(6),a1(6));
        b1(7)=xor(b(7),a1(7));
        b1(8)=xor(b(8),a1(8));
        encryption(i,j)=(b1(1)*2^7)+(b1(2)*2^6)+(b1(3)*2^5)+(b1(4)*2^4)+(b1(5)*2^3)+(b1(6)*2^2)+(b1(7)*2^1)+(b1(8)*2^0);
        b1=[]
        
      
      
      
      
        
        
        
    end
end
 figure  
 imshow(uint8(encryption))   
 title('encrypted')  
 hhh=randi([1,1000000])
 hhhh=randi([1,1000000])
 filename = strcat(num2str(hhh),'encrypted',num2str(hhhh),'.png');
 
 imwrite(uint8(encryption),filename)
 save gg encryption
 
 
 dropbox_accesskey = 'qhC1cI_pQkAAAAAAAAAATWhHrEdOdJB0FXcYhbv9MffQc-St-8Twb94AYbwvqi7G ';

 
 status = uploadToDropbox(dropbox_accesskey,filename);
 delete(filename)
 disp(filename)
%  %% <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ENCRYPTION is COMPLETED>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..
% decryption=zeros(r,c)
%  b=[];
%  b1=[];
%  for i=1:r
%     for j=1:c
%       keyy=NEQR1(i,j);
%       a1=de2bi(keyy,8,'left-msb');
%       aa=encryption(i,j);
%       a=de2bi(aa,8,'left-msb');
% %            a1=bin_key;
%         b1(1)=xor(a(1),a1(1));
%         b1(2)=xor(a(2),a1(2));
%         b1(3)=xor(a(3),a1(3));
%         b1(4)=xor(a(4),a1(4));
%         b1(5)=xor(a(5),a1(5));
%         b1(6)=xor(a(6),a1(6));
%         b1(7)=xor(a(7),a1(7));
%         b1(8)=xor(a(8),a1(8));
%       
%      
%       
%       
%       
%       b(8)=xor(b1(8),b1(1));
%       b(7)=xor(b1(7),b1(2));
%       b(6)=xor(b1(6),b1(3));
%       b(5)=xor(b1(5),b1(4));
%       b(4)=xor(b1(4),b(8));
%       b(3)=xor(b1(3),b(7));
%       b(2)=xor(b1(2),b(6)) ;
%       b(1)=xor(b1(1),b(5));
%     
%        
%       
%        
%       
%         
%    
%       
%         decryption(i,j)=(b(1)*2^7)+(b(2)*2^6)+(b(3)*2^5)+(b(4)*2^4)+(b(5)*2^3)+(b(6)*2^2)+(b(7)*2^1)+(b(8)*2^0);
%         
%         
%       
%       
%       
%       
%         
%         
%         
%     end
% end
%  figure  
%  imshow(uint8(decryption))   
%  title('decrypted neqr image') 
%  
%  
%  NEQR_retrieved=zeros(r,c);
% mm=1;
% nn=1;
% ne=[];
% for i=1:2:r
%     for j=1:2:c
%       imgg=decryption(i:i+1,j:j+1);  
%         N = zeros(2);
%       inc = 1;
%       for kk=1:2
%           for hh=1:2
%             
%               g=imgg(kk,hh);
%               x=kk-1;
%               y=hh-1;
%               
%               
%               a=de2bi(g,8,'left-msb');
%               ne(1)=taffoli(taffoli(double(a(1)),double(y),double(~x)),double(y),double(x));
%              ne(2)=taffoli(taffoli(taffoli(double(a(2)),double(~y),double(x)),double(~x),double(y)),x,y);
%              ne(3)=taffoli(taffoli(double(a(3)),double(x),double(~y)),double(x),double(y));
%              ne(4)=taffoli(a(4),double(y),double(x));
%              ne(5)=taffoli(taffoli(a(5),y,~x),double(y),double(x));
%              ne(6)=taffoli(taffoli(a(6),double(x),double(~y)),double(x),double(y));
%              ne(7)=taffoli(a(7),y,x);
%              ne(8)=taffoli(a(8),y,x);
%              neqr=(ne(1)*2^7)+(ne(2)*2^6)+(ne(3)*2^5)+(ne(4)*2^4)+(ne(5)*2^3)+(ne(6)*2^2)+(ne(7)*2^1)+(ne(8)*2^0);
%               nn=nn+1;
%               N(inc) = neqr;
%               inc = inc+1;
%           end
%           mm=mm+1;
%       end
%         N = N';
%         NEQR_retrieved(i:i+1,j:j+1)=N;
%         
%     end
% end
% 
% figure,imshow(uint8(NEQR_retrieved))
% title('NEQR retrived after decryption')
%  
%  
 