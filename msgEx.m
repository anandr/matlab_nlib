function msgEx(Style,fmt,varargin)
% MSGEX prints formatted message
%
% Output includes date/time and caller name.
% If caller from MatLAb worker (see matlabpool) the message also includes worker ID
%
% Syntax:
%   msgEx(        format, data )
%   msgEx('msg',  format, data )
%   msgEx('warn', format, data )
%   msgEx('err',  format, data )
%

WorkerString            = '';
try
    t                       = getCurrentTask();
    if ~isempty(t)
        WorkerString            = sprintf('W%02d@',t.ID);
    end
catch
    WorkerString            = '';
end

switch lower(Style)
    case {'warn','warning'},    Style = mat2str([1.0,0.5,0.0]/2); Prefix = 'WARNING';
    case {'msg','message'},     Style = mat2str([0.0,0.5,1.0]/2); Prefix = 'MESSAGE';
    case {'err','error'},       Style = mat2str([1.0,0.0,0.0]/2); Prefix = '!ERROR!';
    otherwise,                  Style = mat2str([0.5,0.5,0.5]/2); Prefix = '';
end

[CallerFile,CallerName,CallerLine] = GetCallerFileFunctionLine;

fprintf(' %s %s%s <a href="matlab: opentoline(''%s'',%d)">%s@%d</a>: %s\n',Prefix,WorkerString,datestr(now,'HH:MM:SS.FFF'), CallerFile,CallerLine, CallerName,CallerLine, sprintf(fmt,varargin{:}));

end

