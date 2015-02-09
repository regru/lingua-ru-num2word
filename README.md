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
