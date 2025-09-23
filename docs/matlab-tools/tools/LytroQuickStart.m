%% 📁 === SCRIPT 1: LytroQuickStart.m ===
% Salva questo come: LytroQuickStart.m

function LytroQuickStart()
    %% LYTRO ILLUM - AVVIO RAPIDO WORKSPACE
    % Michele - Setup Professionale
    
    fprintf('🚀 Lytro Illum Quick Start...\n');
    
    % Vai al workspace
    cd('C:\LytroWorkspace');
    
    % Configura tutti i path
    addpath(genpath('C:\LytroWorkspace\Toolboxes\FDL-Toolbox'));
    addpath(genpath('C:\LytroWorkspace\Scripts'));
    savepath;
    
    % Status check
    fprintf('✅ Workspace: %s\n', pwd);
    fprintf('✅ FDL-Toolbox: Configurato\n');
    
    % GPU check
    try
        gpu = gpuDevice;
        fprintf('✅ GPU: %s (%.1f GB)\n', gpu.Name, gpu.TotalMemory/1e9);
    catch
        fprintf('⚠️  GPU: CPU mode\n');
    end
    
    fprintf('🎯 Comandi disponibili:\n');
    fprintf('   Demo_FDL_Simple     % Demo interattivo\n');
    fprintf('   Demo_FDL_SR         % Super-risoluzione\n');
    fprintf('   RenderAppMain       % GUI avanzata\n');
    fprintf('   LytroProjectStatus  % Status progetti\n');
    
    fprintf('🚀 READY TO GO!\n');
end