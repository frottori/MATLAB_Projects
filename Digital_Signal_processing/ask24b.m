% Με conv()
ttime = 0;
eltime1 = zeros(1,100); % αρχικοποιήση διανύσματος
i=1;                    % δείκτης για το διάνυσμα
for x = 1000:1000:100000
    tic;
    y = conv(x, x);
    t = toc;            % χρόνος για αυτήν την επανάληψη
    ttime = ttime + t;  % συνολικός χρόνος
    eltime1(i) = t;     % χρόνος εκτέλεσης για conv σε vector για κάθε βήμα
    i = i + 1;
end

disp(['Συνολικός χρόνος με conv(): ' num2str(ttime) ' secs']);

% Με linconv()
ttime = 0;
eltime2 = zeros(1,100);
i=1;
for x = 1000:1000:100000
    tic;
    y = linconv(x, x);
    t = toc;           % χρόνος για αυτήν την επανάληψη
    ttime = ttime + t; % συνολικός χρόνος
    eltime2(i) = t;    % χρόνος εκτέλεσης για linconv σε vector για κάθε βήμα
    i = i + 1;
end

disp(['Συνολικός χρόνος με linconv(): ' num2str(ttime) ' secs']);

% Γραφήματα που δείχνουν το χρόνο για κάθε συνέλιξη 
figure;
x = 1000:1000:100000;
plot(x, eltime1,'DisplayName','Χρόνος εκτέλεσης conv()');

hold on;
plot(x, eltime2, '-r','DisplayName','Χρόνος εκτέλεσης linconv()');
ylabel('Χρόνος (secs)');
legend('show');