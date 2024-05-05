% WSPC IJMPC BibTeX Style File -- version 1.0
% BibTeX version 0.99c, intended for LaTeX2e
%
% 2005/03/26  Rajesh <rajesh@wspc.com.sg>
% World Scientific Publishing Co. Pte. Ltd.
%
% This style was made from 'abbrv.bst' with lots of tweaking to make
% it look like WSPC IJMPC.
%
% If you make bug fixes, improvements, etc. please send in yours
% comments and suggetions to Rajesh <rajesh@wspc.com.sg>
%
% Copying of this file is authorized only if either
% (1) you make absolutely no changes to your copy, including name, or
% (2) if you do make changes, you name it something other than
% btxbst.doc, plain.bst, unsrt.bst, alpha.bst, abbrv.bst and ws-IJMPC.bst.
% This restriction helps ensure that all standard styles are identical.

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    url
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.quote after.sentence
        after.quoted.block after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.quote :=
  #3 'after.sentence :=
  #4 'after.quoted.block :=
  #5 'after.block :=
}

FUNCTION {disp.msg.screen} { #1 }

FUNCTION {type.msg}
{ disp.msg.screen
     { "<ws-IJMPC.bst>"
       top$
       "World Scientific's Bibliography Style File for IJMPC"
       top$
       "version 1.0 (2005/06/16)"
       top$
       "-- by Rajesh"
       top$
       "<unSorted version, follows inhouse bib-pattern 5>"
       top$
     }
     { skip$ }
   if$
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.quote =
    { " " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
        'write$
        { output.state after.quoted.block =
            { write$
              newline$
              "\newblock " write$
            }
            { add.period$ " " * write$ }
          if$
        }
          if$
        }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {blank.sep}
{
 after.quote 'output.state :=
}

FUNCTION {fin.entry}
{ output.state after.quoted.block =
    'skip$
    'add.period$
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { output.state after.quote =
    { after.quoted.block 'output.state := }
    { after.block 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
    'skip$
    { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {bold}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
    nameptr #1 >
         {
          nameptr #4
          #1 + =
          numnames #6
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
        { ", " * t * }
        { numnames #2 >
        { "" * }
        'skip$
          if$
          t "others" =
        { " {\em et~al.}" * }
        { " and " * t * }
          if$
        }
      if$
    }
    't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
    { " (eds.)" * }
    { " (ed.)" * }
      if$
    }
  if$
}

FUNCTION {format.eeditors}
{ editor empty$
    { "" }
    { editor num.names$ #1 >
    { " eds." * }
    { " ed." * }
      if$
    editor format.names}
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { "" title "t" change.case$ * "" * }
  if$
}

FUNCTION {format.title.p}
{ title empty$
    { "" }
    { "" title "t" change.case$ * "" * }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
    { t #1 #2 substring$ "--" = not
        { "--" *
          t #2 global.max$ substring$ 't :=
        }
        {   { t #1 #1 substring$ "-" = }
        { "-" *
          t #2 global.max$ substring$ 't :=
        }
          while$
        }
      if$
    }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
      if$
    }
  while$
}

FUNCTION {format.mdate}
{ year empty$
    { month empty$
    { "" }
    { "there's a month but no year in " cite$ * warning$
      month
    }
      if$
    }
    { month empty$
    { " (" year * ")" *}
    { " (" * month * "" year * ")" *}
      if$
    }
  if$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
    { "" }
    { "there's a month but no year in " cite$ * warning$
      month
    }
      if$
    }
    { month empty$
    { " (" year * ")" *}
    { " (" * month * "" year * ")" *}
      if$
    }
  if$
}

FUNCTION {format.btitle}
    { title emphasize }

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {empty.field.to.null.string}
{ duplicate$ empty$
    { pop$ "" }
    { skip$ }
  if$
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ series empty$
   { "" }
    { volume empty$
       {series *}
       {", " * series * "Vol.~" volume *}
      if$
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
    { series field.or.null }
    { output.state mid.sentence =
        { "no.~" }
        { "No.~" }
      if$
      number *
      series empty$
        { "there's a number but no series in " cite$ * warning$ }
        { " in " * series * }
      if$
    }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
    { edition "l" change.case$ " edn." * }
    { edition "t" change.case$ " edn." * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
    { #1 'multiresult := }
    { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {first.page.number}
{ 't :=
  ""
    { t "" =
        { #0 }
        { t #1 #1 substring$ "-" = not }
      if$
    }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
  while$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { pages first.page.number}
        { "p." pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.ppages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { "pp." pages n.dashify tie.or.space.connect }
        { "p." pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.number}
{ number empty$
    { "" }
    { "("  number * ")" *}
  if$
}

FUNCTION {format.journal.volume.number}
{ journal empty$
    { "empty " t * " in " * cite$ * warning$ ""}
    { journal emphasize }
  if$
  volume empty$      %% warning if no volume
    { "empty volume in " cite$ * warning$ " " *}
    { " " * volume bold *}      %% make volume bold
%%    { "vol.~" volume * }
  if$
%  month empty$
%    { format.number *}
%    'skip$
%  if$
}

FUNCTION {format.series.volume.number}
{ series empty$
   { "" }
    { volume empty$
       {series *}
       {", " * series * "Vol.~" volume *}
      if$
    }
  if$
  month empty$
    { format.number *}
    'skip$
  if$
}

% following not used
FUNCTION {format.volume}
{ volume empty$
    { "" }
    { volume bold }            
%%    { "vol.~" volume * }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.ppages
    { type empty$
    { "ch.~" chapter * }
    { type "l" change.case$ chapter tie.or.space.connect }
      if$
      pages empty$
    'skip$
    { ", " * format.ppages * }
      if$
    }
  if$
}

FUNCTION {format.chapter.ppages}
{ chapter empty$
    'format.ppages
    { type empty$
    { "ch.~" chapter * }
    { type "l" change.case$ chapter tie.or.space.connect }
      if$
      pages empty$
    'skip$
    { ", " * format.ppages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { ", in {\em " * booktitle * "\/}, " *
       format.eeditors
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      output.state after.block =
    { type "t" change.case$ }
    { type "l" change.case$ }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$ 
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Tech. Rep." }
    'type
  if$
  number empty$
    { "l" change.case$ }
    { number tie.or.space.connect }
  if$
}


FUNCTION {format.paddress}
{ address empty$
    { "" }
    { "(" address * ")" * }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
    { "need key or journal for " cite$ * " to crossref " * crossref *
      warning$
      ""
    }
    { " in {\em " journal * "\/}" * }
      if$
    }
    { " in " key * }
  if$
  "\cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " {\em et~al.}" * }
    { #2 <
    'skip$
    { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
        { " {\em et~al.}" * }
        { " and " * editor #2 "{vv~}{ll}" format.name$ * }
      if$
    }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Vol.~" volume *
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { series empty$
        { "need editor, key, or series for " cite$ * " to crossref " *
          crossref * warning$
          "" *
        }
        { "{\em " * series * "\/}" * }
      if$
    }
    { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  "\cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { booktitle empty$
        { "need editor, key, or booktitle for " cite$ * " to crossref " *
          crossref * warning$
          ""
        }
        { " in {\em " booktitle * "\/}" * }   
      if$
    }
    { " in " key * }
      if$
    }
    { " in " format.crossref.editor * }   
  if$
  "\cite{" * crossref * "}" *
}

FUNCTION {push.url}
{}

FUNCTION {push.date}
% format: month year
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        { year }
        { month " " * year * }
      if$
    }
  if$
}


FUNCTION {format.address.date}
{ address empty$
    {year empty$ 
        { "" }
        { push.date *} 
        if$
    }
    { "(" address * ", " * year * ")" * }
  if$
}

FUNCTION {format.school.date}
{ school empty$
    {"school is missing " cite$ * warning$
    year empty$ 
        { "" }
        { push.date *} 
        if$
    }
    { "(" school * ", " * year * ")" * }
  if$
}

FUNCTION {push.address.publisher.year}
% the whole imprint
{ address empty$
    { publisher empty$
        { url empty$
            { year empty$ 
                { "" }
                { push.date } 
              if$
            }
            { 
              push.url
              year empty$
                { skip$ }
                { ", " * push.date * ")" * }
              if$
            }
          if$
        }
      { "(" publisher *
      year empty$
            { skip$ }
            { ", " * push.date * ")" * }
          if$
        }
      if$
    }
    { 
      publisher empty$
        { skip$ }
        { "(" publisher * ", " * address * }
      if$
      year empty$
    { ")" * }
    { ", " * push.date * ")" * }
      if$
    }
  if$
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  crossref missing$
    { format.journal.volume.number output
      format.pages output
      blank.sep
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
    { "author and editor" editor either.or.check }
    'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      format.edition output
      blank.sep      
      push.address.publisher.year "publisher" output.check
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  title empty$
    { "empty title in " cite$ * warning$
      howpublished new.sentence.checka
    }
    { howpublished empty$ not
      address empty$ month empty$ year empty$ and and
      or
    { format.title.p output.nonnull }
    { format.title output.nonnull }
      if$
    }
  if$
  howpublished output
  publisher empty$
  {format.address.date output}
  {push.address.publisher.year "publihser" output.check}
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull}
  if$
  format.btitle "title" output.check
  blank.sep
  format.in.ed.booktitle "booktitle" output.check
  crossref missing$
    { format.bvolume output
      blank.sep
      format.number.series output
      push.address.publisher.year "publisher" output.check
      address output
      format.chapter.ppages "chapter and pages" output.check      
    }
    { format.chapter.ppages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  blank.sep
  crossref missing$
    { format.in.ed.booktitle "booktitle or editor" output.check
     format.series.volume.number output
      blank.sep
      push.address.publisher.year "publisher" output.check
      format.ppages output
      format.edition output
    }
    { format.incoll.inproc.crossref output.nonnull
      blank.sep
      format.ppages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  blank.sep
  crossref missing$
    { format.in.ed.booktitle output  %remove check for booktitle
      journal empty$
          {format.series.volume.number output}
          {format.journal.volume.number output}
     if$
  blank.sep     
        publisher empty$
            {format.address.date output}
            {push.address.publisher.year "publihser" output.check}
        if$
    }
    { format.chapter.ppages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
    'skip$
    { organization output.nonnull
      address output
    }
      if$
    }
    { format.authors output.nonnull }
  if$
  format.btitle "title" output.check
  author empty$
    { organization empty$
    { address new.block.checka
      address output
    }
    'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  "Master's thesis" format.thesis.type output.nonnull
  %format.school.date "school" output.check
  school output
  blank.sep
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title empty$
    { howpublished new.sentence.checka }
    { howpublished empty$ not
      month empty$ year empty$ and
      or
    { format.title.p output.nonnull }
    { format.title output.nonnull }
      if$
      blank.sep
    }
  if$
  howpublished output
  format.date output
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  "PhD thesis" format.thesis.type output.nonnull
  school "school" output.check
  publisher empty$
  {format.address.date output}
  {push.address.publisher.year "publihser" output.check}
  if$
  format.ppages output
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  format.btitle "title" output.check
  blank.sep  
  format.series.volume.number output   
  editor empty$
    'skip$
    { organization output }
  if$
   push.address.publisher.year "publisher" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  format.tr.number output.nonnull
  institution "institution" output.check
  blank.sep
  address empty$
  {format.mdate output}
  {format.address.date output}
  if$
  note output
  fin.entry
  new.block  
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  format.title.p "title" output.check
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications ACM"}

MACRO {ibmjrd} {"IBM J. Research and Development"}

MACRO {ibmsj} {"IBM Systems~J."}

MACRO {ieeese} {"IEEE Trans. Software Engineering"}

MACRO {ieeetc} {"IEEE Trans. Computers"}

MACRO {ieeetcad} {"IEEE Trans. Computer-Aided Design"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM J. Computing"}

MACRO {tocs} {"ACM Trans. Computer Systems"}

MACRO {tods} {"ACM Trans. Database Systems"}

MACRO {tog} {"ACM Trans. Graphics"}

MACRO {toms} {"ACM Trans. Mathematical Software"}

MACRO {toois} {"ACM Trans. Office Information Systems"}

MACRO {toplas} {"ACM Trans. Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

EXECUTE {type.msg}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    { s }
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        { skip$ }
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
        { "et al" * }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$ "" }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$ "" }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$ "" }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$ "" }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {author.organization.institution.sort}
{ author empty$
    { organization empty$
        { institution empty$
            { key empty$
                { "to sort, need author, organization, institution or key in " cite$ * warning$ "" }
                { key sortify }
              if$
            }
            { "The " #4 institution chop.word sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}


FUNCTION {presort}
{ type$ "ieeetranbstctl" =
    { key empty$
        { "_" }
        { key sortify }
      if$
    }
    { type$ "book" =
      type$ "inbook" =
      or 
        { author.editor.sort }
        { type$ "proceedings" =
          type$ "periodical" =
          or
            { editor.organization.sort }
            { type$ "manual" =
              type$ "electronic" =
              type$ "misc" =
              or or
                { author.organization.sort }
                { type$ "standard" =
                   { author.organization.institution.sort }
                   { author.sort }
                 if$ 
                }
              if$
            }
          if$
        }
      if$
      "    "
      *
      year empty.field.to.null.string sortify
      *
      "    "
      *
      title empty.field.to.null.string
      sort.format.title
      *
    }
  if$
  #1 entry.max$ substring$
  'sort.key$ :=
}

%ITERATE {presort}

%SORT

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}

%%
%% End of file
%% For Support: ykoh@wspc.com.sg, rajesh@wspc.com.sg
%% ws-IJMPC.bst (C) World Scientific Publishing Co.
