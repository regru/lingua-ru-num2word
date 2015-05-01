use Test::More tests => 6;
use Test::More::UTF8;
use Test::Exception;
use strict;
use warnings;

binmode STDOUT, ':encoding(UTF-8)';

use utf8;

use_ok "Lingua::RU::Num2Word", "num2rus_cardinal";

subtest masculine => sub {

    my $data = {
        'сто двадцать три'                   => [ 123 ],
        'пятьдесят четыре'                  => [ 54 ],
        'семьдесят два'                        => [ 72, 'MASCULINE' ],
        'шестьсот шестьдесят шесть' => [ 666 ],
        'один'                                         => [ 1 ],
        'два'                                           => [ 2 ],
        'три'                                           => [ 3 ],
        'четыре'                                     => [ 4 ],
        'пять'                                         => [ 5 ],
        'шесть'                                       => [ 6 ],
        'семь'                                         => [ 7 ],
        'восемь'                                     => [ 8 ],
        'девять'                                     => [ 9 ],
        'десять'                                     => [ 10 ],
        'одинадцать' => [11],
        'двенадцать' => [12],
    };

    for my $expected_result ( keys %$data ) {
        my $arguments = $data->{$expected_result};
        my $result    = num2rus_cardinal( @$arguments );
        is $result, $expected_result, "$expected_result == $result for data (@$arguments)";
    }
};

subtest feminine => sub {
    my $data = {
        'сто двадцать одна' => [ 121, 'feminine' ],
        'две'                           => [ 2,   'feminine' ],
        'триста сорок три'   => [ 343, 'feminine' ]
    };

    for my $expected_result ( keys %$data ) {
        my $arguments = $data->{$expected_result};
        my $result    = num2rus_cardinal( @$arguments );
        is $result, $expected_result, "$expected_result == $result for data (@$arguments)";
    }

};

subtest neuter => sub {
    my $data = {
        'сто двадцать одно' => [ 121, 'neuter' ],
        'тридцать два'          => [ 32,  'neuter' ],
    };

    for my $expected_result ( keys %$data ) {
        my $arguments = $data->{$expected_result};
        my $result    = num2rus_cardinal( @$arguments );
        is $result, $expected_result, "$expected_result == $result for data (@$arguments)";
    }
};

subtest 'some numbers' => sub {
    is num2rus_cardinal( 1_121_343 ),
      "один миллион сто двадцать одна тысяча триста сорок три",
      "Translates big number ok";

    is num2rus_cardinal( 999_999_999_999_999_999 ), "", "Cannot translate very big number";
    is num2rus_cardinal( 999_888 ),
"девятьсот девяносто девять тысяч восемьсот восемьдесят восемь",
      "Another big number translation ok";

    is num2rus_cardinal( 0 ), "ноль", "Undef becomes zero";
};

# some errors...

subtest 'some errors' => sub {
    throws_ok { num2rus_cardinal( 123, 1 ) } qr/Wrong gender/, 'Throws error if gender specified incorrectly';
};

