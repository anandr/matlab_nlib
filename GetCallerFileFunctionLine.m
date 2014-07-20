function varargout = GetCallerFileFunctionLine(ReturnStructureFlag)

% returns caller function information: file, name, line
% 
% [CallerFile,CallerName,CallerLine] = GetCallerFileFunctionLine
% 
% Data = GetCallerFileFunctionLine('ReturnStructure')
%   returns structure with fields
%       file
%       name
%       line
% 

if exist('ReturnStructureFlag','var')
try
ReturnStructure     = strcmpi(ReturnStructureFlag,'ReturnStructure');
catch
ReturnStructure     = false;
end
else
ReturnStructure     = false;
end

file                = 'commandline';
name                = 'commandline';
line                = 0;

%ST                  = dbstack('-completenames',2);
ST                  = dbstack(2);

if ~isempty(ST)
file                = ST(1).file;
name                = ST(1).name;
line                = ST(1).line;
end

if ReturnStructure
varargout{1}        = struct( 'file',file', 'name',name, 'line',line );
else
varargout{1}        = file;
varargout{2}        = name;
varargout{3}        = line;
end

end