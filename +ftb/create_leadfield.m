function cfg = create_leadfield(cfg)
%
%   Input
%   -----
%   cfg.stage
%       struct of short names for each pipeline stage
%   cfg.stage.headmodel
%       head model name
%   cfg.stage.electrodes
%       electrode configuration name
%   cfg.stage.leadfield
%       lead field name
%
%   cfg.folder
%       (optional, default = 'output/stage2_leadfield/name')
%       output folder for head model data
%   cfg.ft_prepare_leadfield
%       options for ft_prepare_leadfield, see ft_prepare_leadfield
%
%   cfg.force
%       force recomputation, default = false
%
%   Output
%   ------
%   cfg.files

if ~isfield(cfg, 'force'), cfg.force = false; end

% Populate the stage information
cfg = ftb.get_stage(cfg);

% Set up the output folder
cfg = ftb.setup_folder(cfg);

%% Load head model config
cfghm = ftb.load_config(cfg.stage.headmodel);
cfgelec = ftb.load_config(cfg.stage.electrodes);

%% Set up file names
cfg.files.leadfield = fullfile(cfg.folder, 'leadfield.mat');

%% Compute leadfield

cfgin = cfg.ft_prepare_leadfield;
cfgin.elecfile = cfgelec.files.elec_aligned;
cfgin.hdmfile = cfghm.files.mri_headmodel;
if ~exist(cfg.files.leadfield,'file') || cfg.force
    leadfield = ft_prepare_leadfield(cfgin);
    save(cfg.files.leadfield, 'leadfield');
else
    fprintf('%s: skipping ft_prepare_leadfield, already exists\n',mfilename);
end

%% Save the config file
ftb.save_config(cfg);

end