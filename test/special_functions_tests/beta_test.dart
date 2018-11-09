import 'package:test/test.dart';
import 'package:dart_numerics/dart_numerics.dart';

import '../assert_helpers.dart';

void main() {
  group('Beta function.', () {
    test('Test 1', () {
      almostEqualRelative(0.5, beta(1.0, 2.0), 13);
    });

    test('Test 2', () {
      almostEqualRelative(1.0, beta(1.0, 1.0), 13);
    });
  });

  group('Beta incomplete.', () {
    test('Test 1', () {
      double a = 0.1;
      double b = 0.1;
      double x = 0.1;
      double f = 8.0117356206774655704238957309013421730449536344797;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 2', () {
      double a = 0.1;
      double b = 0.1;
      double x = 0.5;
      double f = 9.8573197445250802696495512442154091185464210677262;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 3', () {
      double a = 0.1;
      double b = 0.1;
      double x = 0.8;
      double f = 11.045931323774722512127911008108711428206559153167;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 4', () {
      double a = 0.1;
      double b = 1.5;
      double x = 0.1;
      double f = 7.906686887040059574762793470136627722332467302241;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 5', () {
      double a = 0.1;
      double b = 1.5;
      double x = 0.5;
      double f = 9.1012542128394916083902345366778109992938115490192;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 6', () {
      double a = 0.1;
      double b = 1.5;
      double x = 0.8;
      double f = 9.368806890135865087467208304972858639790010273545;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 7', () {
      double a = 0.1;
      double b = 2.5;
      double x = 0.1;
      double f = 7.8363997919172974609110616787835466667385876309684;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 8', () {
      double a = 0.1;
      double b = 2.5;
      double x = 0.5;
      double f = 8.7385989355952880797816267602947881842609716646237;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 9', () {
      double a = 0.1;
      double b = 2.5;
      double x = 0.8;
      double f = 8.8379245631995373736838511405978394101548418300997;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 10', () {
      double a = 0.1;
      double b = 5.5;
      double x = 0.1;
      double f = 7.6464829466025722609741358285691936422732595850987;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 11', () {
      double a = 0.1;
      double b = 5.5;
      double x = 0.5;
      double f = 8.0832162883698521112308593494639236817925940654185;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 12', () {
      double a = 0.1;
      double b = 5.5;
      double x = 0.8;
      double f = 8.089843275520988350320569916795581670946930566783;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 13', () {
      double a = 1.5;
      double b = 0.1;
      double x = 0.1;
      double f = 0.022303834332028031481145155068151014763064226606192;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 14', () {
      double a = 1.5;
      double b = 0.1;
      double x = 0.5;
      double f = 0.33465159984030260689318592198561677643426763544959;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 15', () {
      double a = 1.5;
      double b = 0.1;
      double x = 0.8;
      double f = 1.002080089012839104050394134134167486035896540574;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 16', () {
      double a = 1.5;
      double b = 1.5;
      double x = 0.1;
      double f = 0.02043763859916055001568569052740016093388906615616;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 17', () {
      double a = 1.5;
      double b = 1.5;
      double x = 0.5;
      double f = 0.19634954084936207740391521145496893026232308746094;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 18', () {
      double a = 1.5;
      double b = 1.5;
      double x = 0.8;
      double f = 0.33678717944852264351783475904713816723851995610486;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 19', () {
      double a = 1.5;
      double b = 2.5;
      double x = 0.1;
      double f = 0.019218819299580275673976660038794008316192763455412;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 20', () {
      double a = 1.5;
      double b = 2.5;
      double x = 0.5;
      double f = 0.13984143709134770536862427239415113179782821039714;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 21', () {
      double a = 1.5;
      double b = 2.5;
      double x = 0.8;
      double f = 0.18972692305759464976318019465615085035583828745353;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 22', () {
      double a = 1.5;
      double b = 5.5;
      double x = 0.1;
      double f = 0.016056550082674778556355475820652277420877772570937;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 23', () {
      double a = 1.5;
      double b = 5.5;
      double x = 0.5;
      double f = 0.061380263212265132490746506045997506787829048203228;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 24', () {
      double a = 1.5;
      double b = 5.5;
      double x = 0.8;
      double f = 0.064403479961606576649564368278872635247235510624673;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 25', () {
      double a = 2.5;
      double b = 0.1;
      double x = 0.1;
      double f = 0.001352753157951915161848451666929681258878645850634;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 26', () {
      double a = 2.5;
      double b = 0.1;
      double x = 0.5;
      double f = 0.10756276379201896635529117527407904299772826375257;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 27', () {
      double a = 2.5;
      double b = 0.1;
      double x = 0.8;
      double f = 0.5587192957063609402827988523062144494394362102048;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 28', () {
      double a = 2.5;
      double b = 1.5;
      double x = 0.1;
      double f = 0.0012188192995802743417090304886061526176963027007477;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 29', () {
      double a = 2.5;
      double b = 1.5;
      double x = 0.5;
      double f = 0.056508103758014372035290939060817798464494877063805;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 30', () {
      double a = 2.5;
      double b = 1.5;
      double x = 0.8;
      double f = 0.14706025639092799375465456439098731688268166865133;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 31', () {
      double a = 2.5;
      double b = 2.5;
      double x = 0.1;
      double f = 0.0011320572373426029655709496224583878329664195067652;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 32', () {
      double a = 2.5;
      double b = 2.5;
      double x = 0.5;
      double f = 0.036815538909255389513234102147806674424185578898927;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 33', () {
      double a = 2.5;
      double b = 2.5;
      double x = 0.8;
      double f = 0.067947596146597995171095886486269312250373204235372;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 34', () {
      double a = 2.5;
      double b = 5.5;
      double x = 0.1;
      double f = 0.00091001787485888099434748885472859856478675247779447;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 35', () {
      double a = 2.5;
      double b = 5.5;
      double x = 0.5;
      double f = 0.012036842116913956962302822724142322883106224614977;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 36', () {
      double a = 2.5;
      double b = 5.5;
      double x = 0.8;
      double f = 0.0137861171346299807272679372975664758815098236357;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 37', () {
      double a = 5.5;
      double b = 0.1;
      double x = 0.1;
      double f = 0.00000062268687636453588281206442354375188797585844216401;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 38', () {
      double a = 5.5;
      double b = 0.1;
      double x = 0.5;
      double f = 0.0066577573700032687517874433540471831930305154614716;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 39', () {
      double a = 5.5;
      double b = 0.1;
      double x = 0.8;
      double f = 0.15893826959760073090597940189540380779121963557728;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 40', () {
      double a = 5.5;
      double b = 1.5;
      double x = 0.1;
      double f = 0.00000055008267477746389601958949824166456746390970113234;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 41', () {
      double a = 5.5;
      double b = 1.5;
      double x = 0.5;
      double f = 0.0030469298789317991574131727126641734544957148698945;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 42', () {
      double a = 5.5;
      double b = 1.5;
      double x = 0.8;
      double f = 0.029928813294939917230433606365228383142081556070117;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 43', () {
      double a = 5.5;
      double b = 2.5;
      double x = 0.1;
      double f = 0.00000050358914459517094905570885392504304689450166185919;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 44', () {
      double a = 5.5;
      double b = 2.5;
      double x = 0.5;
      double f = 0.0017689849740568141051599655812851800259633674721202;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 45', () {
      double a = 5.5;
      double b = 2.5;
      double x = 0.8;
      double f = 0.010158231420344267874007806875642686140428489302542;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 46', () {
      double a = 5.5;
      double b = 5.5;
      double x = 0.1;
      double f = 0.00000038687628134504851234251462244340434107233073666673;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 47', () {
      double a = 5.5;
      double b = 5.5;
      double x = 0.5;
      double f = 0.00037750308451873202137593561772653328266987165863158;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });

    test('Test 48', () {
      double a = 5.5;
      double b = 5.5;
      double x = 0.8;
      double f = 0.00074361660080007708142054771607396897718180545812717;
      almostEqualRelative(f, betaIncomplete(a, b, x), 11);
    });
  });

  group('Beta incomplete.', () {
    test('Test 1', () {
      double a = 0.1;
      double b = 0.1;
      double x = 0.1;
      double f = 0.40638509393627598963947434031370208398700911383034;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 2', () {
      double a = 0.1;
      double b = 0.1;
      double x = 0.5;
      double f = 0.5;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 3', () {
      double a = 0.1;
      double b = 0.1;
      double x = 0.8;
      double f = 0.56029080977665439586092261707431380702999082404228;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 4', () {
      double a = 0.1;
      double b = 1.5;
      double x = 0.1;
      double f = 0.83793618164513694339361766577607270440777026543289;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 5', () {
      double a = 0.1;
      double b = 1.5;
      double x = 0.5;
      double f = 0.96453423693668031005965611526662377555163072304903;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 6', () {
      double a = 0.1;
      double b = 1.5;
      double x = 0.8;
      double f = 0.99288897919542998751072045939791723468184549496473;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 7', () {
      double a = 0.1;
      double b = 2.5;
      double x = 0.1;
      double f = 0.88585310309894667823419197676046986281131524104959;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 8', () {
      double a = 0.1;
      double b = 2.5;
      double x = 0.5;
      double f = 0.98784074184406228317625751436240720987391458581291;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 9', () {
      double a = 0.1;
      double b = 2.5;
      double x = 0.8;
      double f = 0.99906884630106408932550166100889714490764416359312;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 10', () {
      double a = 0.1;
      double b = 5.5;
      double x = 0.1;
      double f = 0.94519184147610137383076366494492317664691771837548;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 11', () {
      double a = 0.1;
      double b = 5.5;
      double x = 0.5;
      double f = 0.99917702583101287494949180374093750006040749104055;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 12', () {
      double a = 0.1;
      double b = 5.5;
      double x = 0.8;
      double f = 0.99999619645266501604882303584892931538704382134298;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 13', () {
      double a = 1.5;
      double b = 0.1;
      double x = 0.1;
      double f = 0.0023637194748231330327322712604688049136736986021871;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 14', () {
      double a = 1.5;
      double b = 0.1;
      double x = 0.5;
      double f = 0.03546576306331968994034388473337622444836927695097;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 15', () {
      double a = 1.5;
      double b = 0.1;
      double x = 0.8;
      double f = 0.10619861080705813882414161079467267590245761692272;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 16', () {
      double a = 1.5;
      double b = 1.5;
      double x = 0.1;
      double f = 0.052044019330913933551809009997594089261007490064035;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 17', () {
      double a = 1.5;
      double b = 1.5;
      double x = 0.5;
      double f = 0.5;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 18', () {
      double a = 1.5;
      double b = 1.5;
      double x = 0.8;
      double f = 0.85762151006735301922188173009147886735366387396138;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 19', () {
      double a = 1.5;
      double b = 2.5;
      double x = 0.1;
      double f = 0.097880642941379793645839194076629344959184516635409;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 20', () {
      double a = 1.5;
      double b = 2.5;
      double x = 0.5;
      double f = 0.71220659078919378102517835116335248271261286098728;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 21', () {
      double a = 1.5;
      double b = 2.5;
      double x = 0.8;
      double f = 0.96627128455142020796603976406510565066301101575357;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 22', () {
      double a = 1.5;
      double b = 5.5;
      double x = 0.1;
      double f = 0.2492200779249636429835386068413815093625886315581;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 23', () {
      double a = 1.5;
      double b = 5.5;
      double x = 0.5;
      double f = 0.95270739368361339952038048248181862978690743677285;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 24', () {
      double a = 1.5;
      double b = 5.5;
      double x = 0.8;
      double f = 0.99963193911681378117173263163355516583213310848701;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 25', () {
      double a = 2.5;
      double b = 0.1;
      double x = 0.1;
      double f = 0.00015291978644767572330394885397661411972523657814463;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 26', () {
      double a = 2.5;
      double b = 0.1;
      double x = 0.5;
      double f = 0.012159258155937716823742485637592790126085414187091;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 27', () {
      double a = 2.5;
      double b = 0.1;
      double x = 0.8;
      double f = 0.063159516487818477363383984899205310365144861115492;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 28', () {
      double a = 2.5;
      double b = 1.5;
      double x = 0.1;
      double f = 0.006207395720448073457778825918558833562830463492662;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 29', () {
      double a = 2.5;
      double b = 1.5;
      double x = 0.5;
      double f = 0.28779340921080621897482164883664751728738713901272;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 30', () {
      double a = 2.5;
      double b = 1.5;
      double x = 0.8;
      double f = 0.74897173558328583047772369611785208404431673216919;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 31', () {
      double a = 2.5;
      double b = 2.5;
      double x = 0.1;
      double f = 0.015374720442541245985473611768528587536206924004576;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 32', () {
      double a = 2.5;
      double b = 2.5;
      double x = 0.5;
      double f = 0.5;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 33', () {
      double a = 2.5;
      double b = 2.5;
      double x = 0.8;
      double f = 0.92281137475779334211841505067903343661808086762039;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 34', () {
      double a = 2.5;
      double b = 5.5;
      double x = 0.1;
      double f = 0.065915491253258347344782598110283193803051483319306;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 35', () {
      double a = 2.5;
      double b = 5.5;
      double x = 0.5;
      double f = 0.87186678766868243532031253918149387446781682306342;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 36', () {
      double a = 2.5;
      double b = 5.5;
      double x = 0.8;
      double f = 0.99857234512565487924356478796968439529913692090276;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 37', () {
      double a = 5.5;
      double b = 0.1;
      double x = 0.1;
      double f = 0.000000076971146008440526509370378069895435149621047562911;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 38', () {
      double a = 5.5;
      double b = 0.1;
      double x = 0.5;
      double f = 0.00082297416898712505050819625906249993959250895944939;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 39', () {
      double a = 5.5;
      double b = 0.1;
      double x = 0.8;
      double f = 0.01964656911825443767408345737200950450690987324177;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 40', () {
      double a = 5.5;
      double b = 1.5;
      double x = 0.1;
      double f = 0.0000085380512231662773545327104780279605728164994539023;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 41', () {
      double a = 5.5;
      double b = 1.5;
      double x = 0.5;
      double f = 0.047292606316386600479619517518181370213092563227146;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 42', () {
      double a = 5.5;
      double b = 1.5;
      double x = 0.8;
      double f = 0.46453697358156781101222907948783656601193056166297;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 43', () {
      double a = 5.5;
      double b = 2.5;
      double x = 0.1;
      double f = 0.000036476564661926426853537763285519105619982887967225;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 44', () {
      double a = 5.5;
      double b = 2.5;
      double x = 0.5;
      double f = 0.12813321233131756467968746081850612553218317693658;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 45', () {
      double a = 5.5;
      double b = 2.5;
      double x = 0.8;
      double f = 0.73579303531824700577792236664278017906658620718916;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 46', () {
      double a = 5.5;
      double b = 5.5;
      double x = 0.1;
      double f = 0.00051241472879389331855418481833750204851457778933154;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 47', () {
      double a = 5.5;
      double b = 5.5;
      double x = 0.5;
      double f = 0.5;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });

    test('Test 48', () {
      double a = 5.5;
      double b = 5.5;
      double x = 0.8;
      double f = 0.98491460241721309518021565227501009891015897915977;
      almostEqualRelative(f, betaRegularized(a, b, x), 11);
    });
  });

  test('Beta regularized with large argument.', () {
    var result = betaRegularized(
        3846.2382301675848, 738420369.64263761, 0.0000052331266889206809);
    expect(almostEqualRelativeD(result, 0.61624368331298802128, 1e-5), isTrue);
  });
}
