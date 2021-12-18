import 'package:test/test.dart';

import 'package:dart_numerics/dart_numerics.dart';

import '../assert_helpers.dart';

void main() {
  group('Erf', () {
    group('Error function can match large precision', () {
      test('Test 1', () {
        const double x = double.nan;
        const double f = double.nan;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 2 FAILING', () {
        const double x = -1.0;
        const double f =
            -0.84270079294971486934122063508260925929606699796630291;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 3', () {
        const double x = 0.0;
        const double f = 0.0;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 4', () {
        const double x = 1e-15;
        const double f =
            0.0000000000000011283791670955126615773132947717431253912942469337536;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 5', () {
        const double x = 0.1;
        const double f = 0.1124629160182848984047122510143040617233925185058162;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 6', () {
        const double x = 0.2;
        const double f =
            0.22270258921047846617645303120925671669511570710081967;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 7', () {
        const double x = 0.3;
        const double f =
            0.32862675945912741618961798531820303325847175931290341;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 8', () {
        const double x = 0.4;
        const double f =
            0.42839235504666847645410962730772853743532927705981257;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 9 FAILING', () {
        const double x = 0.5;
        const double f = 0.5204998778130465376827466538919645287364515757579637;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 10 FAILING', () {
        const double x = 1.0;
        const double f =
            0.84270079294971486934122063508260925929606699796630291;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 11 FAILING', () {
        const double x = 1.5;
        const double f =
            0.96610514647531072706697626164594785868141047925763678;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 12 FAILING', () {
        const double x = 2.0;
        const double f =
            0.99532226501895273416206925636725292861089179704006008;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 13 FAILING', () {
        const double x = 2.5;
        const double f =
            0.99959304798255504106043578426002508727965132259628658;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 14 FAILING', () {
        const double x = 3.0;
        const double f =
            0.99997790950300141455862722387041767962015229291260075;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 15', () {
        const double x = 4.0;
        const double f =
            0.99999998458274209971998114784032651311595142785474641;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 16', () {
        const double x = 5.0;
        const double f =
            0.99999999999846254020557196514981165651461662110988195;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 17', () {
        const double x = 6.0;
        const double f =
            0.99999999999999997848026328750108688340664960081261537;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 18', () {
        const double x = double.infinity;
        const double f = 1.0;

        almostEqualRelative(f, erf(x), 15);
      });

      test('Test 19', () {
        const double x = double.negativeInfinity;
        const double f = -1.0;

        almostEqualRelative(f, erf(x), 15);
      });
    });

    group('Complementary error function can match large precision', () {
      test('Test 1', () {
        const double x = double.nan;
        const double f = double.nan;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 2 FAILING', () {
        const double x = -1.0;
        const double f = 1.8427007929497148693412206350826092592960669979663028;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 3', () {
        const double x = 0.0;
        const double f = 1.0;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 4', () {
        const double x = 0.1;
        const double f =
            0.88753708398171510159528774898569593827660748149418343;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 5', () {
        const double x = 0.2;
        const double f =
            0.77729741078952153382354696879074328330488429289918085;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 6', () {
        const double x = 0.3;
        const double f =
            0.67137324054087258381038201468179696674152824068709621;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 7', () {
        const double x = 0.4;
        const double f =
            0.57160764495333152354589037269227146256467072294018715;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 8 FAILING', () {
        const double x = 0.5;
        const double f =
            0.47950012218695346231725334610803547126354842424203654;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 9 FAILING', () {
        const double x = 1.0;
        const double f =
            0.15729920705028513065877936491739074070393300203369719;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 10 FAILING', () {
        const double x = 1.5;
        const double f =
            0.033894853524689272933023738354052141318589520742363247;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 11 FAILING', () {
        const double x = 2.0;
        const double f =
            0.0046777349810472658379307436327470713891082029599399245;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 12 FAILING', () {
        const double x = 2.5;
        const double f =
            0.00040695201744495893956421573997491272034867740371342016;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 13 FAILING', () {
        const double x = 3.0;
        const double f =
            0.00002209049699858544137277612958232037984770708739924966;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 14 FAILING', () {
        const double x = 4.0;
        const double f =
            0.000000015417257900280018852159673486884048572145253589191167;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 15 FAILING', () {
        const double x = 5.0;
        const double f =
            0.0000000000015374597944280348501883434853833788901180503147233804;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 16', () {
        const double x = 6.0;
        const double f =
            2.1519736712498913116593350399187384630477514061688559e-17;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 17', () {
        const double x = 10.0;
        const double f =
            2.0884875837625447570007862949577886115608181193211634e-45;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 18', () {
        const double x = 15.0;
        const double f =
            7.2129941724512066665650665586929271099340909298253858e-100;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 19', () {
        const double x = 20.0;
        const double f =
            5.3958656116079009289349991679053456040882726709236071e-176;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 20', () {
        const double x = 30.0;
        const double f =
            2.5646562037561116000333972775014471465488897227786155e-393;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 21', () {
        const double x = 50.0;
        const double f =
            2.0709207788416560484484478751657887929322509209953988e-1088;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 22', () {
        const double x = 80.0;
        const double f =
            2.3100265595063985852034904366341042118385080919280966e-2782;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 23', () {
        const double x = double.infinity;
        const double f = 0.0;

        almostEqualRelative(f, erfc(x), 13);
      });

      test('Test 24', () {
        const double x = double.negativeInfinity;
        const double f = 2.0;

        almostEqualRelative(f, erfc(x), 13);
      });
    });

    group('Complementary inverse error function can match large precision', () {
      test('Test 1', () {
        const double x = 0.0;
        const double f = double.infinity;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 2', () {
        const double x = 1e-100;
        const double f = 15.065574702593;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 3', () {
        const double x = 1e-30;
        const double f = 8.1486162231699;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 4', () {
        const double x = 1e-20;
        const double f = 6.6015806223551;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 5', () {
        const double x = 1e-10;
        const double f = 4.5728249585449249378479309946884581365517663258840893;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 6', () {
        const double x = 1e-5;
        const double f = 3.1234132743415708640270717579666062107939039971365252;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 7', () {
        const double x = 0.1;
        const double f = 1.1630871536766741628440954340547000483801487126688552;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 8', () {
        const double x = 0.2;
        const double f =
            0.90619380243682330953597079527631536107443494091638384;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 9', () {
        const double x = 0.5;
        const double f =
            0.47693627620446987338141835364313055980896974905947083;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 10', () {
        const double x = 1.0;
        const double f = 0.0;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 11', () {
        const double x = 1.5;
        const double f =
            -0.47693627620446987338141835364313055980896974905947083;

        almostEqualRelative(f, erfcInv(x), 7);
      });

      test('Test 12', () {
        const double x = 2.0;
        const double f = double.negativeInfinity;

        almostEqualRelative(f, erfcInv(x), 7);
      });
    });

    group('Inverse error function can match large precision', () {
      test('Test 1', () {
        const double x = double.nan;
        const double f = double.nan;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 2', () {
        const double x =
            -0.84270079294971486934122063508260925929606699796630291;
        const double f = -1.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 3', () {
        const double x = 0.0;
        const double f = 0.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 4', () {
        const double x =
            0.0000000000000011283791670955126615773132947717431253912942469337536;
        const double f = 1e-15;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 5', () {
        const double x = 0.1124629160182848984047122510143040617233925185058162;
        const double f = 0.1;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 6', () {
        const double x =
            0.22270258921047846617645303120925671669511570710081967;
        const double f = 0.2;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 7', () {
        const double x =
            0.32862675945912741618961798531820303325847175931290341;
        const double f = 0.3;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 8', () {
        const double x =
            0.42839235504666847645410962730772853743532927705981257;
        const double f = 0.4;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 9', () {
        const double x = 0.5204998778130465376827466538919645287364515757579637;
        const double f = 0.5;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 10', () {
        const double x =
            0.84270079294971486934122063508260925929606699796630291;
        const double f = 1.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 11', () {
        const double x =
            0.96610514647531072706697626164594785868141047925763678;
        const double f = 1.5;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 12', () {
        const double x =
            0.99532226501895273416206925636725292861089179704006008;
        const double f = 2.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 13', () {
        const double x =
            0.99959304798255504106043578426002508727965132259628658;
        const double f = 2.5;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 14', () {
        const double x =
            0.99997790950300141455862722387041767962015229291260075;
        const double f = 3.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 15', () {
        const double x =
            0.99999998458274209971998114784032651311595142785474641;
        const double f = 4.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 16', () {
        const double x =
            0.99999999999846254020557196514981165651461662110988195;
        const double f = 5.0;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 17', () {
        const double x = 1.0;
        const double f = double.infinity;

        almostEqualRelative(f, erfInv(x), 5);
      });

      test('Test 18', () {
        const double x = -1.0;
        const double f = double.negativeInfinity;

        almostEqualRelative(f, erfInv(x), 5);
      });
    });
  });
}
