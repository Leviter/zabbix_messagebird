#!/usr/bin/perl

use strict;
use warnings;

$ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;

my $msisdns = $ARGV[0];
my $sender = $ARGV[1];
my $msg = $ARGV[2];
my $key = $ARGV[3];

&sendviasms;

sub sendviasms {

  use JSON::PP;
  use LWP::UserAgent;
  use HTTP::Request::Common qw(POST);

  use constant MESSAGE_URI => "https://rest.messagebird.com/messages";

  my @msisdns = split(',', $msisdns);

  my $payload = {
    recipients => \@msisdns,
    originator => $sender,
    body => $msg,
  };

  my $json = encode_json $payload;

  my $ua = LWP::UserAgent->new;

  my $req = POST MESSAGE_URI;
  $req->content_type('application/json');
  $req->content($json);
  $req->header('Content-Length', length($json));
  $req->header('Authorization', 'AccessKey ' . $key);

  my $resp = $ua->request($req);

  print $resp->as_string;

  if (!$resp->is_success) {
    print "Error! SMS was not sent!";
  } else {
    print "SMS sent successfully";
  }
}
