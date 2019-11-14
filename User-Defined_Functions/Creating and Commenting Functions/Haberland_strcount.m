function  nchar = Haberland_strcount(inString, chartype)
    % Haberland_strcount counts the number of certain types of charecters in a string
    % 
    %   Haberland_strcount(inString, chartype)
    %   
    %   Chartype can be:
    %       alpha: Letters
    %       digit: Numbers
    %       lower: Lowercase Letters
    %       punct: Punctuation Charecters
    %       upper: Uppercase Letters
    %       wspace: Whitespace Charecters
    %
    %   Inputs:
    %       inString: This is the input string the charecter will be
    %       counted in
    %       chartype: This is the type of charecter you want to count in
    %       the input string
    %   
    %   Output:
    %       nchar: This is the number of charecters of that type in the
    %       input string
    %   

    %
    %   James R. Haberland 19032003
    %   Hoover High School
    %   Ms. Harris
    %   Nov. 12 2019
    %
    
% Initial Process
chartype = lower(chartype);

% Calculations
nchar = sum(isstrprop(inString,chartype));

end