%% Test script
function [outputEEG] = test_script()
try
    
    eeglab;
    
    % Load test data set
    data_filename = 'S1_EEG.set';
    data_filepath = './data/';
    inputEEG = pop_loadset('filename', data_filename ...
        , 'filepath', data_filepath);
    
    % View Input data
    eegplot(inputEEG.data ...
        , 'srate'    , inputEEG.srate ...
        , 'events'   , inputEEG.event ...
        , 'winlength', 20);
    
    eventcodes = {'22', '19'};
    timeshift  = 0.015;
    rounding   = 'floor';
    outputEEG  = erplab_shiftevents_eeg(inputEEG, eventcodes, timeshift, rounding);
    
    
    % View the Output data
    eegplot(outputEEG.data ...
        , 'srate'    , outputEEG.srate ...
        , 'events'   , outputEEG.event ...
        , 'winlength', 20);
    
    
    
catch err;
    rethrow(err);
end

end % function
