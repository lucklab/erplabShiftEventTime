%% Test script
function test_script()
try
    
    eeglab;
    
    % Load test data set
    data_filename = 'S1_EEG.set';
    data_filepath = './data/';
    inputEEG = pop_loadset('filename', data_filename, 'filepath', data_filepath);
    
    % View data
    eegplot(inputEEG.data ...
        , 'srate'    , inputEEG.srate ...
        , 'events'   , inputEEG.event ...
        , 'winlength', 20);
    
    eventcodes = {'22', '222'};
    timeshift  = 0.500;
    outputEEG  = erplabEegTimeShift(inputEEG, eventcodes, timeshift);
    
    
    % View data
    eegplot(outputEEG.data ...
        , 'srate'    , outputEEG.srate ...
        , 'events'   , outputEEG.event ...
        , 'winlength', 20);
    
catch err;
    rethrow(err);
end

end % function

%% Function

function outputEEG = erplabEegTimeShift(inputEEG, eventcodes, timeshift)

outputEEG = inputEEG;

sample_shift = timeshift * inputEEG.srate;

% Accessing latencies based on specified event codes
event_table = struct2table(inputEEG.event);
event_table.type = categorical(event_table.type);

% Copy the original latencies
% old_latency = event_table.latency;
% event_table = [event_table table(old_latency)];


rows = ismember(event_table.type, eventcodes);
vars = {'latency'};
event_table{rows,vars} = event_table{rows,vars}+sample_shift;


% check for latency differences
% diff_latency = event_table.latency - event_table.old_latency;
% event_table = [event_table table(diff_latency)];

event_table.type = char(event_table.type);
outputEEG.event = table2struct(event_table)';
outputEEG = eeg_checkset(outputEEG, 'eventconsistency'); % check for out of bound events

end