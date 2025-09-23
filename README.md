# Lytro Processing Pipeline

**Trasforma le tue foto Lytro Illum in immagini straordinarie con super-risoluzione, controlli di messa a fuoco avanzati e rendering professionale.**

## 🎯 Cosa puoi ottenere

- **Super-risoluzione intelligente**: Porta le tue foto da 2340×1560 fino a 9360×6240 pixel con dettagli realistici
- **Controlli di messa a fuoco post-scatto**: Cambia il punto di fuoco dopo aver scattato la foto
- **Apertura virtuale**: Regola la profondità di campo come se avessi obiettivi diversi
- **Prospettive multiple**: Sposta leggermente il punto di vista per correggere la composizione
- **Effetti bokeh personalizzati**: Forme diverse per lo sfondo sfocato (circolare, esagonale, quadrato)
- **Riduzione rumore avanzata**: Elimina il noise mantenendo i dettagli

## 🚀 Avvio Rapido

### Prerequisiti
- **MATLAB** R2017a o superiore
- **Windows** 10/11 (testato)
- **8GB RAM** minimi, 16GB consigliati per super-risoluzione 4x
- **GPU NVIDIA** opzionale ma fortemente consigliata per prestazioni

### Installazione in 3 minuti

1. **Clona questa repository**
   ```bash
   git clone https://github.com/mvicenzi83/lytro-processing-pipeline.git
   cd lytro-processing-pipeline
   ```

2. **Configura MATLAB**
   ```matlab
   % In MATLAB, naviga alla cartella del progetto e poi:
   addpath(genpath('FDL-Toolbox'));
   addpath(genpath('LFToolbox-CLIM_VSENSE')); 
   addpath(genpath('LFToolbox_Recolouring_HPR'));
   addpath(genpath('LFBM5D'));
   savepath;
   ```

3. **Test rapido**
   ```matlab
   Demo_FDL_Simple
   ```
   Se vedi un'immagine con controlli interattivi, sei pronto! 🎉

## 📖 Workflow Completo

### Step 1: Preparazione Files
```matlab
% Converti i file .lfr della tua Lytro Illum
lf_raw = loadLytroLFR('path/to/your/photo.lfr');
save('mia_foto_base.mat', 'lf_raw');
```

### Step 2: Miglioramenti Strutturali
```matlab
% Carica l'immagine convertita
load('mia_foto_base.mat');

% Super-risoluzione (2x, 3x, o 4x)
enhanced_lf = ComputeFDL_SuperRes_gpu(lf_raw, 'factor', 2);

% Riduzione rumore avanzata con LFBM5D
clean_lf = LFBM5D_denoising(enhanced_lf, 'sigma', 10);

% Correzione colori automatica (opzionale)
recolored_lf = LF_recolouring(clean_lf, 'auto_balance', true);

% Salva il risultato elaborato
save('mia_foto_enhanced.mat', 'recolored_lf');
```

### Step 3: Controlli Creativi
```matlab
% Apri l'interfaccia interattiva
load('mia_foto_enhanced.mat');
RenderAppMain(recolored_lf);
```

Dalla GUI puoi:
- Cliccare sull'immagine per cambiare il punto di fuoco
- Regolare l'apertura virtuale per controllare lo sfondo
- Spostare il punto di vista
- Cambiare la forma del bokeh
- Salvare il risultato finale

## 🛠 Toolkit Inclusi

