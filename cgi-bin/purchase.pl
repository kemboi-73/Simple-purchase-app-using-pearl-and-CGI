#!C:/Strawberry/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

my $cgi = CGI->new;
print $cgi->header;
# extracts parameters from cgi request
my $name = $cgi->param('name');
my $item = $cgi->param('item');
my $quantity = $cgi->param('quantity');
my $price = $cgi->param('price');
# calculate total and also tax
if (defined $name && defined $item && defined $quantity && defined $price) {
    my $subtotal = $quantity * $price;
    my $sales_tax = sprintf("%.2f", $subtotal * 0.07); # 7% sales tax
    my $total = sprintf("%.2f", $subtotal + $sales_tax);
    
# generates receipt html
    print <<END_HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .container p {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Here is your purchase details</h2>
        <p>Item ordered: $item</p>
        <p>Quantity: $quantity</p>
        <p>Unit price: KES $price</p>
        <p>Sub total: KES $subtotal</p>
        <p>Sales tax: KES $sales_tax</p>
        <p>Total of your purchase: KES $total</p>
        <p>Thank you, $name, for shopping with us!</p>
    </div>
</body>
</html>
END_HTML
}
