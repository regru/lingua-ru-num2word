use Test::More;
use Test::More::UTF8;
use strict;
use warnings;

use utf8;

use_ok "Lingua::RU::Num2Word", "num2rus_cardinal";

is num2rus_cardinal( 123 ), "сто двадцать три",  "Translates number ok";
is num2rus_cardinal( 54 ),  "пятьдесят четыре", "Translates number-2 ok";

is num2rus_cardinal( 121, 'feminine' ), "сто двадцать одна", "Translates female gender ok";
is num2rus_cardinal( 1,   'neuter' ), "одно",                         "Translates neutral gender ok";
is num2rus_cardinal( 2,   'feminine' ), "две",                           "two female translation ok";

is num2rus_cardinal( 1_121_343 ),
  "один миллион сто двадцать одна тысяча триста сорок три",
  "Translates big number ok";

is num2rus_cardinal( 999_999_999_999_999_999 ), "", "Cannot translate very big number";
is num2rus_cardinal(999_888), "девятьсот девяносто девять тысяч восемьсот восемьдесят восемь", "Another big number translation ok";

is num2rus_cardinal(0), "ноль", "Undef becomes zero";

done_testing();
