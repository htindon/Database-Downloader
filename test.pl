=begin comment
I use the LWP::Simple library to have acess to getstore() function.
It will download the file whose address is given is $url and save it
as $file.
=end comment
=cut

use LWP::Simple;

my $url = 'ftp://ftp.bnf.fr/655/N6553131_PDF_1_-1EM.pdf';
my $file = 'test.pdf';

getstore($url);
