function [lineData, logFooter, linesFooter] = tapas_physio_read_physlogfiles_siemens_raw(...
    fileNameLog)
% Read in raw data/footer lines of logfiles, without data selection/sorting
%
% [lineData, linesFooter] = tapas_physio_read_physlogfiles_siemens_raw(...
%        fileNameLog)
%
% IN
%   fileNameLog     file name of physiological log, e.g. *.ecg
%
% OUT
%   lineData        all recording amplitude samples are saved in first line
%                   of file
%   logFooter       struct() of read-out meta information from log file, i.e. 
%                   LogStart/StopTimeSeconds
%                   ScanStart/StopTimeSeconds
%   linesFooter     all meta-information (e.g. sampling start/stop) is
%                   saved in remaining lines of log file
%
% EXAMPLE
%   tapas_physio_read_physlogfiles_siemens_raw
%
%   See also
%
% Author: Lars Kasper
% Created: 2016-02-29
% Copyright (C) 2016 TNU, Institute for Biomedical Engineering,
%                    University of Zurich and ETH Zurich.
%
% This file is part of the TAPAS PhysIO Toolbox, which is released under the terms of the GNU General Public
% License (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.
%
% $Id$

fid             = fopen(fileNameLog);

if verLessThan('matlab', '8.5') % use buffer size for speed-up, as long as it exists
    C               = textscan(fid, '%s', 'Delimiter', '\n', 'bufsize', 1e9);
else
    C               = textscan(fid, '%s', 'Delimiter', '\n');
end

fclose(fid);

linesFooter = C{1}(2:end);
lineData = C{1}{1};

%Get time stamps from footer:

logFooter.LogStartTimeSeconds =   str2num(char(regexprep(linesFooter(~cellfun(@isempty,strfind(linesFooter,...
    'LogStartMDHTime'))),'\D',''))) / 1000;
logFooter.LogStopTimeSeconds =    str2num(char(regexprep(linesFooter(~cellfun(@isempty,strfind(linesFooter,...
    'LogStopMDHTime'))),'\D',''))) / 1000;

% MPCU  = Computer who controls the scanner
% MDH   = Compute who is the host; console

% This is just a different time-scale, I presume, it does definitely
% NOT match with the Acquisition time in the DICOM-headers
logFooter.ScanStartTimeSeconds = str2num(char(regexprep(linesFooter(~cellfun(@isempty,strfind(linesFooter,...
    'LogStartMPCUTime'))),'\D','')));
logFooter.ScanStopTimeSeconds = str2num(char(regexprep(linesFooter(~cellfun(@isempty,strfind(linesFooter,...
    'LogStopMPCUTime'))),'\D','')));

