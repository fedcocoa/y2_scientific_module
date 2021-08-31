in_filename = "handel.wav";
out_filename = "out_" + in_filename;

% read in wav sample
[audio_data, samplerate] = audioread(in_filename);

M = 5;
damp = 0.001;
freq_min = 50;
freq_max = 6000;
freq_width = 5000;
volume = 0.20;

modified_data = mwahwah(audio_data, samplerate, M, damp, freq_min, freq_max, freq_width)*volume;

% subplot(2,1,1);
% plot(audio_data);
% subplot(2,1,2);
% plot(modified_data);
audiowrite(out_filename, modified_data, samplerate);