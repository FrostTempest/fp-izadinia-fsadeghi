function [words, sizes] = read_gt(im_name)

% im_name = 'd3_002';


gt_path = './svg/';

gt_file = [gt_path, im_name, '.svg'];


theStruct = parseXML(gt_file);

words = {};
sizes = [];
for i = 1 : length(theStruct.Children(2).Children)
    try
        s = theStruct.Children(2).Children(i).Attributes(1).Value;
        w = theStruct.Children(2).Children(i).Children(1).Data;
        
        inds = strfind(s,': ');
        inde = strfind(s,'px');
        ss = str2num(s(inds(1)+2:inde(1)-1));
        
        words = [words; w];
        sizes = [sizes; ss];
    catch
    end
end


