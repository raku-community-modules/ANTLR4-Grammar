use v6.c;
use ANTLR4::Grammar;
use Test;

plan 9;

# No way to generate an empty token, otherwise it'd be here.
#
is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'empty rule';
grammar Empty;
empty : ( ) ;
END
grammar Empty {
	token empty {
		||	(
			)
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'empty fragment';
grammar Empty;
fragment empty : ( ) ;
END
grammar Empty {
	token empty {
		||	(
			)
	}
}
END

subtest 'modifiers', {
	# a negated group is actually a negated character class, which
	# we checked earlier.
	#
	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'question';
	grammar Empty;
	empty : ( )? ;
	END
	grammar Empty {
		token empty {
			||	(
				)?
		}
	}
	END

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'star';
	grammar Empty;
	empty : ( )* ;
	END
	grammar Empty {
		token empty {
			||	(
				)*
		}
	}
	END

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'plus';
	grammar Empty;
	empty : ( )+ ;
	END
	grammar Empty {
		token empty {
			||	(
				)+
		}
	}
	END

	done-testing;
};

subtest 'grouped thing', {
	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal';
	grammar Empty;
	stuff : ( 'foo' ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	'foo'
				)
		}
	}
	END

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'character range';
	grammar Empty;
	stuff : ( 'a'..'z' ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	<[ a .. z ]>
				)
		}
	}
	END

	subtest 'modifiers', {
		is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'question';
		grammar Empty;
		stuff : ( 'a'..'z'? ) ;
		END
		grammar Empty {
			token stuff {
				||	(	||	<[ a .. z ]>?
					)
			}
		}
		END

		is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'star';
		grammar Empty;
		stuff : ( 'a'..'z'* ) ;
		END
		grammar Empty {
			token stuff {
				||	(	||	<[ a .. z ]>*
					)
			}
		}
		END


		is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'plus';
		grammar Empty;
		stuff : ( 'a'..'z'+ ) ;
		END
		grammar Empty {
			token stuff {
				||	(	||	<[ a .. z ]>+
					)
			}
		}
		END

		done-testing;
	};

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'character set';
	grammar Empty;
	stuff : ( [c] ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	<[ c ]>
				)
		}
	}
	END

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'alternate character set';
	grammar Empty;
	stuff : ( ~'c' ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	<-[ c ]>
				)
		}
	}
	END

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'negated character set subrule';
	grammar Empty;
	stuff : ( ~( 'c' ) ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	<-[ c ]>
				)
		}
	}
	END

	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'wildcard';
	grammar Empty;
	stuff : ( . ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	.
				)
		}
	}
	END


	is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'nonterminal';
	grammar Empty;
	stuff : ( Str ) ;
	END
	grammar Empty {
		token stuff {
			||	(	||	<Str>
				)
		}
	}
	END

	done-testing;
};

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'concatenation';
grammar Empty;
stuff : ( Str 'testing' ) ;
END
grammar Empty {
	token stuff {
		||	(	||	<Str>
					'testing'
			)
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'alternation';
grammar Empty;
stuff : ( Str | 'testing' ) ;
END
grammar Empty {
	token stuff {
		||	(	||	<Str>
				||	'testing'
			)
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'nesting';
grammar Empty;
stuff : ( ( Str | 'testing' ) ) ;
END
grammar Empty {
	token stuff {
		||	(	||	(	||	<Str>
						||	'testing'
					)
			)
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'terminal + nesting';
grammar Empty;
stuff : ( ( Str | 'testing' ) 'foo' ) ;
END
grammar Empty {
	token stuff {
		||	(	||	(	||	<Str>
						||	'testing'
					)
					'foo'
			)
	}
}
END

is ANTLR4::Grammar.to-string( Q:to[END] ), Q:to[END], 'regression from IDL';
grammar Empty;
stuff : ('0' | '1'..'9' '0'..'9'*) SUFFIX? ;
END
grammar Empty {
	token stuff {
		||	(	||	'0'
				||	<[ 1 .. 9 ]>
					<[ 0 .. 9 ]>*
			)
			<SUFFIX>?
	}
}
END

done-testing;

