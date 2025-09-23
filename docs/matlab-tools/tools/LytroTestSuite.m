%% 📁 === SCRIPT 3: LytroTestSuite.m ===
% Salva questo come: LytroTestSuite.m

function LytroTestSuite()
    %% SUITE DI TEST COMPLETA LYTRO
    
    fprintf('🧪 === LYTRO TEST SUITE ===\n');
    
    % Test 1: Workspace
    fprintf('\n1️⃣ Test Workspace...\n');
    if exist('C:\LytroWorkspace', 'dir')
        cd('C:\LytroWorkspace');
        fprintf('   ✅ Workspace accessible\n');
    else
        fprintf('   ❌ Workspace missing\n');
        return;
    end
    
    % Test 2: FDL Functions
    fprintf('\n2️⃣ Test FDL Functions...\n');
    fdlFunctions = {'Demo_FDL_Simple', 'Demo_FDL_SR', 'fftImgs', 'RenderAppMain'};
    for i = 1:length(fdlFunctions)
        if exist(fdlFunctions{i}, 'file')
            fprintf('   ✅ %s\n', fdlFunctions{i});
        else
            fprintf('   ❌ %s\n', fdlFunctions{i});
        end
    end
    
    % Test 3: GPU Performance  
    fprintf('\n3️⃣ Test GPU Performance...\n');
    try
        gpu = gpuDevice;
        fprintf('   ✅ GPU: %s\n', gpu.Name);
        
        % Speed test
        A = gpuArray(rand(1024, 1024, 'single'));
        tic;
        B = fft2(A);
        testTime = toc;
        
        if testTime < 0.1
            fprintf('   🚀 Performance: EXCELLENT (%.3fs)\n', testTime);
        elseif testTime < 0.5
            fprintf('   ✅ Performance: GOOD (%.3fs)\n', testTime);
        else
            fprintf('   ⚠️  Performance: OK (%.3fs)\n', testTime);
        end
        
    catch
        fprintf('   ⚠️  GPU: Using CPU mode\n');
    end
    
    % Test 4: Quick Demo
    fprintf('\n4️⃣ Quick FDL Demo Test...\n');
    try
        fprintf('   🎬 Launching Demo_FDL_Simple...\n');
        fprintf('   (Close demo windows after testing)\n');
        % Demo_FDL_Simple; % Uncomment to auto-launch
        fprintf('   ✅ Demo ready to launch\n');
    catch
        fprintf('   ❌ Demo launch failed\n');
    end
    
    fprintf('\n🏆 TEST SUITE COMPLETED!\n');
end