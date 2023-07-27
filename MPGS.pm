# Version: $Id: MPGS.pm, v. 0.1, by CH 25.07.2023
package Parsers::TargetParser::DOCUMENT_DELIVERY::MPGS;
use strict;
use base qw(Parsers::TargetParser);
use URI;

sub getDocumentDelivery {
#       my ($this, $ctx_obj) = @_;
        my ($this) = @_;

        my $svc         = $this->{svc};
        my $ctx_obj     = $this->{ctx_obj};

        my $genre       = $ctx_obj->get('rft.genre') || '';
        my $issn        = $ctx_obj->get('rft.issn') || '';

        my $url1        = $svc->parse_param('bookurl');
        my $url2        = $svc->parse_param('articleurl');


        my $url = "";


        if ($issn ne '' || ($genre =~ /^(journal|issue|article|proceeding|conference|preprint|dissertation)$/)) {
            $url = $url2;
            }
            else {
            $url = $url1;
            }


        my $uri = "";
        my %query = ();


        my $uri = URI->new($url);
        $uri->query_form(%query);
        return ($uri);
}
1;
