function varargout = textfileLoadToCellArray(FileName)
% Strings            = textfileLoadToCellArray(FileName);
% [Strings,NStrings] = textfileLoadToCellArray(FileName);
error(nargchk(1, 1, nargin));
% exist(FileName,'file')
assert( exist(FileName,'file')==2 , BuildWarnErrID('FileNotFound'), 'File not found: "%s"',FileName );
fid         = fopen(FileName,'r');
data        = textscan(fid,'%s','Delimiter','\n');
fclose(fid);
varargout{1} = data{1};
if  nargout>=2, varargout{2} = length(varargout{1});    end
end