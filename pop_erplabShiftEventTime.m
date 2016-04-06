function [EEG, com] = pop_erplabShiftEventTime( EEG, varargin )
%POP_ERPLABSHIFTEVENTTIME Summary of this function goes here
%   Detailed explanation goes here

com = '';

% Return help if given no input
if nargin < 1
    help pop_erplabShiftEventTime
    return
end


% Input testing
if isobject(EEG) % eegobj
    whenEEGisanObject % calls a script for showing an error window
    return
end

%% Call GUI 
% When only 1 input is given the GUI is then called
if nargin==1
    
    % Input EEG error check
    serror = erplab_eegscanner(EEG, 'pop_erplabShiftEventTime',...
        0, ... % 0 = do not accept md;
        0, ... % 0 = do not accept empty dataset;
        0, ... % 0 = do not accept epoched EEG;
        0, ... % 0 = do not accept if no event codes
        2);    % 2 = do not care if there exists an ERPLAB EVENTLIST struct
    
    % Quit if there is an error with the input EEG
    if serror
        return
    end
    
    %     % Get previous input parameters
    def  = erpworkingmemory('pop_erplabShiftEventTime');
    if isempty(def)
        def = {};
    end
    
    
    % Call GUI    
    inputstrMat = erplabShiftEventTimeGUI(def);  % GUI
    
    % Exit when CANCEL button is pressed
    if isempty(inputstrMat) && ~strcmp(inputstrMat,'')
        disp('User selected Cancel')
        return
    end
    
    eventcodes          = inputstrMat{1};
    timeshift           = inputstrMat{2};
    rounding            = inputstrMat{3};
%     displayFeedback     = inputstrMat{4};
%     
%     erpworkingmemory('pop_erplabShiftEventTime', ...
%         {eventcodes, timeshift, rounding, displayFeedback});
%     
    
    % New output EEG name
    if length(EEG)==1
        EEG.setname = [EEG.setname '_eventTimeshifted'];
    end
    
    
    [EEG, com] = pop_erplabShiftEventTime(EEG, ...
        'Eventcodes'      , eventcodes,  ...
        'Timeshift'      , timeshift,   ...
        'Rounding'       , rounding     );
    
    
    return
end




%% Parse named input parameters (vs positional input parameters)

inputParameters               = inputParser;
inputParameters.FunctionName  = mfilename;
inputParameters.CaseSensitive = false;

% Required parameters
inputParameters.addRequired('EEG');
% Optional named parameters (vs Positional Parameters)
inputParameters.addParameter('Eventcodes'         , []);
inputParameters.addParameter('Timeshift'          , 0);
inputParameters.addParameter('Rounding'           , 'nearest');
inputParameters.addParameter('DisplayFeedback'    , 'summary'); % old parameter for BoundaryString
% inputParameters.addParameter('History'            , 'script', @ischar); % history from scripting

inputParameters.parse(EEG, varargin{:});




















%% Generate equivalent command (for history)
%
skipfields  = {'EEG', 'DisplayFeedback'};
fn          = fieldnames(inputParameters.Results);
com         = sprintf( '%s  = pop_erplabShiftEventTime( %s ', inputname(1), inputname(1));
for q=1:length(fn)
    fn2com = fn{q}; % get fieldname
    if ~ismember(fn2com, skipfields)
        fn2res = inputParameters.Results.(fn2com); % get content of current field
        if ~isempty(fn2res)
            if iscell(fn2res)
                com = sprintf( '%s, ''%s'', {', com, fn2com);
                for c=1:length(fn2res)
                    getcont = fn2res{c};
                    if ischar(getcont)
                        fnformat = '''%s''';
                    else
                        fnformat = '%s';
                        getcont = num2str(getcont);
                    end
                    com = sprintf( [ '%s ' fnformat], com, getcont);
                end
                com = sprintf( '%s }', com);
            else
                if ischar(fn2res)
                    if ~strcmpi(fn2res,'off')
                        com = sprintf( '%s, ''%s'', ''%s''', com, fn2com, fn2res);
                    end
                else
                    %if iscell(fn2res)
                    %        fn2resstr = vect2colon(cell2mat(fn2res), 'Sort','on');
                    %        fnformat = '{%s}';
                    %else
                    fn2resstr = vect2colon(fn2res, 'Sort','on');
                    fnformat = '%s';
                    %end
                    com = sprintf( ['%s, ''%s'', ' fnformat], com, fn2com, fn2resstr);
                end
            end
        end
    end
end
com = sprintf( '%s );', com);

% get history from script. EEG
% switch shist
%         case 1 % from GUI
%                 com = sprintf('%s %% GUI: %s', com, datestr(now));
%                 %fprintf('%%Equivalent command:\n%s\n\n', com);
%                 displayEquiComERP(com);
%         case 2 % from script
%                 EEG = erphistory(EEG, [], com, 1);
%         case 3
%                 % implicit
%         otherwise %off or none
%                 com = '';
% end


%
% Completion statement
%
prefunc = dbstack;
nf = length(unique_bc2({prefunc.name}));
if nf==1
        msg2end
end
return

end

