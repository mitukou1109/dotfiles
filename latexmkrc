#!/usr/bin/env perl

$do_cd = 1;
$max_repeat = 5;
$pdf_mode = 3;

$latex = 'uplatex -synctex=1 -file-line-error -halt-on-error %O %S';

$bibtex = 'upbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

$makeindex = 'upmendex %O -o %D %S';

$dvipdf = 'dvipdfmx %O -o %D %S';
