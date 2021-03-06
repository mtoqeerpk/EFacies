function classMeanTable = classMean(class, data, variableNames, functionHandle)
%% CLASSMEAN        Calculates the mean of each class for the data 
%
% class:                   Integer for the different classes
% data:                    Data (each column is a variable)
%
% Mustafa Al Ibrahim @ 2018
% Mustafa.Geoscientist@outlook.com

%% Preprocessing

% Defaults
if ~exist('functionHandle', 'var'); functionHandle = @nanmean; end

% Assertions
assert(exist('class', 'var') && isvector(class), 'class must be a vector');
assert(exist('data', 'var') && isnumeric(data), 'data must be numeric');


%% Main

variable = accumArrayMatrix(class, data, functionHandle);

classesNames   = sort(unique(class))';
classesNames   = arrayfun(@num2str, classesNames, 'UniformOutput', false);
classMeanTable = array2table(variable, 'RowNames', classesNames);

if exist('variableNames' , 'var')
    classMeanTable.Properties.VariableNames = variableNames;
end


end