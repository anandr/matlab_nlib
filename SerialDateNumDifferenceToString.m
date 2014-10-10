function res = SerialDateNumDifferenceToString(DT)
% Returns string representation of a time interval DT
% res = SerialDateNumDifferenceToString(DT);
% 
% Example
%   t0 = now;
%   Passed = SerialDateNumDifferenceToString( now - t0 );

Fractions       = [ 1           1/24        1/24/60         1/24/60/60      ];
FractionStrs    = { 'd'         'h'         'm'             's'             };
FractionFmts    = { '%02d'      '%02d'      '%02d'          '%06.3f'        };
NFr             = length(Fractions);
tt              = DT;
res             = '';
for k=1:NFr
    VV = [];
    if k~=NFr
        if (tt/Fractions(k))>1
            VV      = floor(tt/Fractions(k));
            tt      = mod(tt,Fractions(k));
        end
    else
        VV          = tt/Fractions(k);
    end
    if ~isempty(VV)
        res         = sprintf( ['%s ' FractionFmts{k} '%s'],   res,    VV,     FractionStrs{k}     );
    end
end

end
