
$dollarsign = '$';
while (<>) {
    if (s/(\Q$dollarsign\E)\s+(\d+)/MONEY/g) {
	print;
    }
}



