% Beam Deflection Project - Part 1
% Sophia Nateghi
% Hoover High
% Mrs. Harris
%
% Start Date: December 3rd 2019
% Last Revised on: December 10th 2019
%
% Purpose: To  create the computer model that will determine the deflection of a beam based on input 
%          parameters that include the beam material, beam cross-section, type of beam support, and the 
%          load applied to the beam.
%
% Pseudocode:
%    1. Input and user Promts:
%       a. Moment of Inertia
%           1) b = base of the beam (in inches)
%           2) h = height of the beam (in inches)
%           3) SupportType = type of beam 
%              a) Rectangle, Window, T-Beam, I-Beam
%           4) t = thickness of the beam (in inches)
%              a) Only applicable if winow, t-beam, or i-beam
%       b. Elasticity
%           1) Beam = material used in beam 
%              a) aluminum, brass, chromium, copper, iron, lead, steel, tin, titanium, zinc
%       c. Deflection
%           1) SupportType = support for the beam 
%              a) cantilevered/simply supported
%           2) LoadType = type of load being applied 
%              a) point/uniform
%           3) F = force of the load being applied (in Newtons)
%           4) a = place on beam where load is applied (in inches)
%   2. Call the following functions:
%       a. Moment_Of_Inertia_Function
%       b. Elasticity_Function
%       c. Deflection_Function
%       d. Plot_Function
%   3. Output the following information:
%       a. Final plot for beam deflection
%           1) Result from Plot_Function
%
% Functions Called: (beyond built-in function)
%                    Deflection_Function           Elasticity_Function
%                    Moment_Of_Inertia Function    Plot_Function
%
% -------------------------------------------------------------------------------------------------
clc,clear

% Moment of Inertia:

    % Inputs and Variables (base, height, length)
    prompt = {'Enter base of the beam (in inches):','Enter the height of the beam (in inches):','Enter the length of the beam (in inches):'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    b = str2double(answer{1});
    h = str2double(answer{2});
    l = str2double(answer{3});
    
    % Type of beam
    Beam = listdlg('PromptString', 'Select a type of beam:', 'SelectionMode', 'single', 'ListString', {'Rectangle', 'Window', 'T-Beam', 'I-Beam'}, 'Name', 'Beam Type', 'ListSize', [200 100]);

    % Thickness (if not rectangle case)
    switch Beam            
        case 2
            prompt = {'Enter the thickness of the beam (in inches):'};
            dlgtitle = 'Thickness';
            dims = [1 35];
            answer = inputdlg(prompt,dlgtitle,dims);
            t = str2double(answer{1});
        case 3
            prompt = {'Enter the thickness of the beam (in inches):'};
            dlgtitle = 'Thickness';
            dims = [1 35];
            answer = inputdlg(prompt,dlgtitle,dims);
            t = str2double(answer{1});
        case 4
            prompt = {'Enter the thickness of the beam (in inches):'};
            dlgtitle = 'Thickness';
            dims = [1 35];
            answer = inputdlg(prompt,dlgtitle,dims);
            t = str2double(answer{1});
    end
    
    % Function
    MOI = Moment_Of_Inertia_Function(b, h, t, Beam);

% Elasticity

    % Inputs (Beam Material)
    BeamMaterial = listdlg('PromptString', 'Select a material for the beam:', 'SelectionMode', 'single', 'ListString', {'Aluminum','Brass','Chromium','Copper','Iron','Lead','Steel','Tin','Titanium','Zinc'}, 'Name', 'Material', 'ListSize', [200 100]);

        % Function
         Elactisity = Elasticity_Function(BeamMaterial);

% Deflection
    
    % Inputs (Support type, Load type, Force, Point of force)
    Support = listdlg('PromptString', 'Select a support type for the beam:', 'SelectionMode', 'single', 'ListString', {'Cantilevered', 'Simply Supported'}, 'Name', 'Beam Type', 'ListSize', [200 100]);
    Load = listdlg('PromptString', 'Select the type of load being applied:', 'SelectionMode', 'single', 'ListString', {'Point', 'Uniform'}, 'Name', 'Load Type', 'ListSize', [200 100]);
    
    % Force Input
    prompt = {'Enter the force being applied to the beam (in lbs)'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    F = str2double(answer{1});
    
    % Point where load is applied
    switch Load
        % Point load
        case 1
            prompt = {'Enter the distance on the beam where the force is being applied (in inches)'};
            dlgtitle = 'Input';
            dims = [1 35];
            answer = inputdlg(prompt,dlgtitle,dims);
            a = str2double(answer{1});
        % Uniform load
        case 2
            a = 0;
    end
    
    % Function
    [Deflection, x] = Deflection_Function(Support, Load, F, Elactisity, MOI, l, a);

% Plot and Output

    % Function 
    Plot_Function(Deflection, x, Load, Support, BeamMaterial, Beam, F)