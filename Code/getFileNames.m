function [filenames] = getFileNames(FileDir,varargin)
%GETFILENAMES get list of filenames in a directory. 
%   filenames = GETFILENAMES(FileDir) outputs a list of filenames in the
%   directory FileDir.
%
%   filenames = GETFILENAMES(FileDir,SearchTerm) outputs a list of
%   filenames in the directory FileDir that contain the string stored in
%   the variable SearchTerm. 
%
%   Author: Connor Healy (connor.healy@utah.edu)
%   Affiliation: University of Utah, Dept. of Biomedical Engineering
filenames = dir(FileDir);
isPP = zeros(1,length(filenames));

if ~isempty(varargin)
    for n = 1:length(filenames)
        if contains(filenames(n).name,varargin{1})
            isPP(n) = 1;
        end
    end
    filenames = filenames(logical(isPP'));
end

filenames={filenames(:).name}';
end

