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
%

WorkerString            = '';
try
    t                       = getCurrentTask();
    if ~isempty(t)
        %WorkerMsg               = sprintf(' [W:02d]',t.ID);
        WorkerString            = sprintf('W%02d@',t.ID);
    end
catch
    WorkerString            = '';
end

% if exist('Style','var')
%     narginchk(2,inf);
%     Style                   = varargin{1};
%     fmt                     = varargin{2};
%     if nargin>3
%         params                  = {varargin{3:end}}
%     else
%         params                  = {}
%     end
% else
%     narginchk(1,inf);
%     Style                   = 'msg';
%     fmt                     = varargin{1};
%     if nargin>2
%         params                  = {varargin{2:end}}
%     else
%         params                  = {}
%     end
% end

switch lower(Style)
    case {'warn','warning'},    Style = mat2str([1.0,0.5,0.0]/2);
    case {'msg','message'},     Style = mat2str([0.0,0.5,1.0]/2);
    otherwise,                  Style = mat2str([0.5,0.5,0.5]/2);
end

[CallerFile,CallerName,CallerLine] = GetCallerFileFunctionLine;

fprintf(' ');  % to avoid strange random colors
cprintf(Style, '%s%s %s/%s@%d: %s\n',WorkerString,datestr(now,'HH:MM:SS.FFF'),CallerFile,CallerName,CallerLine,sprintf(fmt,varargin{:}));

end
