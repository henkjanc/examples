
$source = "https://www.nu.nl"
$mypath = "/Users/henk-jancastermans/examples/puppet"

if $source =~ /https:\/\// {
   notify {"Source is a url ":}
}

if $mypath =~ /https:\/\// {
   notify {"Path is a url ":}
}
