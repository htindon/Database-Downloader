=begin comment
I use the LWP::Simple library to have acess to getstore() function.
It will download the file whose address is given is $url and save it
as $filename.

I use an array to store the links to the files to download.
I use the variable $i to iterate through it.
=end comment
=cut

use LWP::Simple qw($ua getstore);

@urls = ('ftp://ftp.bnf.fr/655/N6553131_PDF_1_-1EM.pdf');
$i = length @urls;
print "input your search query main qualifier (ex : if you are looking for a person only by his or her family name, input his or her full name here).\n";
$nameQuery = <STDIN>;
print "downloading $i files:\n";
while ($i >= 0)
{
	$url = $urls[$i];
	$filename = $nameQuery.$url;
	$ua->show_progress(1);
	getstore($url, $filename);
	$i--;
}
