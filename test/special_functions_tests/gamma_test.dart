import 'package:test/test.dart';

import 'package:dart_numerics/dart_numerics.dart';

import '../assert_helpers.dart';

void main() {
  group('Gamma', () {
    test('Test 1', () {
      var input = double.nan;
      var actual = gamma(input);
      var expected = double.nan;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 2', () {
      var input = 1.000001e-35;
      var actual = gamma(input);
      var expected =
          9.9999900000099999900000099999899999522784235098567139293e+34;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 3', () {
      var input = 1.000001e-10;
      var actual = gamma(input);
      var expected =
          9.99998999943278432519738283781280989934496494539074049002e+9;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 4', () {
      var input = 1.000001e-5;
      var actual = gamma(input);
      var expected =
          99999.32279432557746387178953902739303931424932435387031653234;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 5', () {
      var input = 1.000001e-2;
      var actual = gamma(input);
      var expected =
          99.43248512896257405886134437203369035261893114349805309870831;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 6', () {
      var input = -4.8;
      var actual = gamma(input);
      var expected =
          -0.06242336135475955314181664931547009890495158793105543559676;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 7', () {
      var input = -1.5;
      var actual = gamma(input);
      var expected =
          2.363271801207354703064223311121526910396732608163182837618410;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 8', () {
      var input = -0.5;
      var actual = gamma(input);
      var expected =
          -3.54490770181103205459633496668229036559509891224477425642761;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 9', () {
      var input = 1.0e-5 + 1.0e-16;
      var actual = gamma(input);
      var expected =
          99999.42279322556767360213300482199406241771308740302819426480;
      almostEqualRelative(expected, actual, 10);
    });

    test('Test 10', () {
      var input = 0.1;
      var actual = gamma(input);
      var expected =
          9.513507698668731836292487177265402192550578626088377343050000;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 11', () {
      var input = 1.0 - 1.0e-14;
      var actual = gamma(input);
      var expected =
          1.000000000000005772156649015427511664653698987042926067639529;
      almostEqualRelative(expected, actual, 15);
    });

    test('Test 12', () {
      var input = 1.0;
      var actual = gamma(input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 15);
    });

    test('Test 13', () {
      var input = 1.0 + 1.0e-14;
      var actual = gamma(input);
      var expected =
          0.99999999999999422784335098477029953441189552403615306268023;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 14', () {
      var input = 1.5;
      var actual = gamma(input);
      var expected =
          0.886226925452758013649083741670572591398774728061193564106903;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 15', () {
      var input = piOver2;
      var actual = gamma(input);
      var expected =
          0.890560890381539328010659635359121005933541962884758999762766;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 16', () {
      var input = 2.0;
      var actual = gamma(input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 16);
    });

    test('Test 17', () {
      var input = 2.5;
      var actual = gamma(input);
      var expected =
          1.329340388179137020473625612505858887098162092091790346160355;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 18', () {
      var input = 3.0;
      var actual = gamma(input);
      var expected = 2.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 19', () {
      var input = pi;
      var actual = gamma(input);
      var expected =
          2.288037795340032417959588909060233922889688153356222441199380;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 20', () {
      var input = 3.5;
      var actual = gamma(input);
      var expected =
          3.323350970447842551184064031264647217745405230229475865400889;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 21', () {
      var input = 4.0;
      var actual = gamma(input);
      var expected = 6.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 22', () {
      var input = 4.5;
      var actual = gamma(input);
      var expected =
          11.63172839656744892914422410942626526210891830580316552890311;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 23', () {
      var input = 5.0 - 1.0e-14;
      var actual = gamma(input);
      var expected =
          23.99999999999963853175957637087420162718107213574617032780374;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 24', () {
      var input = 5.0;
      var actual = gamma(input);
      var expected = 24.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 25', () {
      var input = 5.0 + 1.0e-14;
      var actual = gamma(input);
      var expected =
          24.00000000000036146824042363510111050137786752408660789873592;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 26', () {
      var input = 5.5;
      var actual = gamma(input);
      var expected =
          52.34277778455352018114900849241819367949013237611424488006401;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 27', () {
      var input = 10.1;
      var actual = gamma(input);
      var expected =
          454760.7514415859508673358368319076190405047458218916492282448;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 28', () {
      var input = 150 + 1.0e-12;
      var actual = gamma(input);
      var expected =
          3.8089226376496421386707466577615064443807882167327097140e+260;
      almostEqualRelative(expected, actual, 12);
    });
  });

  group('GammaLn', () {
    test('Test 1', () {
      var input = double.nan;
      var actual = gammaLn(input);
      var expected = double.nan;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 2', () {
      var input = 1.000001e-35;
      var actual = gammaLn(input);
      var expected =
          80.59047725479209894029636783061921392709972287131139201585211;
      almostEqualRelative(expected, actual, 16);
    });

    test('Test 3', () {
      var input = 1.000001e-10;
      var actual = gammaLn(input);
      var expected =
          23.02584992988323521564308637407936081168344192865285883337793;
      almostEqualRelative(expected, actual, 15);
    });

    test('Test 4', () {
      var input = 1.000001e-5;
      var actual = gammaLn(input);
      var expected =
          11.51291869289055371493077240324332039045238086972508869965363;
      almostEqualRelative(expected, actual, 15);
    });

    test('Test 5', () {
      var input = 1.000001e-2;
      var actual = gammaLn(input);
      var expected =
          4.599478872433667224554543378460164306444416156144779542513592;
      almostEqualRelative(expected, actual, 16);
    });

    test('Test 6', () {
      var input = 0.1;
      var actual = gammaLn(input);
      var expected =
          2.252712651734205959869701646368495118615627222294953765041739;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 7', () {
      var input = 1.0 - 1.0e-14;
      var actual = gammaLn(input);
      var expected =
          5.772156649015410852768463312546533565566459794933360600e-15;
      almostEqualRelative(expected, actual, 0);
    });

    test('Test 8', () {
      var input = 1.0;
      var actual = gammaLn(input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 9', () {
      var input = 1.0 + 1.0e-14;
      var actual = gammaLn(input);
      var expected =
          -5.77215664901524635936177848990288632404978978079827014e-15;
      almostEqualRelative(expected, actual, 0);
    });

    test('Test 10', () {
      var input = 1.5;
      var actual = gammaLn(input);
      var expected =
          -0.12078223763524522234551844578164721225185272790259946836386;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 11', () {
      var input = piOver2;
      var actual = gammaLn(input);
      var expected = -0.11590380084550241329912089415904874214542604767006895;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 12', () {
      var input = 2.0;
      var actual = gammaLn(input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 13', () {
      var input = 2.5;
      var actual = gammaLn(input);
      var expected =
          0.284682870472919159632494669682701924320137695559894729250145;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 14', () {
      var input = 3.0;
      var actual = gammaLn(input);
      var expected =
          0.693147180559945309417232121458176568075500134360255254120680;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 15', () {
      var input = pi;
      var actual = gammaLn(input);
      var expected = 0.82769459232343710152957855845235995115350173412073715;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 16', () {
      var input = 3.5;
      var actual = gammaLn(input);
      var expected =
          1.200973602347074224816021881450712995770238915468157197042113;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 17', () {
      var input = 4.0;
      var actual = gammaLn(input);
      var expected =
          1.791759469228055000812477358380702272722990692183004705855374;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 18', () {
      var input = 4.5;
      var actual = gammaLn(input);
      var expected =
          2.453736570842442220504142503435716157331823510689763131380823;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 19', () {
      var input = 5.0 - 1.0e-14;
      var actual = gammaLn(input);
      var expected =
          3.178053830347930558470257283303394288448414225994179545985931;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 20', () {
      var input = 5.0;
      var actual = gammaLn(input);
      var expected =
          3.178053830347945619646941601297055408873990960903515214096734;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 21', () {
      var input = 5.0 + 1.0e-14;
      var actual = gammaLn(input);
      var expected =
          3.178053830347960680823625919312848824873279228348981287761046;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 22', () {
      var input = 5.5;
      var actual = gammaLn(input);
      var expected =
          3.957813967618716293877400855822590998551304491975006780729532;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 23', () {
      var input = 10.1;
      var actual = gammaLn(input);
      var expected =
          13.02752673863323795851370097886835481188051062306253294740504;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 24', () {
      var input = 150 + 1.0e-12;
      var actual = gammaLn(input);
      var expected =
          600.0094705553324354062157737572509902987070089159051628001813;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 25', () {
      var input = 1.001e+7;
      var actual = gammaLn(input);
      var expected =
          1.51342135323817913130119829455205139905331697084416059779e+8;
      almostEqualRelative(expected, actual, 13);
    });
  });

  group('Gamma lower regularized', () {
    test('Test 1', () {
      var input = double.nan;
      var a = double.nan;
      var actual = gammaLowerRegularized(a, input);
      var expected = double.nan;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 2', () {
      var a = 0.1;
      var input = 1.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.97587265627367222115949155252812057714751052498477013;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 3', () {
      var a = 0.1;
      var input = 2.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.99432617602018847196075251078067514034772764693462125;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 4', () {
      var a = 0.1;
      var input = 8.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.99999507519205198048686442150578226823401842046310854;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 5', () {
      var a = 1.5;
      var input = 1.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.42759329552912016600095238564127189392715996802703368;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 6', () {
      var a = 1.5;
      var input = 2.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.73853587005088937779717792402407879809718939080920993;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 7', () {
      var a = 1.5;
      var input = 8.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.99886601571021467734329986257903021041757398191304284;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 8', () {
      var a = 2.5;
      var input = 1.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.15085496391539036377410688601371365034788861473418704;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 9', () {
      var a = 2.5;
      var input = 2.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.45058404864721976739416885516693969548484517509263197;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 10', () {
      var a = 2.5;
      var input = 8.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.99315592607757956900093935107222761316136944145439676;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 11', () {
      var a = 5.5;
      var input = 1.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0015041182825838038421585211353488839717739161316985392;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 12', () {
      var a = 5.5;
      var input = 2.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.030082976121226050615171484772387355162056796585883967;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 13', () {
      var a = 5.5;
      var input = 8.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.85886911973294184646060071855669224657735916933487681;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 14', () {
      var a = 100.0;
      var input = 0.5;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 15', () {
      var a = 100.0;
      var input = 1.5;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 16', () {
      var a = 100.0;
      var input = 90.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.1582209891864301681049696996709105316998233457433473;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 17', () {
      var a = 100.0;
      var input = 100.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.5132987982791486648573142565640291634709251499279450;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 18', () {
      var a = 100.0;
      var input = 110.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.8417213299399129061982996209829688531933500308658222;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 19', () {
      var a = 100.0;
      var input = 200.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 20', () {
      var a = 500.0;
      var input = 0.5;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 21', () {
      var a = 500.0;
      var input = 1.5;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 22', () {
      var a = 500.0;
      var input = 200.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 23', () {
      var a = 500.0;
      var input = 450.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0107172380912897415573958770655204965434869949241480;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 24', () {
      var a = 500.0;
      var input = 500.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.5059471461707603580470479574412058032802735425634263;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 25', () {
      var a = 500.0;
      var input = 550.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.9853855918737048059548470006900844665580616318702748;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 26', () {
      var a = 500.0;
      var input = 700.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 27', () {
      var a = 1000.0;
      var input = 10000.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 28', () {
      var a = 1e+50;
      var input = 1e+48;
      var actual = gammaLowerRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 29', () {
      var a = 1e+50;
      var input = 1e+52;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });
  });

  // TODO group for gammaLowerRegularizedInv

  group('Gamma lower incomplete', () {
    test('Test 1', () {
      var input = double.nan;
      var a = double.nan;
      var actual = gammaLowerIncomplete(a, input);
      var expected = double.nan;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 2', () {
      var a = 0.1;
      var input = 1.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 9.2839720283798852469443229940217320532607158711056334;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 3', () {
      var a = 0.1;
      var input = 2.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 9.4595297305559030536119885480983751098528458886962883;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 4', () {
      var a = 0.1;
      var input = 8.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 9.5134608464704033372127589212547718314010339263844976;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 5', () {
      var a = 1.5;
      var input = 1.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 0.37894469164098470380394366597039213790868855578083847;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 6', () {
      var a = 1.5;
      var input = 2.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 0.65451037345177732033319477475056262302270310457635612;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 7', () {
      var a = 1.5;
      var input = 8.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 0.88522195804210983776635107858848816480298923071075222;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 8', () {
      var a = 2.5;
      var input = 1.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 0.20053759629003473411039172879412733941722170263949;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 9', () {
      var a = 2.5;
      var input = 2.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 0.59897957413602228465664030130712917348327070206302442;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 10', () {
      var a = 2.5;
      var input = 8.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 1.3202422842943799358198434659248530581833764879301293;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 11', () {
      var a = 5.5;
      var input = 1.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 0.078729729026968321691794205337720556329618007004848672;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 12', () {
      var a = 5.5;
      var input = 2.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 1.5746265342113649473739798668921124454837064926448459;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 13', () {
      var a = 5.5;
      var input = 8.0;
      var actual = gammaLowerIncomplete(a, input);
      var expected = 44.955595480196465884619737757794960132425035578313584;
      almostEqualRelative(expected, actual, 13);
    });
  });

  group('Gamma upper regularized', () {
    test('Test 1', () {
      var input = double.nan;
      var a = double.nan;
      var actual = gammaUpperRegularized(a, input);
      var expected = double.nan;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 2', () {
      var a = 0.1;
      var input = 1.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0241273437263277773829694356333550393309597428392044;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 3', () {
      var a = 0.1;
      var input = 2.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0056738239798115280392474892193248596522723530653781;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 4', () {
      var a = 0.1;
      var input = 8.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0000049248079480195131355784942177317659815795368919702;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 5', () {
      var a = 1.5;
      var input = 1.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.57240670447087983399904761435872810607284003197297;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 6', () {
      var a = 1.5;
      var input = 2.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.26146412994911062220282207597592120190281060919079;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 7', () {
      var a = 1.5;
      var input = 8.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0011339842897853226567001374209697895824260180869567;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 8', () {
      var a = 2.5;
      var input = 1.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.84914503608460963622589311398628634965211138526581;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 9', () {
      var a = 2.5;
      var input = 2.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.54941595135278023260583114483306030451515482490737;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 10', () {
      var a = 2.5;
      var input = 8.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0068440739224204309990606489277723868386305585456026;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 11', () {
      var a = 5.5;
      var input = 1.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.9984958817174161961578414788646511160282260838683;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 12', () {
      var a = 5.5;
      var input = 2.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.96991702387877394938482851522761264483794320341412;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 13', () {
      var a = 5.5;
      var input = 8.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.14113088026705815353939928144330775342264083066512;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 14', () {
      var a = 100.0;
      var input = 0.5;
      var actual = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 15', () {
      var a = 100.0;
      var input = 1.5;
      var actual = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 16', () {
      var a = 100.0;
      var input = 90.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.8417790108135698318950303003290894683001766542566526;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 17', () {
      var a = 100.0;
      var input = 100.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.4867012017208513351426857434359708365290748500720549;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 18', () {
      var a = 100.0;
      var input = 110.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.1582786700600870938017003790170311468066499691341777;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 19', () {
      var a = 100.0;
      var input = 200.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 20', () {
      var a = 500.0;
      var input = 0.5;
      var actual = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 21', () {
      var a = 500.0;
      var input = 1.5;
      var actual = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 22', () {
      var a = 500.0;
      var input = 200.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 23', () {
      var a = 500.0;
      var input = 450.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.9892827619087102584426041229344795034565130050758519;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 24', () {
      var a = 500.0;
      var input = 500.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.4940528538292396419529520425587941967197264574365736;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 25', () {
      var a = 500.0;
      var input = 550.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0146144081262951940451529993099155334419383681297251;
      almostEqualRelative(expected, actual, 12);
    });

    test('Test 26', () {
      var a = 500.0;
      var input = 700.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 27', () {
      var a = 1000.0;
      var input = 10000.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 28', () {
      var a = 1e+50;
      var input = 1e+48;
      var actual = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 14);
    });

    test('Test 29', () {
      var a = 1e+50;
      var input = 1e+52;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 14);
    });
  });

  group('Gamma upper incomplete', () {
    test('Test 1', () {
      var input = double.nan;
      var a = double.nan;
      var actual = gammaUpperIncomplete(a, input);
      var expected = double.nan;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 2', () {
      var a = 0.1;
      var input = 1.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.2295356702888460382790772147651768201739736396141314;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 3', () {
      var a = 0.1;
      var input = 2.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.053977968112828232195991347726857391060870217694027;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 4', () {
      var a = 0.1;
      var input = 8.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.000046852198327948595220974570460669512682180005810156;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 5', () {
      var a = 1.5;
      var input = 1.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.50728223381177330984514007570018045349008617228036;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 6', () {
      var a = 1.5;
      var input = 2.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.23171655200098069331588896692000996837607162348484;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 7', () {
      var a = 1.5;
      var input = 8.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.0010049674106481758827326630820844265957854973504417;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 8', () {
      var a = 2.5;
      var input = 1.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 1.1288027918891022863632338837117315476809403894523;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 9', () {
      var a = 2.5;
      var input = 2.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.73036081404311473581698531119872971361489139002877;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 10', () {
      var a = 2.5;
      var input = 8.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 0.0090981038847570846537821465810058289147856041616617;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 11', () {
      var a = 5.5;
      var input = 1.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 52.264048055526551859457214287080473123160514369109;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 12', () {
      var a = 5.5;
      var input = 2.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 50.768151250342155233775028625526081234006425883469;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 13', () {
      var a = 5.5;
      var input = 8.0;
      var actual = gammaUpperIncomplete(a, input);
      var expected = 7.3871823043570542965292707346232335470650967978006;
      almostEqualRelative(expected, actual, 13);
    });
  });

  group('Gamma upper incomplete - special cases', () {
    test('Test 1', () {
      var a = 0.0;
      var input = 0.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 2', () {
      var a = 0.0;
      var input = 1.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 3', () {
      var a = 0.0;
      var input = 2.0;
      var actual = gammaUpperRegularized(a, input);
      var expected = 0.0;
      almostEqualRelative(expected, actual, 13);
    });
  });

  group('Gamma lower incomplete - special cases', () {
    test('Test 1', () {
      var a = 0.0;
      var input = 0.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 2', () {
      var a = 0.0;
      var input = 1.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 13);
    });

    test('Test 3', () {
      var a = 0.0;
      var input = 2.0;
      var actual = gammaLowerRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actual, 13);
    });
  });

  group('Gamma incomplete regularized - check sum', () {
    test('Test 1', () {
      var a = 0.0;
      var input = 0.0;
      var actualLower = gammaLowerRegularized(a, input);
      var actualUpper = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actualLower + actualUpper, 13);
    });

    test('Test 2', () {
      var a = 0.0;
      var input = 1.0;
      var actualLower = gammaLowerRegularized(a, input);
      var actualUpper = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actualLower + actualUpper, 13);
    });

    test('Test 3', () {
      var a = 0.0;
      var input = 2.0;
      var actualLower = gammaLowerRegularized(a, input);
      var actualUpper = gammaUpperRegularized(a, input);
      var expected = 1.0;
      almostEqualRelative(expected, actualLower + actualUpper, 13);
    });
  });

  group('Di-gamma function', () {
    test('Test 1', () {
      double x = double.nan;
      double f = double.nan;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 2', () {
      double x = -1.5;
      double f = 0.70315664064524318722569033366791109947350706200623256;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 3', () {
      double x = -0.5;
      double f = 0.036489973978576520559023667001244432806840395339565891;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 4', () {
      double x = 0.1;
      double f = -10.423754940411076232100295314502760886768558023951363;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 5', () {
      double x = 1.0;
      double f = -0.57721566490153286060651209008240243104215933593992359;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 6', () {
      double x = 1.5;
      double f = 0.036489973978576520559023667001244432806840395339565888;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 7', () {
      double x = piOver2;
      double f = 0.1006733764274023863679556140402969045279835806894400;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 8', () {
      double x = 2.0;
      double f = 0.42278433509846713939348790991759756895784066406007641;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 9', () {
      double x = 2.5;
      double f = 0.70315664064524318722569033366791109947350706200623255;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 10', () {
      double x = 3.0;
      double f = 0.92278433509846713939348790991759756895784066406007641;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 11', () {
      double x = pi;
      double f = 0.97721330794200673329206948640618234364083460999432603;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 12', () {
      double x = 3.5;
      double f = 1.1031566406452431872256903336679110994735070620062326;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 13', () {
      double x = 4.0;
      double f = 1.2561176684318004727268212432509309022911739973934097;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 14', () {
      double x = 4.5;
      double f = 1.3888709263595289015114046193821968137592213477205183;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 15', () {
      double x = 5.0;
      double f = 1.5061176684318004727268212432509309022911739973934097;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 16', () {
      double x = 5.5;
      double f = 1.611093148581751123733626841604419035981443569942740;
      almostEqualRelative(f, diGamma(x), 12);
    });

    test('Test 17', () {
      double x = 10.1;
      double f = 2.2622143570941481235561593642219403924532310597356171;
      almostEqualRelative(f, diGamma(x), 12);
    });
  });

  group('Di-gamma function', () {
    test('Test 1', () {
      double x = double.nan;
      double f = double.nan;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 2', () {
      double x = 0.0;
      double f = double.negativeInfinity;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 3', () {
      double x = 0.1;
      double f = -10.423754940411076232100295314502760886768558023951363;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 4', () {
      double x = 1.0;
      double f = -0.57721566490153286060651209008240243104215933593992359;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 5', () {
      double x = 1.5;
      double f = 0.036489973978576520559023667001244432806840395339565888;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 6', () {
      double x = piOver2;
      double f = 0.1006733764274023863679556140402969045279835806894400;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 7', () {
      double x = 2.0;
      double f = 0.42278433509846713939348790991759756895784066406007641;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 8', () {
      double x = 2.5;
      double f = 0.70315664064524318722569033366791109947350706200623255;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 9', () {
      double x = 3.0;
      double f = 0.92278433509846713939348790991759756895784066406007641;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 10', () {
      double x = pi;
      double f = 0.97721330794200673329206948640618234364083460999432603;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 11', () {
      double x = 3.5;
      double f = 1.1031566406452431872256903336679110994735070620062326;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 12', () {
      double x = 4.0;
      double f = 1.2561176684318004727268212432509309022911739973934097;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 13', () {
      double x = 4.5;
      double f = 1.3888709263595289015114046193821968137592213477205183;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 14', () {
      double x = 5.0;
      double f = 1.5061176684318004727268212432509309022911739973934097;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 15', () {
      double x = 5.5;
      double f = 1.611093148581751123733626841604419035981443569942740;
      almostEqualRelative(x, diGammaInv(f), 13);
    });

    test('Test 16', () {
      double x = 10.1;
      double f = 2.2622143570941481235561593642219403924532310597356171;
      almostEqualRelative(x, diGammaInv(f), 13);
    });
  });
}
