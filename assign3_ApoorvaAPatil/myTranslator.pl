

#    Theme Name: Perl program for visual model of data using svg
#    Date: March 5 2016
#    Description: Perl program for visual model of data using svg 
#    Version: 1.0
#    Author: Apoorva Patil
#    SCU ID: 00001188522

#!/usr/bin/perl
  use Fcntl;
 
  use Text::CSV;

  print "Assignment 3 - visual model of the data in cell-phones_00001188522.html \n\n";
  my $file = "cell-phones.csv";
  $i = 0;
  my @cellphone_type;
  open my $fh, "<", $file or die "Can't read file '$file' $!";

  my $file = Text::CSV->new ({
      binary    => 0,
      auto_diag => 1,
      });
  while (my $line = $file->getline ($fh)) {
      # Check for comments in the input.csv
      if(!(@$line[0] =~ m/^#/)){
            push(@cellphone_type,@$line[0]); 
	    push(@cellphone_type,@$line[1]);
            push(@cellphone_type,@$line[2]);
      }   
      }
# Size of the array elements      
$size = @cellphone_type;
@type = (0,0,0,0);
 for ($i = 1; $i < $size; $i=$i+3) 
 {
      if ($cellphone_type[$i] =~ m"ios"){
	 $type[0] = $type[0] + $cellphone_type[$i + 1];
 	}
      if ($cellphone_type[$i] =~ m"android"){
	 $type[1] = $type[1] + $cellphone_type[$i + 1];
 	}
      if ($cellphone_type[$i] =~ m"windows"){
	 $type[2] = $type[2] + $cellphone_type[$i + 1];
 	}
      if ($cellphone_type[$i] =~ m"some") {
   $type[3] = $type[3] + $cellphone_type[$i + 1];     
      }
}
# Height of each rectangle is calculated

$type_ios = $type[0]/10;
$type_android = $type[1]/10;
$type_windows = $type[2]/10;
$type_others = $type[3]/10;

# Start HTML

sysopen (HTML, 'cell-phones_00001188522.html', O_RDWR|O_CREAT, 0777);
printf HTML "<html>\n"; 
printf HTML "<head>\n"; 
printf HTML "<title>Cell-phone Usage</title>"; 
printf HTML "<style>\n";
printf HTML "body{background-image: url('beige001.jpg'); max-width:100%;}\n";
printf HTML "#subject{font-family:Arial, sans-serif; font-size:30px; color: blue;text-align:center;}\n";
printf HTML "div{height:50%; width:65%; background-color: #aaa; border:2px solid black; margin-left:15%; margin-right:15%; padding:5%;}\n";
printf HTML ".text{font-family:Arial, sans-serif; font-size:22px;}\n";
printf HTML ".bar{font-family:Arial, sans-serif; font-size:2vw;}\n";
printf HTML "</style>\n";
printf HTML "</head>\n";  
printf HTML "<p id='subject'>Visual model of data</p>";

printf HTML "<div>\n";
printf HTML "<svg width='100%' height='100%' version='1.1' xmlns='http://www.w3.org/2000/svg'>" ;

printf HTML "<text x='10' y='35' dy='2em' fill='0074d9' class='text'>ios</text>\n";
printf HTML "<rect x='100' y='50' height='50' fill='#0074d9' width='$type_ios%'/>"; 
printf HTML "<text x='100' y='35' dy='2em' fill='orange' class='bar'>$type[0]</text>\n";
printf HTML "<text x='10' y='90' dy='2em' fill='0074d9' class='text'>android</text>\n";
printf HTML "<rect x='100' y='110' height='50' fill='#0074d9' width='$type_android%'/>"; 
printf HTML "<text x='100' y='90' dy='2em' fill='orange' class='bar'>$type[1]</text>\n";
printf HTML "<text x='10' y='160' dy='2em' fill='0074d9' class='text'>windows</text>\n";
printf HTML "<rect x='100' y='170' height='50' fill='#0074d9' width='$type_windows%'/>"; 
printf HTML "<text x='100' y='160' dy='2em' fill='orange' class='bar'>$type[2]</text>\n";
printf HTML "<text x='10' y='220' dy='2em' fill='0074d9' class='text'>others</text>\n";
printf HTML "<rect x='100' y='230' height='50' fill='#0074d9' width='$type_others%'/>"; 
printf HTML "<text x='100' y='220' dy='2em' fill='orange' class='bar'>$type[3]</text>\n";

printf HTML "</svg>"; 
printf HTML "</div>\n";
printf HTML "</body>\n"; 
printf HTML "</html>\n"; 

close (HTML);

  close $fh;
