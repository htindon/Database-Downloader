=begin comment
I use the LWP::Simple library to have acess to getstore() function.
I tried to check my links using head() but cannot get around it yet
so I will see that later.
=end comment
=cut

use LWP::Simple qw($ua getstore head);

=begin comment
The following function, named createFolder will create a folder using 
the main keyword (ex: Maryse Bastie).
In this folder, I will store a txt file containing the links and the
resulting files downloaded with the valid links only.
I will expand that to work on it deeper if it's a name.
=end comment
=cut
sub	createFolder
{
	print "input your search query main qualifier (ex : if you are looking for a person only by his or her family name, input     his or her full name here).\n";
	$nameQuery = <STDIN>;
	chomp$nameQuery;
	unless (chdir($nameQuery))
	{
		mkdir($nameQuery, 0777);
		chdir($nameQuery) or die "can't use this folder or folder name";
	}

}

=begin comment
The following function, named getLinks will retrieve the links, it still
has to be built. For now I use simple links.
I will call another function that will fill-in the form in Gallica using
the keyword and related keywords and information obtained above.
A list of links will be generated and stored in a text file.
I will check each link and return only those that are valid.
=end comment
=cut
sub	getLinks
{
	@urls = ('http://tour-of-africa.com/index.php');
	
	return @urls;
}

=begin comment
The following function, named getFiles, will download the files and store
them. Their names and extensions are derived from the urls.
=end comment
=cut
sub	getFiles
{
	getLinks();
	$i = length @urls;
	print "$i files to download:\n";
	$i--;
	while ($i >= 0)
	{
		print "@urls";
		$url = $urls[$i];
		$ua->show_progress(1);
		$filename = $url;
		$filename =~ s/.*\/([^\/]*)$/$1/;
		getstore($url, $filename);
		$i--;
	}
}

&createFolder();
&getFiles(@urls);

=begin comment
Here is what I have to do next:
- insert my keyword in this kind of link (here looking for images, i'll have to handle the filetypes) :
view-source:http://gallica.bnf.fr/Search?ArianeWireIndex=index&lang=FR&q=Maryse+Basti%C3%A9&x=-708&y=-73&p=1&f_typedoc=images
- lookup the next <a href=" content to retrieve the link
- save the links
- check the links
- send a form to each one of those pages
- extract the new links
- generate a txt file containing them
- check them
- download each file using each of those links

POSSIBLE NEXT IMPROVMENTS :

- use the text file to record which links aren't working and why (error type ?)
- write a seperate function that will ask if the faulty files need to be checked again (even if working in another folder)
=end comment
=cut
