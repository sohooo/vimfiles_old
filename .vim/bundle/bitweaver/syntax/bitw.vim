" Vim syntax file
" Language:	Bitweaver
" Maintainer:	Sven Sporer <sven@svensporer.net>
" URL:		http://svensporer.net
" Version:	1
" Last Change:  2010-03-08
" TODO: 	Do something appropriate with image syntax
" TODO: 	Handle stuff contained within stuff (e.g. headings within blockquotes)


" Read the HTML syntax to start with
if version < 600
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

colorscheme bitweaver

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

"syn spell toplevel
syn case ignore
syn sync linebreaks=1

"additions to HTML groups
syn region htmlBold     start=/\(^\|\s\)\*\@<!\*\*\*\@!/     end=/\*\@<!\*\*\*\@!\($\|\s\)/   contains=@Spell,htmlItalic
syn region htmlItalic   start=/\(^\|\s\)\*\@<!\*\*\@!/       end=/\*\@<!\*\*\@!\($\|\s\)/      contains=htmlBold,@Spell
syn region htmlBold     start=/\(^\|\s\)_\@<!___\@!/         end=/_\@<!___\@!\($\|\s\)/       contains=htmlItalic,@Spell
syn region htmlItalic   start=/\(^\|\s\)_\@<!__\@!/          end=/_\@<!__\@!\($\|\s\)/        contains=htmlBold,@Spell
syn region htmlString   start="]("ms=s+2             end=")"me=e-1
syn region htmlLink     start="\["ms=s+1            end="\]"me=e-1 contains=@Spell
syn region htmlLink     start="(("ms=s+2            end="))"me=e-2 contains=@Spell
syn region htmlString   start="\(\[.*]: *\)\@<=.*"  end="$"

"define Bitweaver groups
syn match  bitwLineContinue ".$" contained
" horizontal lines
syn match  bitwRule      /^\s*\*\s\{0,1}\*\s\{0,1}\*$/
syn match  bitwRule      /^\s*-\s\{0,1}-\s\{0,1}-$/
syn match  bitwRule      /^\s*_\s\{0,1}_\s\{0,1}_$/
syn match  bitwRule      /^\s*-\{3,}$/
syn match  bitwRule      /^\s*\*\{3,5}$/
syn match  bitwRule      />>*/   contains=bitwString,@Spell
syn match  bitwRule      /^\^/
" list items
syn match  bitwListItem  "^\s*[-*+#]\+\s\+"
syn match  bitwListItem  "^\s*\d\+\.\s\+"
syn match  bitwCode      /^\s*\n\(\(\s\{4,}\|[\t]\+\)[^*-+ ].*\n\)\+/
syn region bitwCode      start=/`/                   end=/`/
"syn region bitwCode      start=/-\+/                   end=/\+-/
syn region bitwCode      start="-+"                   end="+-"
syn region bitwCode      start="{"                   end="}"
syn region bitwCode      start=/\s*``[^`]*/          end=/[^`]*``\s*/
"syn region bitwBlockquote start=/^\s*>/              end=/$/                 contains=bitwLineContinue,@Spell
syn region bitwCode      start="<pre[^>]*>"         end="</pre>"
syn region bitwCode      start="<code[^>]*>"        end="</code>"           contains=bitwLineContinue,@Spell
syn region bitwCode      start="{code*}"        end="{/code}"

"HTML headings
syn region htmlH1       start="^\s*!"                   end="\($\|!\+\)" contains=@Spell
syn region htmlH2       start="^\s*!!"                  end="\($\|!\+\)" contains=@Spell
syn region htmlH3       start="^\s*!!!"                 end="\($\|!\+\)" contains=@Spell
syn region htmlH4       start="^\s*!!!!"                end="\($\|!\+\)" contains=@Spell
syn region htmlH5       start="^\s*!!!!!"               end="\($\|!\+\)" contains=@Spell
syn region htmlH6       start="^\s*!!!!!!"              end="\($\|!\+\)" contains=@Spell
syn match  htmlH1       /^.\+\n=\+$/ contains=@Spell
syn match  htmlH2       /^.\+\n-\+$/ contains=@Spell

"highlighting for Bitweaver groups
HtmlHiLink bitwString	    String
HtmlHiLink bitwCode          String
HtmlHiLink bitwBlockquote    Comment
HtmlHiLink bitwLineContinue  Comment
HtmlHiLink bitwListItem      Identifier
HtmlHiLink bitwRule          Identifier


let b:current_syntax = "bitw"

delcommand HtmlHiLink
" vim: ts=8
