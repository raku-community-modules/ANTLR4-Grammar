use v6.c;
use ANTLR4::Grammar;
use Test;

plan 6;

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal-terminal';
grammar Lexer;
plain : 'terminal' | 'other' ;
END
grammar Lexer {
	token plain {
		||	'terminal'
		||	'other'
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal-character range';
grammar Lexer;
plain : 'terminal' | 'a'..'z' ;
END
grammar Lexer {
	token plain {
		||	'terminal'
		||	<[ a .. z ]>
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal-character set';
grammar Lexer;
plain : 'terminal' | [by] ;
END
grammar Lexer {
	token plain {
		||	'terminal'
		||	<[ b y ]>
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal-negated subrule';
grammar Lexer;
plain : 'terminal' | ~('W') ;
END
grammar Lexer {
	token plain {
		||	'terminal'
		||	<-[ W ]>
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal-wildcard';
grammar Lexer;
plain : 'terminal' | . ;
END
grammar Lexer {
	token plain {
		||	'terminal'
		||	.
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal-nonterminal';
grammar Lexer;
plain : 'terminal' | Str ;
END
grammar Lexer {
	token plain {
		||	'terminal'
		||	<Str>
	}
}
END

done-testing;

