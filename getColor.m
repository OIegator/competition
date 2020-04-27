function [color] = getColor(code)
 switch code
     case 0
         color = [0 1 0];
     case 1 
         color = [0.8 0.6 0.1];
     case 2 
         color = [0.7 0.7 0.7];
     case 3
         color = [0 0 0];
     otherwise
         color = [1 0 0];
end

