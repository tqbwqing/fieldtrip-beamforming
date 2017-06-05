function obj = get_aal_coarse_19(obj,varargin)
%GET_AAL_COARSE_19 adds patches for the AAL coarse 19 configuration
%   GET_AAL_COARSE_19(...) returns a coarse partition of the AAL
%   atlas into 19 patches
%
%   Parameters
%   ----------
%   type (string, default = 'all')
%       configuration type
%       all - all regions
%       outer - omits Basal Ganglia, Limbic, Insula
%   verbosity (default = 0)
%       toggles verbosity level
%   
%   Output
%   ------
%   updates the following fields
%   name (string)
%       name of patch
%   labels (cell array of string)
%       anatomical labels that make up the patch, each patch contains a
%       mutually exclusive set of labels
%   atlasfile (string)
%       path of associated atlas file

p = inputParser;
addParameter(p,'outer',false,@islogical);
addParameter(p,'cerebellum',true,@islogical);
addParameter(p,'hemisphere','both',@(x) any(validatestring(x,{'left','right','both'})));
addParameter(p,'v1',false,@islogical);
addParameter(p,'verbosity',0);
parse(p,varargin{:});

flag_left = true;
flag_right = true;

% parse hemisphere
switch p.Results.hemisphere
    case 'right'
        flag_left = false;
    case 'left'
        flag_right = false;
    otherwise
        error('unknown hemisphere %s',p.Results.hemisphere);
end

% Set up an atlas
obj.atlasfile = fullfile(ft_get_dir(),'template','atlas','aal','ROI_MNI_V4.nii');

if flag_left
    name = 'Prefrontal Left';
    labels = {...
        'Frontal_Sup_L',...
        'Frontal_Sup_Orb_L',...
        'Frontal_Mid_L',...
        'Frontal_Mid_Orb_L',...
        'Frontal_Inf_Oper_L',...
        'Frontal_Inf_Tri_L',...
        'Frontal_Inf_Orb_L',...
        'Frontal_Sup_Medial_L',...
        'Frontal_Med_Orb_L',...
        'Rolandic_Oper_L',...
        'Rectus_L',...
        'Olfactory_L'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_right
    name = 'Prefrontal Right';
    labels = {...
        'Frontal_Sup_R',...
        'Frontal_Sup_Orb_R',...
        'Frontal_Mid_R',...
        'Frontal_Mid_Orb_R',...
        'Frontal_Inf_Oper_R',...
        'Frontal_Inf_Tri_R',...
        'Frontal_Inf_Orb_R',...
        'Frontal_Sup_Medial_R',...
        'Frontal_Med_Orb_R',...
        'Rolandic_Oper_R',...
        'Rectus_R',...
        'Olfactory_R'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_left
    name = 'Motor Left';
    labels = {...
        'Precentral_L',...
        'Supp_Motor_Area_L'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_right
    name = 'Motor Right';
    labels = {...
        'Precentral_R',...
        'Supp_Motor_Area_R'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if ~p.Results.outer
    if flag_left
        name = 'Basal Ganglia Left';
        labels = {...
            'Pallidum_L',...
            'Caudate_L',...
            'Putamen_L',...
            'Thalamus_L'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
    
    if flag_right
        name = 'Basal Ganglia Right';
        labels = {...
            'Pallidum_R',...
            'Caudate_R',...
            'Putamen_R',...
            'Thalamus_R'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
end

if ~p.Results.outer
    if flag_left
        name = 'Insula Left';
        labels = {...
            'Insula_L'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
    
    if flag_right
        name = 'Insula Right';
        labels = {...
            'Insula_R'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
end

if flag_left
    name = 'Parietal Left';
    labels = {...
        'Parietal_Sup_L',...
        'Parietal_Inf_L',...
        'SupraMarginal_L',...
        'Angular_L',...
        'Precuneus_L',...
        'Postcentral_L',...
        'Paracentral_Lobule_L'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_right
    name = 'Parietal Right';
    labels = {...
        'Parietal_Sup_R',...
        'Parietal_Inf_R',...
        'SupraMarginal_R',...
        'Angular_R',...
        'Precuneus_R',...
        'Postcentral_R',...
        'Paracentral_Lobule_R'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_left
    name = 'Temporal Left';
    labels = {...
        'Temporal_Mid_L',...
        'Temporal_Inf_L',...
        'Temporal_Pole_Sup_L',...
        'Temporal_Pole_Mid_L',...
        'Temporal_Sup_L',...
        'Heschl L'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_right
    name = 'Temporal Right';
    labels = {...
        'Temporal_Mid_R',...
        'Temporal_Inf_R',...
        'Temporal_Pole_Sup_R',...
        'Temporal_Pole_Mid_R',...
        'Temporal_Sup_R',...
        'Heschl R'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_left
    name = 'Occipital Left';
    labels = {...
        'Occipital_Sup_L',...
        'Occipital_Mid_L',...
        'Occipital_Inf_L',...
        'Cuneus_L',...
        'Fusiform_L',...
        'Lingual_L'};
    if ~p.Results.v1
        labels = [labels 'Calcarine_L'];
    end
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if flag_right
    name = 'Occipital Right';
    labels = {...
        'Occipital_Sup_R',...
        'Occipital_Mid_R',...
        'Occipital_Inf_R',...
        'Cuneus_R',...
        'Fusiform_R',...
        'Lingual_R'};
    if ~p.Results.v1
        labels = [labels 'Calcarine_R'];
    end
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if p.Results.v1
    name = 'Calcarine Mid';
    labels = {...
        'Calcarine_L',...
        'Calcarine_R'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

if ~p.Results.outer
    if flag_left
        name = 'Limbic Left';
        labels = {...
            'Hippocampus_L',...
            'ParaHippocampal_L',...
            'Amygdala_L',...
            'Cingulum_Ant_L',...
            'Cingulum_Mid_L',...
            'Cingulum_Post_L'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
    
    if flag_right
        name = 'Limbic Right';
        labels = {...
            'Hippocampus_R',...
            'ParaHippocampal_R',...
            'Amygdala_R',...
            'Cingulum_Ant_R',...
            'Cingulum_Mid_R',...
            'Cingulum_Post_R'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
end

if p.Results.cerebellum
    if flag_left
        name = 'Cerebellum Left';
        labels = {...
            'Cerebelum_Crus1_L',...
            'Cerebelum_Crus2_L',...
            'Cerebelum_3_L',...
            'Cerebelum_4 5_L',...
            'Cerebelum_6_L',...
            'Cerebelum_7b_L',...
            'Cerebelum_8_L',...
            'Cerebelum_9_L',...
            'Cerebelum_10_L'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
    
    if flag_right
        name = 'Cerebellum Right';
        labels = {...
            'Cerebelum_Crus1_R',...
            'Cerebelum_Crus2_R',...
            'Cerebelum_3_R',...
            'Cerebelum_4 5_R',...
            'Cerebelum_6_R',...
            'Cerebelum_7b_R',...
            'Cerebelum_8_R',...
            'Cerebelum_9_R',...
            'Cerebelum_10_R'};
        obj.add_patch(ftb.PatchLabel(name,labels));
    end
    
    name = 'Cerebellum Mid';
    labels = {...
        'Vermis_1_2',...
        'Vermis_3',...
        'Vermis_4_5',...
        'Vermis_6',...
        'Vermis_7',...
        'Vermis_8',...
        'Vermis_9',...
        'Vermis_10'};
    obj.add_patch(ftb.PatchLabel(name,labels));
end

end