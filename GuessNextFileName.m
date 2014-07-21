function [FileName,FileNum] = GuessNextFileName(Prefix,Fmt)

% Returns file name built by prefix, formatted number, dot, format (extension)
% As long as the file name exists, file number is internally sequentially
% incremented until first non-existing name is found.

% Syntax
% r = GuessNextFileName(Prefix,Fmt,varargin)
% 
% FileName = GuessNextFileName(...)
% [FileName,FileNumber] = GuessNextFileName(...)
% 
% r = GuessNextFileName(Prefix,Fmt)
% r = GuessNextFileName(Prefix,Fmt,Suffix)

function FName = GenerateFileName(Prefix,FN,Fmt)
FName = sprintf('%s.%08d.%s',Prefix,FN,Fmt);
end


FileNum     = 1;
FileName    = GenerateFileName(Prefix,FileNum,Fmt);
while exist(FileName,'file')==2
FileNum     = FileNum + 1;
FileName    = GenerateFileName(Prefix,FileNum,Fmt);
end

end
