use v6;

use Test;
use CSS::Grammar::CSS1;

# from: http://www.w3.org/Style/CSS/Test/CSS1/current/sec71.htm
my $css3_sample = q:to/END_CSS3/;
P.one {color: green; rotation: 70deg;}
P.oneb {color: green;}
P.oneb {color: invalidValue;}
P.two {background-color: inherit;}
@zz {foo:bar}
H1 + P.three {color: blue;}
P.four + H1 {color: red;}
P.five {background-color: "red";}
P.sixa {border-width: medium; border-style: solid;}
P.sixb {border-width: funny; border-style: solid;}
P.sixc {border-width: 50Hz; border-style: solid;}
P.sixd {border-width: px; border-style: solid;}

@three-dee {
 @background-lighting {
  azimuth: 30deg;
  elevation: 190deg;
  }
 P.seven { color: red }
 }

P.eight {COLOR: GREEN;}
OL:wait {color: maroon;}
P.ten:first-child {color: maroon;}
UL:lang(fr) {color: gray;}
BLOCKQUOTE[href] {color: navy;}
ACRONYM[href="foo"] {color: purple;}
ADDRESS[href~="foo"] {color: purple;}
SPAN[lang|="fr"] {color: #c37;}
@media tty {
 H1 {color: red;}
 P.sixteen {color: red;}
 }
@three-dee {
 P.seventeen {color: red }
 }
P.eighteena {text-decoration: underline overline line-through diagonal;
            font: bold highlighted 100% sans-serif;}
P.eighteenb {text-decoration: underline overline line-through diagonal;
            font: bold highlighted 100% serif;}
EM, P.nineteena ! EM, STRONG {font-size: 200%; }

// UL.nineteenb,
P.nineteenb {color: red;}

P.twentya {rotation-code: "}"; color: blue;} 
P.twentyb {rotation-code: "\"}\""; color: green;}
P.twentyonea {rotation-code: '}'; color: purple;} 
P.twentyoneb {rotation-code: '\'}\''; color: green;}

P.twentytwo {
 type-display: @threedee {rotation-code: '}';};
 color: green;
 }

P.twentythree {text-indent: 0.5in;}

P.twentyfour {color: red;}
END_CSS3

for (
    sample => $css3_sample,
    ) {
    my $css1 = $_.value.comb(/<CSS::Grammar::CSS1::strands>/);
    say "css1 combed: " ~ $css1;
    my $p = CSS::Grammar::CSS1.parse( $css1 );
    ok( $p, 'css3 sample ' ~ $_.key)
    or diag do {$_.value ~~ /(<CSS::Grammar::CSS1::stylesheet>)/; $0.Str || $_.value},
	    
}


done;
