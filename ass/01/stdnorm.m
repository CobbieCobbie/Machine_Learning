function f = stdnorm(x, mu, sigma)
    f = normpdf(x, mu, sigma)
end

%Code zum Plotten: fplot(@(x) stdnorm(x,0,1),[-8,8])
%fplot(@(x) stdnorm(x,-2-2),[-8,8])