Read Me

Run the perl program on terminal using below commands:
$perl myTranslater.pl

If you get an error on Text/CSV.pm when running Perl Script, run below command to install:
$perl -MCPAN -e'install Text::CSV'

Files in the folder:

myTranslater.pl - 
	A Perl program to read in the data from a cell-phones.csv (text file with comma separated values) and generate a visual model of the data, using SVG embedded in an HTML 5 document.

cell-phones.csv - 
	The input text file contains several lines of text where each line is either a comment line or a data line. A Comment line starts with a “#” and extends to the end of the line.

cell-phones_00001188522.html -
	HTML file for the bar chart is generated.


