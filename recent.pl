# http://www.haidongji.com/2008/06/25/find-the-latest-or-newest-modified-file-in-a-folder-or-directory-with-perl/


use File::Copy;
use File::stat;

$dirname = shift or die "Please provide a directory to search for";
$timediff=0;
opendir DIR, "$dirname";
while (defined ($file = readdir(DIR)))
{
	if($file ne "." && $file ne "..")
	{
		$diff = time()-stat("$dirname/$file")->mtime;
		if($timediff == 0)
                       {
                       	$timediff=$diff;
                       	$newest=$file;
                       }
                if($diff<$timediff)
		       {
                       	$timediff=$diff;
                       	$newest=$file;
                       }
        }
}
print $newest,"\n";
#copy("$dirname/$newest", "c:/work/$newest");
