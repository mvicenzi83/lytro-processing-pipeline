%% 📖 === GUIDA STEP-BY-STEP SALVATA ===
% Salva questo come: LytroGuideStepByStep.m

%% === LYTRO ILLUM RESURRECTION - GUIDA COMPLETA ===
% Michele - Hardware: i7-8750H + 40GB RAM + Quadro P2000
% Data creazione: [oggi]

%% 🎯 STEP 1: AVVIO RAPIDO WORKSPACE
% Comando da lanciare SEMPRE all'inizio di ogni sessione:
LytroQuickStart

%% 🧪 STEP 2: VERIFICA SISTEMA (opzionale)
% Per controllare che tutto funzioni:
LytroTestSuite

%% 📊 STEP 3: STATUS PROGETTI (opzionale)  
% Per vedere lo stato dei tuoi progetti:
LytroProjectStatus

%% 🎬 STEP 4: DEMO INTERATTIVO BASE
% Il tuo primo successo - rendering interattivo:
Demo_FDL_Simple
% RISULTATO: 2 finestre con controlli refocus, aperture, bokeh

%% 🚀 STEP 5: SUPER-RISOLUZIONE GPU
% Test super-risoluzione con la tua Quadro P2000:
Demo_FDL_SR
% RISULTATO: Processing avanzato con upscaling

%% 🎮 STEP 6: GUI AVANZATA (quando disponibile)
% Interfaccia grafica completa:
% RenderAppMain
% RISULTATO: GUI professionale per editing

%% 📂 STEP 7: LAVORARE CON I TUOI FILE .LFP
% 1. Copia file .lfp in: C:\LytroWorkspace\Data\Raw\
% 2. Usa Demo_FDL_View_Extract per processing Lytro specifico
% NOTA: Richiede anche V-Sense Toolbox

%% 🔄 WORKFLOW TIPO SESSIONE:
% 1. LytroQuickStart           % Setup
% 2. Demo_FDL_Simple          % Test/warm-up  
% 3. [Lavoro con i tuoi dati]  % Processing
% 4. [Salva risultati]         % Export

%% 🆘 TROUBLESHOOTING:
% - Se errore "function not found": LytroQuickStart
% - Se GPU lenta: Chiudi altri programmi
% - Se memoria piena: Riavvia MATLAB
% - Se tutto va male: LytroTestSuite per diagnostica

%% 🎯 COMANDI ESSENZIALI SEMPRE DISPONIBILI:
% LytroQuickStart      - Avvio rapido
% Demo_FDL_Simple      - Demo interattivo  
% Demo_FDL_SR         - Super-risoluzione
% LytroProjectStatus  - Status check
% LytroTestSuite      - Test completo