function msg(fmt,varargin)
% msg(fmt,varargin)
% Prints formatted message

ST          = dbstack(1);
fname       = ST(1).file;
if strcmpi( fname(end-1:end) , '.m' )
    fname = fname(1:end-2);
end
fprintf('%s %s: %s\n',datestr(now,'yyyy/mm/dd@HH:MM:SS.FFF'),fname,sprintf(fmt,varargin{:}));
end
