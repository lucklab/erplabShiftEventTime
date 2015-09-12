%% Test script
function [outputEEG outputEvents] = test_script()
try
    
    eeglab;
    
    % Load test data set
    data_filename = 'S1_EEG.set';
    data_filepath = './data/';
    inputEEG = pop_loadset('filename', data_filename ...
        , 'filepath', data_filepath);
    
    % View data
    %     eegplot(inputEEG.data ...
    %         , 'srate'    , inputEEG.srate ...
    %         , 'events'   , inputEEG.event ...
    %         , 'winlength', 20);
    
    eventcodes = [22 19];
    timeshift  = 0.23452345;
    outputEEG  = erplabEegTimeShift(inputEEG, eventcodes, timeshift);
    
    
    % View data
    %     eegplot(outputEEG.data ...
    %         , 'srate'    , outputEEG.srate ...
    %         , 'events'   , outputEEG.event ...
    %         , 'winlength', 20);
    %
    
    inputEvents           = struct2table(inputEEG.event);
    outputEvents          = struct2table(outputEEG.event);
    outputEvents.urevent  = [];
    outputEvents.duration = [];
    latencyDiff           = (outputEvents.latency-inputEvents.latency);
    timeDiff              = latencyDiff * (1/inputEEG.srate);
    
    outputEvents = [ outputEvents ...
        table(inputEvents.latency, 'VariableNames', {'inputLatency'}) ...
        table(latencyDiff) ...
        table(timeDiff)  ];
    
catch err;
    rethrow(err);
end

end % function

%% Function

function outputEEG = erplabEegTimeShift(inputEEG, eventcodes, timeshift)

outputEEG = inputEEG;

sample_shift = timeshift * inputEEG.srate;

% Convert EEG.data structure to a Matlab table
eventsTable      = struct2table(inputEEG.event);

% Convert event codes to a categorical variable type 
eventsTable.type = categorical(eventsTable.type);
eventcodes       = categorical(eventcodes);

% Copy the original latencies
% old_latency = eventsTable.latency;
% eventsTable = [eventsTable table(old_latency)];


rows                   = ismember(eventsTable.type, eventcodes);
vars                   = {'latency'};
eventsTable{rows,vars} = eventsTable{rows,vars}+sample_shift;


% check for latency differences
% diff_latency = eventsTable.latency - eventsTable.old_latency;
% eventsTable = [eventsTable table(diff_latency)];

eventsTable.type = char(eventsTable.type);
outputEEG.event  = table2struct(eventsTable)';

% check for out of bound events / Re-sort ur events
outputEEG = eeg_checkset(outputEEG, 'eventconsistency'); 

end