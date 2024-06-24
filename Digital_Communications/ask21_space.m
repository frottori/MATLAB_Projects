% Ανάγνωση κειμένου από αρχείο
msg = 'international morse code encodes the basic latin letters a to z one accented latin letter the arabic numerals and a small set of punctuation and procedural signals there is no distinction between upper and lower case letters each morse code symbol is formed by a sequence of dits and dahs the dit duration can vary for signal clarity and operator skill but for any one message once established it is the basic unit of time measurement in morse code the duration of a dah is three times the duration of a dit although some telegraphers deliberately exaggerate the length of a dah for clearer signalling each dit or dah within an encoded character is followed by a period of signal absence called a space equal to the dit duration the letters of a word are separated by a space of duration equal to three dits and words are separated by a space equal to seven dits';
% Αρχικοποίηση πίνακα cnt για το πλήθος κάθε γράμματος και πίνακα για κάθε σύμβολο
symb = cell(1, 27);  

% Αρχικοποίηση πίνακα συμβόλων
for i=1:26
    symb{i} = char(i+96);
end
symb{27} = ' ';

cnt = zeros(1, 27); 
% Πλήθος εμφανίσεων γραμμάτων και του κενού
for i=1:length(msg)
    if isletter(msg(i))                 % Αν είναι λατινικό μικρό γράμμα
        index = double(msg(i)) - 96;    % Μετατροπή σε δείκτη για τον πίνακα cnt (ASCII 97-122 για τα a-z) 
        cnt(index) = cnt(index) + 1;    % αύξηση πλήθους αυτούς του γράμματος
    elseif isspace(msg(i))              % αν είναι το κενό 
        cnt(27) = cnt(27) + 1;          % 27 γιατί το αλφάβητο έχει 26 γράμματα
    end
end

% Συνολικός αριθμός χαρακτήρων
num = sum(cnt);
% Υπολογισμός πιθανοτήτων εμφάνισης κάθε γράμματος
prob = cnt/num;

% Δείκτης για τα στοιχεία που θα αφαιρεθούν (δηλαδή τα γράμματα που δεν υπάρχουν)
rmv = [];

% Διάσχιση πινάκων prob και symb για να βρω τους δείκτες που 
% τα γράμματα και οι πιθανότητες που δεν υπάρχουν
for i = 1:27
    % Άμα η πιθανότητα είναι 0 τότε δνε υπάρχει το γράμμα στο κείμενο
    if prob(i) == 0
        % Προσθήκη στον πίνακα rmv τον δείκτη
        rmv = [rmv, i];
    end
end

% Αφαίρεση όλων των στοιχείων που δεν υπάρχουν και από τους δύο πίνακες
prob(rmv) = [];
symb(rmv) = [];

% Εμφάνιση πιθανοτήτων και συμβόλων που έχει το κείμενο
disp('Πιθανότητες:');
disp(prob);
disp('Σύμβολα:');
disp(symb);

% Λεξικό Κώδικα Huffman
dict = huffmandict(symb, prob); % αντιστοίχιση συμβόλων με κωδικολέξη
disp('Λεξικό Κώδικα Huffman:')
disp(dict);

% Κωδικοποίηση Huffman του μηνύματος
binstream = huffmanenco(msg, dict);

% Υπολογισμός Εντροπίας (H)
H = myentropy(prob);

disp('Εντροπία (H):');
disp(H);

% Υπολογισμός μέσου μήκους κωδικολέξης
L = 0;  % αρχικοποίηση για το άθροισμα

% Διάσχιση κάθε συμβόλου απο το λεξικό Huffman
for i = 1:length(dict)
    % Παίρνω την κωδικολέξη για το τρέχον σύμβολο i (2 γιατί η κωδικολέξη ειναι στην δευτερη στήλη)
    code = dict{i, 2};
    % Το μέσο μήκος της τρέχουσας κωδικολέξης είναι το γινόμενο του μήκους με την πιθανότητα του συμβόλου
    L = L + length(code) * prob(i);
end

disp('Μέσο μήκος κωδικολέξης (L):');
disp(L);

% Υπολογισμός Απόδοσης (η)
e = H / L;
% Υπολογισμός Πλεονασμόυ (R)
r = 1 - e;

disp('Απόδοση (η):');
disp(e);
disp('Πλεονασμός (R):');
disp(r);

%! Ποιο γράμμα εμφανίζεται πιο συχνά και ποια κωδική λέξη του αποδίδεται? Ποιο γράμμα εμφανίζεται 
%! πιο σπάνια και ποια κωδική λέξη του αποδίδεται? 

min = prob(1);
max = prob(1);
min_i = 1;
max_i = 1;
for i=1:length(prob)
    if prob(i) > max
        max_symb = symb(i);
        max_i = i;
    end
    if prob(i) < min
        min_symb = symb(i);
        min_i = i;
    end
end

disp('Το γράμμα που εμφανίζεται πιο συχνά είναι:');
disp(max_symb);
disp('Και η κωδική λέξη του είναι:');
disp(dict{max_i, 2});
disp('Το γράμμα που εμφανίζεται πιο σπάνια είναι:');
disp(min_symb);
disp('Και η κωδική λέξη του είναι:');
disp(dict{min_i, 2});

bar(prob,'m');
xlabel('Γράμματα');
ylabel('Πιθανότητες');
title('Συχνότητα Γραμμάτων στο κείμενο');
xticks(1:length(prob));  % το x θα είναι όσο το πλήθος των γραμμάτων που υπάρχουν στο κείμενο
xticklabels(symb); % να εμφανίζονται τα γράμματα στον άξονα x
grid on;

%! Συγκρίνετε τις πιθανότητες εμφάνισης των γραμμάτων από το κείμενο 
%! (επιλέξτε μερικά μόνο) με τις πιθανότητες εμφάνισης των γραμμάτων 
%! σε αγγλικά κείμενα όπως παρουσιάζονται στο παραπάνω γράφημα

% Βλέπουμε από το γράφημα για την συχνότητα του κάθε γράμματος στο κέιμενο ότι 
% ισοδυναμεί με αυτό που παρουσάζεται γενικά σε αγγλικά κείμενα. 
% Π.χ το e και στην πραγματικότητα είναι το πιο συχνό γράμμα στην αγγλική γλώσσα
% όπως και στο κειμενό μας. Αντίστοιχα το z είναι το λιγότερο συχνό γράμμα στην αγγλική γλώσσα
% όπως και στο κείμενο μας. Και γενικά οι συχνότητες των γραμμάτων στο κείμενο μας ακολουθούν
% τις συχνότητες των γραμμάτων που ισχυει γενικά για τα αγγλικά γράμματα.

%! Συγκρίνετε επίσης τον κώδικα Huffman που δημιουργήσατε με την κωδικοποίηση Morse