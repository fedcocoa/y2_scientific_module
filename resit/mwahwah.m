function y_out = mwahwah(x, Fs, M, damp, Fmin, Fmax, Fw)

    % Increment value that is used on Fmin to deteremine low and high end
    % bandpass filter
    Finc = (Fmax-Fmin)/M;
    
    for i = 1:M
        yb(:,i) = bandpass(x, Fs, damp, Fmin, Fmin +Finc, Fw);
        Fmin = Fmin + Finc; % Increment Fmin to next bandpass
    end
    
    %Mix signals and normalise
    y_out = sum(yb,2);
    max_y_out = max(abs(y_out));
    y_out = y_out./max_y_out;
    return
end