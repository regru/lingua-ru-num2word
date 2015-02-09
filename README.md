# NAME

Lingua::RU::Num2Word - Numbers to words in russian (without currency)

# VERSION

version 0.001

# SYNOPSIS

    use Lingua::RU::Num2Word qw/num2rus_cardinal/;
    print num2rus_cardinal(21, 2); # двадцать одно

## num2rus\_cardinal( $number, $gender )

Translates number to text converter for russian, using the specified gender. Returns Unicode string.
Main code taken from [Lingua::RUS::Number](https://metacpan.org/pod/Lingua::RUS::Number).

$gender 0|1|2 - female, male and neutral respectively. Male by default.

    use Lingua::RU::Num2Word qw/num2rus_cardinal/;
    my $text = num2rus_cardinal(561); # outputs пятьсот шестьдесят один


    my $bottles_on_wall = 22;
    print num2rus_cardinal($bottles_on_wall, 0) . " бутылки пива на стене"; # outputs "двадцать две бутылки пива на стене"
    $bottles_on_wall --;
    print num2rus_cardinal($bottles_on_wall, 0) . " бутылка пива на стене"; # outputs "двадцать одна бутылка пива на стене"

# NAME

Lingua::RU::Num2Word - translates number to text in russian.

# AUTHOR

Polina Shubina <925043@gmail.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by REG.RU LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
