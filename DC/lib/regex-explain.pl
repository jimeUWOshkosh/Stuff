#!/usr/bin/eval perl
use strict; use warnings;
use YAPE::Regex::Explain;
print YAPE::Regex::Explain->new('/\b(FAILURE|ALWAYS)\(\s*(\w.*?)\(\s*(.*)\)\s*\)\s*\,\s*\z/')->explain();
