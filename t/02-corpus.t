use v6.c;
use ANTLR4::Grammar::Parser;
use Test;

plan 54;

my $p = ANTLR4::Grammar::Parser.new;

# Commenting out the Abnf test as 04-use-parser.t tests:
# parsing a .g4 file
# Compiling the .g4 file into Raku
# Evaluating the grammar
# Parsing a sample .abnf document
#
# So it's a pretty complete test now.
#
#ok $p.parsefile( 'corpus/Abnf.g4'                ), 'Abnf.g4'; # roundtrip
ok $p.parsefile( 'corpus/ANTLRv4Lexer.g4'        ), 'ANTLRv4Lexer.g4';
ok $p.parsefile( 'corpus/ANTLRv4Parser.g4'       ), 'ANTLRv4Parser.g4';
#ok $p.parsefile( 'corpus/asm6502.g4'             ), 'asm6502.g4'; # roundtrip
ok $p.parsefile( 'corpus/ATL.g4'                 ), 'ATL.g4';
ok $p.parsefile( 'corpus/bnf.g4'                 ), 'bnf.g4';
ok $p.parsefile( 'corpus/C.g4'                   ), 'C.g4';
ok $p.parsefile( 'corpus/Clojure.g4'             ), 'Clojure.g4';
ok $p.parsefile( 'corpus/creole.g4'              ), 'creole.g4';
ok $p.parsefile( 'corpus/CSharp4.g4'             ), 'CSharp4.g4';
ok $p.parsefile( 'corpus/CSharp4Lexer.g4'        ), 'CSharp4Lexer.g4';
ok $p.parsefile( 'corpus/CSharp4PreProcessor.g4' ), 'CSharp4PreProcessor.g4';
ok $p.parsefile( 'corpus/CSV.g4'                 ), 'CSV.g4';
ok $p.parsefile( 'corpus/DOT.g4'                 ), 'DOT.g4';
ok $p.parsefile( 'corpus/ECMAScript.g4'          ), 'ECMAScript.g4';
ok $p.parsefile( 'corpus/Erlang.g4'              ), 'Erlang.g4';
ok $p.parsefile( 'corpus/fasta.g4'               ), 'fasta.g4';
ok $p.parsefile( 'corpus/gff3.g4'                ), 'gff3.g4';
ok $p.parsefile( 'corpus/HTMLLexer.g4'           ), 'HTMLLexer.g4';
ok $p.parsefile( 'corpus/HTMLParser.g4'          ), 'HTMLParser.g4';
ok $p.parsefile( 'corpus/ICalendar.g4'           ), 'ICalendar.g4';
ok $p.parsefile( 'corpus/IDL.g4'                 ), 'IDL.g4';
ok $p.parsefile( 'corpus/IRI.g4'                 ), 'IRI.g4';
ok $p.parsefile( 'corpus/Java8.g4'               ), 'Java8.g4';
ok $p.parsefile( 'corpus/Java.g4'                ), 'Java.g4';
ok $p.parsefile( 'corpus/JSON.g4'                ), 'JSON.g4';
ok $p.parsefile( 'corpus/jvmBasic.g4'            ), 'jvmBasic.g4';
ok $p.parsefile( 'corpus/LessLexer.g4'           ), 'LessLexer.g4';
ok $p.parsefile( 'corpus/LessParser.g4'          ), 'LessParser.g4';
ok $p.parsefile( 'corpus/logo.g4'                ), 'logo.g4';
ok $p.parsefile( 'corpus/Lua.g4'                 ), 'Lua.g4';
ok $p.parsefile( 'corpus/MySQLBase.g4'           ), 'MySQLBase.g4';
ok $p.parsefile( 'corpus/MySQL.g4'               ), 'MySQL.g4';
ok $p.parsefile( 'corpus/ObjC.g4'                ), 'ObjC.g4';
ok $p.parsefile( 'corpus/PCRE.g4'                ), 'PCRE.g4';
ok $p.parsefile( 'corpus/PGN.g4'                 ), 'PGN.g4';
ok $p.parsefile( 'corpus/Python3.g4'             ), 'Python3.g4';
ok $p.parsefile( 'corpus/redcode.g4'             ), 'redcode.g4';
ok $p.parsefile( 'corpus/RFilter.g4'             ), 'RFilter.g4';
ok $p.parsefile( 'corpus/R.g4'                   ), 'R.g4';
ok $p.parsefile( 'corpus/scala.g4'               ), 'scala.g4';
ok $p.parsefile( 'corpus/ScssLexer.g4'           ), 'ScssLexer.g4';
ok $p.parsefile( 'corpus/ScssParser.g4'          ), 'ScssParser.g4';
ok $p.parsefile( 'corpus/Smalltalk.g4'           ), 'Smalltalk.g4';
ok $p.parsefile( 'corpus/SQLite.g4'              ), 'SQLite.g4';
ok $p.parsefile( 'corpus/Swift.g4'               ), 'Swift.g4';
ok $p.parsefile( 'corpus/tnsnames.g4'            ), 'tnsnames.g4';
ok $p.parsefile( 'corpus/tnt.g4'                 ), 'tnt.g4';
ok $p.parsefile( 'corpus/TURTLE.g4'              ), 'TURTLE.g4';
ok $p.parsefile( 'corpus/UCBLogo.g4'             ), 'UCBLogo.g4';
ok $p.parsefile( 'corpus/Verilog2001.g4'         ), 'Verilog2001.g4';
ok $p.parsefile( 'corpus/vhdl.g4'                ), 'vhdl.g4';
#ok $p.parsefile( 'corpus/VisualBasic6.g4'        ), 'VisualBasic6.g4';
skip 'Need to fix UTF-8 issue', 1;
ok $p.parsefile( 'corpus/WebIDL.g4'              ), 'WebIDL.g4';
ok $p.parsefile( 'corpus/XMLLexer.g4'            ), 'XMLLexer.g4';
ok $p.parsefile( 'corpus/XMLParser.g4'           ), 'XMLParser.g4';

