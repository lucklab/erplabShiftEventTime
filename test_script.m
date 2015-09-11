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
    
    events  = [22 21];
    time_ms = 50;
    outputEEG = erplabEegTimeShift(inputEEG, events, time_ms);
    
    
    % View data
    eegplot(outputEEG.data ...
        , 'srate'    , outputEEG.srate ...
        , 'events'   , outputEEG.event ...
        , 'winlength', 20);
    
catch(err);
    rethrow(err);
end

end % function

%% Function

function outputEEG = erplabEegTimeShift(inputEEG, ~, ~)

outputEEG = inputEEG;

end