### FDL-Toolbox (Core Engine)
- **Cosa fa**: Il motore principale per la rappresentazione Fourier Disparity Layer
- **Punti di forza**: Super-risoluzione, rendering veloce, controlli precisi
- **Origine**: [LEPENDUM/FDL-Toolbox](https://github.com/LEPENDUM/FDL-Toolbox)

### LFToolbox-CLIM_VSENSE (Lytro Support)
- **Cosa fa**: Caricamento e gestione dei file Lytro Illum (.lfr)
- **Punti di forza**: Decodifica nativa, calibrazione automatica, metadati completi
- **Origine**: [V-Sense/LFToolbox-CLIM_VSENSE](https://github.com/V-Sense/LFToolbox-CLIM_VSENSE)

### LFToolbox_Recolouring_HPR (Color Enhancement)
- **Cosa fa**: Correzione automatica e miglioramento dei colori per Light Field
- **Punti di forza**: Recoloring intelligente, bilanciamento automatico, correzione illuminazione
- **Origine**: [V-Sense/LFToolbox_Recolouring_HPR](https://github.com/V-Sense/LFToolbox_Recolouring_HPR)

### LFBM5D (Advanced Denoising)
- **Cosa fa**: Block-matching 5D per riduzione rumore di livello professionale
- **Punti di forza**: Preserva dettagli fini, mantiene coerenza spaziale-angolare
- **Origine**: [V-Sense/LFBM5D](https://github.com/V-Sense/LFBM5D)

## 🎨 Esempi Pratici

### Ritratti (Consigliato)
```matlab
% Parametri ottimali per ritratti
sr_factor = 2;           % Non esagerare per mantenere naturale la pelle
lambda = 0.08;           % Regolarizzazione moderata
aperture_size = 0.7;     % Bello sfondo sfocato
focus_distance = 0.3;    % Focus sul soggetto in primo piano
```

### Paesaggi
```matlab
% Parametri per paesaggi
sr_factor = 3;           % Puoi spingere di più sui dettagli
lambda = 0.03;           % Più dettagli sono benvenuti
aperture_size = 0.2;     % Tutto abbastanza a fuoco
focus_distance = 0.8;    % Focus verso l'infinito
```

### Macro (Oggetti Vicini)
```matlab
% Parametri per fotografia macro
sr_factor = 4;           % Massimo dettaglio
lambda = 0.02;           % Ogni dettaglio conta
aperture_size = 0.9;     % Sfondo molto sfocato
focus_distance = 0.1;    % Focus molto vicino
```

## ⚡ Consigli per le Prestazioni

### GPU vs CPU
- **Con GPU NVIDIA**: Usa le funzioni `_gpu` per prestazioni 5-10x superiori
- **Solo CPU**: Usa le versioni standard, ci vuole più tempo ma funziona

### Gestione Memoria
- **Super-risoluzione 2x**: ~4GB RAM
- **Super-risoluzione 4x**: ~8-12GB RAM
- **Tip**: Chiudi altri programmi durante l'elaborazione

### Tempi Tipici
- **Caricamento file .lfr**: 30-60 secondi
- **Super-risoluzione 2x (GPU)**: 2-5 minuti
- **Super-risoluzione 4x (GPU)**: 10-15 minuti
- **Rendering interattivo**: istantaneo! ⚡

## 🔧 Troubleshooting

### "Function not found" 
```matlab
% Ricontrolla i percorsi
addpath(genpath(pwd));
savepath;
which fftImgs  % Dovrebbe mostrare un percorso valido
```

### MATLAB va in crash
- **Causa**: Probabilmente poca memoria GPU
- **Soluzione**: Usa le versioni CPU aggiungendo `_cpu` al nome delle funzioni

### File .lfr non riconosciuti
- **Verifica**: LFToolbox-CLIM_VSENSE sia nel percorso
- **Test**: `which loadLytroLFR` dovrebbe dare un risultato

### Immagini troppo scure/chiare
- **Nella GUI**: Usa i controlli di esposizione
- **Nel codice**: Regola i parametri di gamma correction

## 📚 Approfondimenti

- **Teoria FDL**: `docs/fdl-theory.md` - Come funziona la magia matematica
- **Workflow Avanzati**: `docs/advanced-workflows.md` - Tecniche professionali
- **Sviluppo**: `docs/development.md` - Per chi vuole modificare il codice

## 🤝 Contributi

Questo è un progetto di ricerca e sperimentazione. Se hai miglioramenti o scopri bug:

1. Apri una Issue descrivendo il problema
2. Se hai una soluzione, proponi una Pull Request
3. Condividi i tuoi risultati nella sezione Discussions

## 📄 Licenze e Crediti

- **FDL-Toolbox**: Licenza originale del repository LEPENDUM
- **LFToolbox-CLIM_VSENSE**: Licenza V-Sense research group
- **LFToolbox_Recolouring_HPR**: Licenza V-Sense research group  
- **LFBM5D**: Licenza V-Sense research group

**Questo progetto è per scopi di ricerca e uso personale.**

### Ringraziamenti
- V-Sense research group (Trinity College Dublin) per gli algoritmi fondamentali
- LEPENDUM per l'implementazione FDL-Toolbox
- La community di ricerca sui Light Field per anni di innovazione

---

> **Nota**: Questo toolkit rappresenta anni di ricerca condensati in un workflow utilizzabile. Sperimenta, divertiti, e non aver paura di provare parametri diversi!

🎯 **Happy Light Field Processing!**