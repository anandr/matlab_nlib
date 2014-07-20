function msgEx(Style,fmt,varargin)
% msgEx(Style,fmt,varargin)

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

switch lower(Style)
    case {'warn','warning'},    Style = mat2str([1.0,0.5,0.0]/2);
    case {'msg','message'},     Style = mat2str([0.0,0.5,1.0]/2);
end

ST                      = dbstack(1);
fname                   = ST(1).file;
if strcmpi( fname(end-1:end) , '.m' )
    fname                   = fname(1:end-2);
end
fname = [fname ':'];
% if ~isempty(WorkerString)
%     fname = sprintf('%-40s',fname);
% end

fprintf(' ');  % to avoid strange random colors
%cprintf(Style, '%s %s%s: %s\n',datestr(now,'yyyy/mm/dd@HH:MM:SS.FFF'),fname,WorkerMsg,sprintf(fmt,varargin{:}));
%cprintf(Style, '%s %s%s %s \n',datestr(now,'HH:MM:SS.FFF'),WorkerString,fname,sprintf(fmt,varargin{:}));
cprintf(Style, '%s%s %s %s \n',WorkerString,datestr(now,'HH:MM:SS.FFF'),fname,sprintf(fmt,varargin{:}));
end
