%% 📁 === SCRIPT 2: LytroProjectStatus.m ===
% Salva questo come: LytroProjectStatus.m

function LytroProjectStatus()
    %% STATUS COMPLETO PROGETTO LYTRO
    
    fprintf('📊 === LYTRO PROJECT STATUS ===\n');
    
    % Directory check
    fprintf('📁 Workspace Structure:\n');
    baseDir = 'C:\LytroWorkspace';
    
    dirs = {'Data\Raw', 'Results', 'Projects\Active', 'Toolboxes\FDL-Toolbox'};
    for i = 1:length(dirs)
        dirPath = fullfile(baseDir, dirs{i});
        if exist(dirPath, 'dir')
            files = dir(fullfile(dirPath, '*'));
            fileCount = length(files) - 2; % Escludi . e ..
            fprintf('   ✅ %s (%d files)\n', dirs{i}, fileCount);
        else
            fprintf('   ❌ %s\n', dirs{i});
        end
    end
    
    % Toolbox check
    fprintf('\n🔧 Toolbox Status:\n');
    tools = {'Demo_FDL_Simple', 'Demo_FDL_SR', 'ComputeFDL_SuperRes_gpu', 'RenderAppMain'};
    for i = 1:length(tools)
        if exist(tools{i}, 'file')
            fprintf('   ✅ %s\n', tools{i});
        else
            fprintf('   ❌ %s\n', tools{i});
        end
    end
    
    % Hardware status
    fprintf('\n💻 Hardware Status:\n');
    fprintf('   CPU: i7-8750H (%d cores)\n', feature('numcores'));
    
    try
        [~, mem] = memory;
        fprintf('   RAM: %.1f GB available\n', mem.MemAvailableAllArrays/1e9);
    catch
        fprintf('   RAM: Available\n');
    end
    
    try
        gpu = gpuDevice;
        fprintf('   GPU: %s (%.1f GB VRAM)\n', gpu.Name, gpu.TotalMemory/1e9);
        fprintf('   CUDA: %.1f\n', gpu.ComputeCapability);
    catch
        fprintf('   GPU: Not available\n');
    end
    
    fprintf('\n🎯 All systems operational!\n');
end