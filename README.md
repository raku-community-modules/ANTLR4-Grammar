ANTLR4::Grammar
===============

`ANTLR4::Grammar` generates a Raku representation of an ANTLR4 AST.

Synopsis
========

        use ANTLR4::Grammar;
        my $ag = ANTLR4::Grammar.new;

        say $ag.to-string('grammar Minimal { identifier : [A-Z][A-Za-z]+ ; }');
        say $ag.file-to-string('ECMAScript.g4');

Installation
============

From the ecosystem using `zef`:

        zef install ANTLR4::Grammar

Documentation
=============

In its simplest form, just use the `to-string` method on an existing grammar text to get back its closest Raku representation.

Extension
=========

Suppose you don't like how the module formats the ANTLR grammar. Subclass this module and override the `to-lines` methods I've provided, or go all the way back to the top level and replace the `to-lines( Grammar $g )` with your own inheritance hierarchy.

Maybe you want to add a way to create a bare-bones action class to go along with your resulting grammar - override the `to-string` method, you've got the `$grammar` value that you can walk through, and do your own thing.

Author
======

✝ Jeffrey Goff, DrForr on #raku, https://github.com/drforr/

Maintained by the Raku community (2020-2023)

License
=======

Artistic License 2.0

