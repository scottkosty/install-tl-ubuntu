%% This is file `econsocart.cls'
%%
%% LaTeX 2e style file for the processing of LaTeX2e files
%% of the following The Econometric Society journals:
%%
%% - Econometrica
%% - Quantitative Economics
%% - Theoretical Economics
%%
%% TeX programming: Edgaras Sakuras, VTeX, Lithuania
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% The original distribution is located at:
%% https://www.e-publications.org/es/support/
%%
%% Copyright (c) 2022 UAB "VTeX"
%%
%% Permission is granted to copy, distribute and/or modify this
%% software under the terms of the LaTeX Project Public License
%% (LPPL), version 1.3c or any later version.
%%
\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{econsocart}[2025/03/07 v1.4.20, The Econometric Society Journals]
% 
\RequirePackage{etoolbox}
% 
\newif\if@supplement \@supplementfalse
\newif\if@onlineonly \@onlineonlyfalse
\newif\if@supplement@onlineonly \@supplement@onlineonlyfalse
\newif\if@report \@reportfalse
\newif\if@sici \@sicifalse
\newif\if@biblink \@biblinkfalse
\newif\ifendbibitem@ \endbibitem@false
\newif\if@contcaption
\newif\if@nameyear \@nameyearfalse
\newif\if@load@amsmath \@load@amsmathfalse
\newif\if@seceqn \@seceqnfalse
\newif\if@wwwviewable
\newif\if@wwwprintable
\newif\if@urllinks \@urllinksfalse
\newif\if@bookmarks
\newif\if@nowps@md \@nowps@mdfalse
\newif\if@xmlfmbm \@xmlfmbmfalse
\newif\if@open@access \@open@accessfalse
\newif\if@displaystyle@addons \@displaystyle@addonstrue
\newif\ifqe@layout \qe@layoutfalse
\newif\ifte@layout \te@layoutfalse
\newif\ifecta@layout \ecta@layoutfalse
\newif\iffirstitem \firstitemtrue
\newif\ifseconditem \seconditemfalse
\newif\if@enum
\newif\if@longlist
\newif\if@fleqn
\newif\if@tabcell@hook
\newif\if@firstkeywordinlist \@firstkeywordinlisttrue
\newif\if@allsections \@allsectionsfalse
\newif\if@labelled \@labelledfalse
\newif\if@unsdlbl
\newif\if@econsocart@querypage \@econsocart@querypagetrue
\newif\ifnot@ead@star
\newif\if@printead@opt
\newif\if@econsocart@draft \@econsocart@draftfalse
\newif\if@econsocart@final \@econsocart@finalfalse
\newif\if@econsocart@numberlines \@econsocart@numberlinesfalse
\newif\if@econsocart@debug \@econsocart@debugfalse
% 
% Class cfg load
\InputIfFileExists{econsocart-vtex.cfg}{}{\input{econsocart.cfg}}
% 
% Definitions
\newcommand\bibname{References}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{}
\newcommand\acknowledgementsname{Acknowledgements}
\overfullrule=\z@
%
% Debug
\DeclareOption{debug}{%
    \@econsocart@debugtrue
    }
% 
% General Options
\DeclareOption{amsmath}{%
    \@load@amsmathtrue
    \csuse{econsocart@amsmath@vtexmth}%
    }
\DeclareOption{noamsmath}{%
    \@load@amsmathfalse
    }
\DeclareOption{seceqn}{\@seceqntrue}
%
% Specific Options
\def\thepage@prefix{}
\DeclareOption{notes}{\AtBeginDocument{\layout@notes}}
\DeclareOption{supplement}{%
    \global\@supplementtrue
    \global\@supplement@onlineonlytrue
    }
\DeclareOption{onlineonly}{%
    \global\@onlineonlytrue
    \global\@supplement@onlineonlytrue
    \def\thepage@prefix{o}%
    }
\DeclareOption{report}{\@reporttrue}
%
% Different paper sizes
\DeclareOption{wwwview}{\@wwwviewabletrue}
\DeclareOption{wwwprint}{\@wwwprintabletrue}
%
\csuse{econsocart@pdfoptions}
%
\DeclareOption{bookmarks}{\global\@bookmarkstrue}
\DeclareOption{nobookmarks}{\global\@bookmarksfalse}
\DeclareOption{nowpsmd}{\global\@nowps@mdtrue}
%
% XML options
\DeclareOption{xmlfm}{\@xmlfmbmtrue}
\DeclareOption{xmlbm}{\@xmlfmbmtrue}
%
% open access
\DeclareOption{openaccess}{\global\@open@accesstrue}
%
% query page
\DeclareOption{noquerypage}{\global\@econsocart@querypagefalse}
%
% put lines numbers in margins
\DeclareOption{linenumbers}{\global\@econsocart@numberlinestrue}
\DeclareOption{nolinenumbers}{\global\@econsocart@numberlinesfalse}
%
% submission mode
\DeclareOption{draft}{%
    \@econsocart@finalfalse
    \@econsocart@drafttrue
    \@econsocart@numberlinestrue
    \PassOptionsToPackage{draft=false}{hyperref}%
    \PassOptionsToPackage{final}{graphics}%
    }
% print mode
\DeclareOption{final}{%
    \@econsocart@finaltrue
    \@econsocart@draftfalse
    \@econsocart@numberlinesfalse
    }
%
%% Journals 
\DeclareOption{te}{%
    \global\te@layouttrue
    \def\issn{1933-6837}%
    \def\@eissn{1555-7561}%
    \def\@journal{Theoretical Economics}%
    \def\journal@url{https://econtheory.org}%
    \def\sup@journal{Supplementary Material}%
    \def\copyright@owner{Copyright owner}%
    \let\copyright@default\copyright@owner
    \def\@jid{TE}%
    \def\@shortjid{te}%
    }
%
\DeclareOption{qe}{%
    \global\qe@layouttrue
    \def\@issn{1759-7323}%
    \def\@eissn{1759-7331}%
    \def\@journal{Quantitative Economics}%
    \def\sup@journal{Supplementary Material}%
    \def\journal@url{http://qeconomics.org}%
    \def\copyright@owner{Copyright owner}%
    \let\copyright@default\copyright@owner
    \def\@jid{QE}%
    \def\@shortjid{qe}%
    \csuse{econsocart@nolistindent@mattson@amsmath}%
    }
%
\DeclareOption{ecta}{%
    \global\ecta@layouttrue
    \def\@issn{0012-9682}%
    \def\@eissn{1468-0262}%
    \def\@journal{Econometrica}%
    \def\journal@url{https://www.econometricsociety.org/}%
    \def\sup@journal{Econometrica Supplementary Material}%
    \def\sup@journal@url{https://www.econometricsociety.org/suppmatlist.asp}%
    \def\copyright@owner{The Econometric Society}%
    \let\copyright@default\copyright@owner
    \def\@jid{ECTA}%
    \def\@shortjid{ecta}%
    \csuse{econsocart@nolistindent@mattson@amsmath}%
    }
%
% Default information about journal
\def\@issn{0000-0000}
\def\@eissn{0000-0000}
\def\@journal{Unknown Journal}
\def\sup@journal{Supplementary Material}
\def\journal@url{https://www.econometricsociety.org/}
\def\copyright@owner{The Econometric Society}
\def\@jid{UJ}
\def\@shortjid{uj}
%
% Math options
\DeclareOption{nodisplaystyleaddons}{\global\@displaystyle@addonsfalse}
%
\ExecuteOptions{twoside,nameyear,amsmath,url,bookmarks,outlines,urllinks,pdflinks,breaklinks}
\ProcessOptions
%
\if@onlineonly
    \ifecta@layout
        \def\sup@journal@url{https://www.econometricsociety.org/} 
    \else
        \AtBeginDocument{\econsocart@error{onlineonly is not prepared for \@jid}}
    \fi
\fi
%
\if@displaystyle@addons
    \appto\econsocart@xml@info{\edef\ds@on@off{1}}
\else
    \appto\econsocart@xml@info{\edef\ds@on@off{0}}
\fi
%
\csuse{econsocart@fileinfo}
%
\let\debug@wlog\@gobble
\if@econsocart@debug
    \let\debug@wlog\wlog
\fi
%
% FONTS
\def\@xpt{10.08}
\def\@ixpt{9.2}
\def\@viiipt{8.28}
\def\@xipt{11}
\def\@xivpt{14}
\def\@xvipt{16}
\def\@xviiipt{18}
\def\@xxpt{20}
\def\@xxivpt{24}
%
\ifecta@layout
    \def\@xpt{10.5}
    \def\@ixpt{9.5}
    \def\@viiipt{8.5}
\fi
%
\renewcommand\normalsize{%
    \@setfontsize\normalsize\@xpt{13.5\p@ \@plus .5\p@ \@minus .5\p@}%
    \abovedisplayskip=10\p@ \@plus 2\p@ \@minus 2\p@
    \abovedisplayshortskip=6\p@ \@plus 2\p@
    \belowdisplayshortskip=6\p@ \@plus 2\p@
    \belowdisplayskip=\abovedisplayskip
    }
%
\newcommand\small{%
    \@setfontsize\small\@ixpt{12.45\p@ \@plus .3\p@ \@minus .3\p@}%
    \abovedisplayskip=7.5\p@ \@plus 4\p@ \@minus 1\p@
    \belowdisplayskip=\abovedisplayskip
    \abovedisplayshortskip=\abovedisplayskip
    \belowdisplayshortskip=\abovedisplayskip
    }
%
\newcommand\footnotesize{%
    \@setfontsize\footnotesize\@viiipt{11\p@ \@plus .2\p@ \@minus .2\p@}%
    \abovedisplayskip=6\p@ \@plus 4\p@ \@minus 1\p@
    \belowdisplayskip=\abovedisplayskip
    \abovedisplayshortskip=\abovedisplayskip
    \belowdisplayshortskip=\abovedisplayskip
    }
%
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{16}}
\newcommand\LARGE{\@setfontsize\LARGE\@xvipt{18}}
\newcommand\huge{\@setfontsize\huge\@xviiipt{20}}
\newcommand\Huge{\@setfontsize\Huge\@xxpt{24}}
%
\ifecta@layout
    \renewcommand\normalsize{%
        \@setfontsize\normalsize\@xpt{12\p@ \@plus .3\p@ \@minus .3\p@}%
        \abovedisplayskip=10\p@ \@plus 2\p@ \@minus 2\p@
        \abovedisplayshortskip=6\p@ \@plus 2\p@
        \belowdisplayshortskip=6\p@ \@plus 2\p@
        \belowdisplayskip=\abovedisplayskip
        }
    \renewcommand\small{%
        \@setfontsize\small\@ixpt{11\p@ \@plus .2\p@ \@minus .2\p@}%
        \abovedisplayskip=7.5\p@ \@plus 4\p@ \@minus 1\p@
        \belowdisplayskip=\abovedisplayskip
        \abovedisplayshortskip=\abovedisplayskip
        \belowdisplayshortskip=\abovedisplayskip
        }
    \renewcommand\footnotesize{%
        \@setfontsize\footnotesize\@viiipt{10\p@ \@plus .1\p@ \@minus .1\p@}%
        \abovedisplayskip=6\p@ \@plus 4\p@ \@minus 1\p@
        \belowdisplayskip=\abovedisplayskip
        \abovedisplayshortskip=\abovedisplayskip
        \belowdisplayshortskip=\abovedisplayskip
        }
\fi
%
% Customization of fonts
\renewcommand\sldefault{it}
\renewcommand\bfdefault{b}
\let\slshape\itshape
%
% Compatibility with old latex:
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\let\sl\it
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
%
% DIMENSIONS
\setlength\parindent{16.89\p@}
\ifecta@layout
    \setlength\parindent{10\p@}
\fi
\def\sv@parindent{10\p@}
\setlength\textwidth{33pc}
\setlength\textheight{49pc}
\if@econsocart@draft
    \textwidth=6in% letter paper width minus 2.5in margins
    \textheight=8.5in% letter paper height minus 2.5in margins
\fi
\setlength\columnsep{1pc}
\setlength\columnwidth{14pc}
\setlength\columnseprule{0\p@}
%
% HEADS:
\setlength\headheight{12\p@}
\setlength\headsep{14\p@}
\setlength\topskip{10\p@}
\setlength\footskip{22\p@}
\setlength\maxdepth{.5\topskip}
\if@econsocart@draft
    \advance\textheight by -\headsep
    \advance\textheight by -\headheight
    \def\headheight@text@gap{-3.864\p@}% gap between head height and text
    \advance\textheight by -\headheight@text@gap
\fi
% 
% PAPER AND TRIM SIZE
\def\paper@width{8.5in}
\def\paper@height{11in}
\def\trim@width{6.75in}
\def\trim@height{9.75in}
\def\view@width{6in}
\def\view@height{9.1in}
%
\csuse{econsocart@def@proof@papersize}
%
% CENTER ON PAGE
\@tempdima=\paper@width 
\advance\@tempdima by -\trim@width
\divide\@tempdima by 2
\advance\@tempdima by -1in
\hoffset=\@tempdima
%
\@tempdima=\paper@height
\advance\@tempdima by -\trim@height
\divide\@tempdima by 2
\advance\@tempdima by -1in
\voffset=\@tempdima
%
\csuse{econsocart@def@crc@papersize}
%
\csuse{econsocart@def@view@and@wwwprint@papersize}
%
% SIDE MARGINS
\setlength\oddsidemargin{0.75in}% gutter margin
% 
\@tempdima=\trim@width
\advance\@tempdima by-\oddsidemargin
\advance\@tempdima by-\textwidth
\setlength\evensidemargin{\@tempdima}% outer
\setlength\topmargin{.5in}% 0.75
\advance\topmargin by -1\p@
% 
\if@wwwprintable
    \addtolength\oddsidemargin{\evensidemargin}
    \divide\oddsidemargin by 2
    \setlength\evensidemargin{\oddsidemargin}
\fi
%
\if@wwwviewable
    \addtolength\oddsidemargin{\evensidemargin}
    \divide\oddsidemargin by 2
    \setlength\evensidemargin{\oddsidemargin}
    \@tempdima=\trim@width
    \advance\@tempdima by -\view@width
    \divide\@tempdima by 2
    \advance\oddsidemargin by -\@tempdima
    \evensidemargin=\oddsidemargin
    \@tempdima=\trim@height
    \advance\@tempdima by -\view@height
    \divide\@tempdima by 2
    \advance\topmargin by -\@tempdima
\fi
%
\setlength\marginparsep{7\p@}
\setlength\marginparpush{5\p@}
%
% TEXT PARAMETERS
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}
%
% BREAKS
\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{12\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\bigskipamount{18\p@ \@plus 3\p@ \@minus 3\p@}
%
% PAGE-BREAKING PENALTIES
\ifqe@layout
\else
    \brokenpenalty=10000
    \finalhyphendemerits=10000
\fi
\ifecta@layout
    \brokenpenalty=100
    \finalhyphendemerits=5000
\fi
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=50
\predisplaypenalty=10000
\pretolerance=100
\tolerance=800
\hbadness=800
\emergencystretch=3\p@
\hfuzz=1\p@
% 
% FOOTNOTES
\setlength\footnotesep{7\p@}
\setlength{\skip\footins}{11\p@ \@plus 2\p@ \@minus 1\p@}
\ifecta@layout
    \setlength{\skip\footins}{18\p@ \@plus 4\p@ \@minus 2\p@}
\fi
\skip\@mpfootins = \skip\footins
%
% FRAMED BOXES
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
%
% LOADING PACKAGES:
\csuse{econsocart@pagecrop}
%
\csuse{econsocart@graphicx}
%
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\ifecta@layout
    \renewcommand{\rmdefault}{btm}
    \def\econsocart@putx{btm}
\else
    \renewcommand{\rmdefault}{put}
    \def\econsocart@putx{putx}
\fi
%
\csuse{econsocart@helvet}
%
\RequirePackage{textcomp}
\normalfont\normalsize
%
\csuse{econsocart@mathdutc}
\RequirePackage{amssymb}
\newcommand\hmmax{0}
\newcommand\bmmax{1}
\RequirePackage{bm}
%
\DeclareMathSizes{10.5}{10.5}{6.5}{5.5}
\DeclareMathSizes{9.5}{9.5}{6}{5}
\DeclareMathSizes{8.5}{8.5}{5.5}{4.5}
%
% FRONT MATTER MACROS
\csuse{econsocart@frontmatter@macros}
\def\volume@label{Vol.}
%
\def\email@text{}
\def\url@text{}
\def\fullurl@text{}
%
\ifecta@layout
\else
    \font\myfont=cmtt10 at 9.39\p@
    \def\ead@size{\myfont}
\fi
%
% Thanks
\def\thanks[#1]#2{\thankstext{#1}{#2}}
%
\DeclareRobustCommand\blackwell@fagency[2][]{#2}
\DeclareRobustCommand\blackwell@fnumber[2][]{#2}
\long\def\@thankstext[#1]#2#3{%
    \@thankslabel[#1]{#2}%
    \bgroup
        \let\gsponsor\blackwell@fagency
        \let\gnumber\blackwell@fnumber
        \protected@xdef\@thanks{%
            \@thanks\protect\thanks@thefnmark{#2thanks}%
            \protect\@footnotetext{\thanks@hypertarget{#2}#3}%
            }%
    \egroup
    }
\def\support@thefnmark#1{%
    \begingroup
        \unrestored@protected@xdef\@thefnmark{#1}%
    \endgroup
    }%
% Macros for processing environments
\let\start@tex@env\relax
\let\end@tex@env\relax
%
\long\def\add@env@toks#1#2#3\end#4{%
    %% #1 - initial environment; #2 - token list; #3 - content's stream; #4 - current environment end
    \def\check@param@a{#1}%
    \def\check@param@b{#4}%
    \ifx\check@param@a\check@param@b
        %% initial environment end
        \def\@next@{%
            \let\end@tex@env\relax
            \global#2\expandafter{\the#2#3\end@tex@env}%
            \endgroup
            %% run hook at initial environment end
            \csname end@add@env@#1@hook\endcsname
            }%
    \else
        %% not initial environment end 
        \def\@next@{%
            \global#2\expandafter{\the#2#3\end{#4}}%
            \add@env@toks{#1}{#2}%
            }%
    \fi
    \@next@
    }
\def\read@opt@args#1#2[#3]{%
    \let\start@tex@env\relax
    \global#2\expandafter{\the#2\start@tex@env{#1}[#3]}%
    \add@env@toks{#1}{#2}%
    }
\def\check@opt@args#1#2{%
    \@ifnextchar[%
        {\read@opt@args{#1}{#2}}%
        {%
         \let\start@tex@env\relax
         \global#2\expandafter{\the#2\start@tex@env{#1}[]}%
         \add@env@toks{#1}{#2}%
        }%
    }
\def\get@env@toks#1#2{%
    %% #1 - environment; #2 - token list
    \expandafter\expandafter\expandafter\let\expandafter\expandafter\csname get@env@saved@env@#1\endcsname\csname #1\endcsname
    \expandafter\expandafter\expandafter\let\expandafter\expandafter\csname get@env@saved@env@end#1\endcsname\csname end#1\endcsname
    \expandafter\gdef\csname #1\endcsname{\check@opt@args{#1}{#2}}%
    }
\newtoks\document@funding
\get@env@toks{funding}{\document@funding}
\let\gsponsor\blackwell@fagency
\let\gnumber\blackwell@fnumber
\def\funding@@fmt{%
    \bgroup
        \long\def\start@tex@env##1[##2]##3\end@tex@env{%
            \protected@xdef\@thanks{%
                \@thanks\protect\support@thefnmark{}%
                \protect\@footnotetext{\csuse{support@footnotetext@prehook}##3}%
                }%
            }%
        \the\document@funding
    \egroup
    }
%
% url package
\RequirePackage{url}
\urlstyle{same}
%
% LISTS
\csuse{econsocart@list@macros}
%
\ifecta@layout
    \def\enumerate@indent{\list@parindent}
    \def\enumerate@firsttopsep{\z@}
    \def\itemize@firsttopsep{\z@}
    \def\list@parindent{10\p@}
    \def\longlist@topsep{\z@}
    \renewcommand\labellonglist{(\thelonglist)}
    \def\labelenumii{(\theenumii)}
    \def\itemize@indent{\list@parindent}
\else
    \def\enumerate@indent{\list@parindent}
    \def\enumerate@firsttopsep{.55\baselineskip}
    \def\enumerate@topsep{.55\baselineskip}%
    \def\enumerate@hook{\itemsep=.55\baselineskip}%
    \def\itemize@firsttopsep{.55\baselineskip}%
    \def\itemize@hook{\itemsep=.55\baselineskip}%
    \def\itemize@indent{\parindent}
    \def\list@parindent{10\p@}
    \def\longlist@firsttopsep{.55\baselineskip}
    \def\longlist@topsep{.55\baselineskip}%
    \def\longlist@hook{\itemsep=.275\baselineskip}%
    \renewcommand\labellonglist{(\thelonglist)}
    \def\labelenumii{(\theenumii)}
    \def\itemize@indent{\list@parindent}
\fi
%
% quotation
\def\quotation@leftmargin{1pc}
\def\quotation@rightmargin{1pc}
\ifecta@layout
\else
    \let\quotation@size\small
\fi
%
% quote
\def\quote@leftmargin{1pc}
\def\quote@rightmargin{1pc}
\ifecta@layout
\else
    \let\quote@size\small
\fi
%
% SECTIONS
\csuse{econsocart@vtexsec}
%
% MATH
\csuse{econsocart@vtexmth}
\if@load@amsmath
    \csuse{econsocart@amsmath}
    \def\tmp@ecta@or@qe{0}
    \ifecta@layout\edef\tmp@ecta@or@qe{1}\fi
    \ifqe@layout\edef\tmp@ecta@or@qe{1}\fi
    \ifnum\tmp@ecta@or@qe>\z@
        % gathered is left aligned
        \renewenvironment{gathered}[1][c]{\relax
            \ifmmode
            \else
                \nonmatherr@{\begin{gathered}}%
            \fi
            \null\,%
            \if #1t%
                \vtop 
            \else 
                \if#1b%
                    \vbox 
                \else 
                    \vcenter 
                \fi
            \fi 
            \bgroup
                \Let@ \chardef\dspbrk@context\@ne \restore@math@cr
                \spread@equation
                \ialign\bgroup
                    \if@fleqn
                    \else
                        \expandafter\hfil
                    \fi
                    \strut@$\m@th\displaystyle##$\hfil
                    \crcr
        }{%
            \endaligned
        }
    \fi
    \setlength\arraycolsep{1.2\p@}
    \setlength\tabcolsep{6\p@}
    \setlength\arrayrulewidth{0.4\p@}
    \setlength\doublerulesep{0.4\p@}
    \ifecta@layout
    \else
        \setlength\tabbingsep{0.5em}
    \fi
    \if@displaystyle@addons
        \protected\def\frac#1#2{{%
            \mathchoice
                {\displaystyle\begingroup #1\endgroup \@@over\displaystyle #2}%
                {\begingroup #1\endgroup \@@over #2}%
                {\begingroup #1\endgroup \@@over #2}%
                {\begingroup #1\endgroup \@@over #2}%
            }}
    \fi
    \@displaystyle@addonsfalse
    % show formulas with no refs in margin
    \let\@setmarginlbl\relax
    \let\temp@tagform@\tagform@
    \let\orig@mmeasure@\mmeasure@
    \def\mmeasure@#1{%
        \let\curr@tagform@\tagform@
        \let\tagform@\temp@tagform@
        \orig@mmeasure@{#1}%
        \let\tagform@\curr@tagform@
        }
    \apptocmd\tagform@{\@setmarginlbl}{}{}
    \def\label@in@display#1{%
        \global\@labelledtrue
        \@ifundefined{lab@#1}%
            {\global\@unsdlbltrue}%
            {\global\@unsdlblfalse}%
        \ifx\df@label\@empty
        \else
            \econsocart@error{amsmath error: multiple \string\label's: 
                label '\df@label' will be lost}%
        \fi
        \gdef\df@label{#1}%
        }
    \ifcsundef{aligncolsep}%
        {}%
        {\aligncolsep{1em}}
    \def\cases@column@sep{\quad}
    \ifecta@layout
    \else
        \mathindent=42\p@
    \fi
\else
    \ifecta@layout
        \def\@eqnnum{%
            \hb@xt@.01\p@{}%
            \rlap{%
                \normalfont\normalcolor
                \hskip-\displayindent
                \hskip -\displaywidth(\theequation)%
                }%
            }
    \else
        \def\@eqnnum{{\normalfont\upshape \normalcolor (\theequation)}}
    \fi
\fi
%
% dummy hack to add text to number (todo: is it needed?)
\def\eqntext#1{\global\let\curr@eqnnum\@eqnnum
    \gdef\@eqnnum##1##2{$#1$\global\let\@eqnnum\curr@eqnnum}}
% 
\if@seceqn
    \@addtoreset{equation}{section}
    \renewcommand\theequation{\thesection.\@arabic\c@equation}
\fi
% 
\csuse{econsocart@scshape}
\csuse{econsocart@zishape}
% THEOREMS
\csuse{econsocart@thm@macros}
\renewcommand{\theoremstyle}[1]{%
    \@ifundefined{th@#1}%
        {%
            \PackageError{amsthm}{Unknown theoremstyle `#1'}%
            \thm@style{plain}%
        }%
        {%
            \thm@style{#1}%
        }%
    }
\let\th@remark\undefined
\def\thm@space@after{.5em}
\def\econsocart@thm@indent{\z@}
\ifecta@layout
    \def\econsocart@thm@indent{\parindent}
    \def\thmnote@pre{\bgroup\normalfont\unskip\kern.07em---\kern.07em}
    \def\thmnote@post{\egroup}
    \def\thmnumber@pre{\bgroup\normalfont}
    \def\thmnumber@post{\egroup}
    \def\thmnumber@space{\space\kern0.02em}
\else
    \def\thmnote@pre{\bgroup\normalfont(}
    \def\thmnote@post{)\egroup}
    \def\thmnumber@pre{}
    \def\thmnumber@post{}
    \def\thmnumber@space{ }
\fi
\newtheoremstyle{plain}%
    {\medskipamount}%
    {\medskipamount}%
    {%
        \normalfont
        \ifqe@layout
            \enable@zishape
        \else
            \ifecta@layout
                \zishape
                \let\econsocart@setref@textup\textup
            \else
                \itshape
            \fi
        \fi
        \csuse{corthmlist@addons}%
    }%
    {\econsocart@thm@indent}%
    {\scshape}%
    {\ifecta@layout:\else.\fi\csuse{corthmlist@head@pos}}%
    {\thm@space@after}%
    {%
        \thmname{#1}%
        \thmnumber{\thmnumber@pre\@ifnotempty{#1}{\thmnumber@space}\@upn{#2}\thmnumber@post}%
        \thmnote{ \thmnote@pre #3\thmnote@post}%
    }%
\newtheoremstyle{definition}%
    {\medskipamount}%
    {\medskipamount}%
    {\upshape \csuse{corthmlist@addons}}%
    {\econsocart@thm@indent}%
    {\scshape}%
    {\ifecta@layout:\else.\fi\csuse{corthmlist@head@pos}}%
    {\thm@space@after}%
    {%
        \thmname{#1}%
        \thmnumber{\thmnumber@pre\@ifnotempty{#1}{\thmnumber@space}\@upn{#2}\thmnumber@post}%
        \thmnote{ \thmnote@pre #3\thmnote@post}%
    }%
\ifte@layout
    \def\econsocart@currenvir@example{example}
    \def\thm@end@example@symbol{\lozenge}
    \gpreto\@endtheorem{%
        \ifx\@currenvir\econsocart@currenvir@example
            \def\qedsymbol{\ensuremath{\lozenge}}\qed
        \fi
        }
\fi
\def\mathend@qed{\hbox to\hsize{\hfill\qedsymbol}}
\ifecta@layout
    \def\qedsymbol{\textit{Q.E.D.}}
    \DeclareRobustCommand{\qed}{%
        \ifmmode \mathqed
        \else
            \leavevmode\unskip\penalty9999 \hbox{ }\nobreak\hfill
            \hbox{\qedsymbol}%
        \fi
        }
\fi
\renewenvironment{proof}[1][\proofname]%
    {%
        \par
        \ifte@layout
            \ifstrequal{#1}{tr}%
                {%
                    \def\qedsymbol{\ensuremath{\vartriangleleft}}%
                }%
                {}%
        \fi
        \pushQED{\qed}%
        \normalfont
        \topsep=\medskipamount
        \trivlist
            \item[\hskip\labelsep
                \ifte@layout
                    \ifstrequal{#1}{tr}%
                        {\scshape{\proofname}}%
                        {\scshape{#1}}%
                \else
                    \ifecta@layout
                        \hskip\parindent
                    \fi
                    \scshape{#1}%
                \fi
            \ifecta@layout\@addpunct{:}\else\@addpunct{.}\fi]\ignorespaces
    }%
    {%
        \popQED
        \endtrivlist
        \@endpefalse
    }
%
% BIBLIOGRAPHY
\csuse{econsocart@bibliography}
%
\marginparwidth=120\p@
\marginparsep=25\p@
% 
% FLOATS
\csuse{econsocart@floats}
% 
% figure
\def\figurename{Figure}
\def\longfigurecaption@style{}
\ifecta@layout
    \def\figurename@size{\scshape\hskip10\p@}
    \def\figurename@skip{---}
    \def\figurecaption@fmt#1{\hbox to\hsize{\hfill\hskip-10\p@ #1\hfill}}
\else
    \def\figurename@size{\scshape}
    \def\figurename@skip{\enspace}
    \def\figurecaption@size{\small}
    \def\figurecaption@fmt#1{\hbox to\hsize{\hfill#1\hfill}}
\fi
%
\long\def\@makefigurecaption#1#2{%
    \vskip\figurecaption@skip
    \figurecaption@size
    \setbox\@tempboxa\hbox{#2}%
    \ifdim\wd\@tempboxa<\p@
        \def\figurename@skip{}%
    \fi
    \setbox\@tempboxa\hbox{%
        {\figurename@size #1}\figurename@skip
        \if@contcaption
            \contcaptionbraces@left\contcaption@shape{#2}\contcaptionbraces@right
        \else
            #2%
        \fi
        }%
    \ifdim \wd\@tempboxa >\hsize
        \longfigurecaption@style
        \unhbox\@tempboxa\par
    \else
        \figurecaption@fmt{\box\@tempboxa}\par
    \fi
    }
%
% table
\ifecta@layout
    \def\thetable{\@Roman\c@table}
    \def\fnum@table{\tablename~\thetable}
    \def\tablename{TABLE}
    \def\starttable@hook{\let\hline\thline}
    \def\tablename@skip{\endgraf\vskip3\p@}
    \def\tablecaption@size{\centering\footnotesize\scshape}
\else
    \def\tablename{Table}
    \def\starttable@hook{\let\hline\thline}
    \def\tablename@skip{\enspace}
    \def\tablename@size{\scshape}
    \def\tablecaption@size{\small}
    \def\tablecaption@shape{}%
    \def\tablecaption@fmt#1{\hbox to\hsize{\hfill#1\hfill}}
    \def\longfigurecaption@style{}
\fi
%
\ifqe@layout
    \def\tablecaption@shape{\centering}
    \long\def\@maketablecaption#1#2{%
        \tablecaption@shape
        \setbox\@tempboxa\hbox{%
            \tablecaption@size{\tablename@size #1}\tablename@skip
            \if@contcaption
                \contcaptionbraces@left\contcaption@shape{#2}\contcaptionbraces@right
            \else
                #2%
            \fi
            }%
        \ifdim\wd\@tempboxa<\tablewidth
            \hbox to \hsize{\hfill\box\@tempboxa\hfill}\par
        \else
            \parbox[t]{\tablewidth}{%
                \tablecaption@size{\tablename@size #1}\tablename@skip
                \if@contcaption
                    \contcaptionbraces@left\contcaption@shape{#2}\contcaptionbraces@right
                \else
                    #2%
                \fi\par
                }%
        \fi
        \vskip\tablecaption@skip
        }
\else
    \ifecta@layout
    \else
        \def\tablecaption@shape{\centering}
        \long\def\@maketablecaption#1#2{%
            \vskip\tablecaption@skip
            \tablecaption@shape
            \setbox\@tempboxa\hbox{#2}%
            \ifdim\wd\@tempboxa<\p@
                \def\tablename@skip{}%
            \fi
            \setbox\@tempboxa\hbox{%
                \tablecaption@size{\tablename@size #1}\tablename@skip
                \if@contcaption
                    \contcaptionbraces@left\contcaption@shape{#2}\contcaptionbraces@right
                \else
                    #2%
                \fi
                }%
            \ifdim\wd\@tempboxa>\tablewidth
                \parbox[t]{\tablewidth}{%
                    \tablecaption@size{\tablename@size #1}\tablename@skip
                    \if@contcaption
                        \contcaptionbraces@left\contcaption@shape{#2}\contcaptionbraces@right
                    \else
                        #2%
                    \fi\par
                    }%
            \else
                \tablecaption@fmt{\box\@tempboxa}\par
            \fi
            }
    \fi
\fi
% 
\def\dblhline{\noalign{\vskip3\p@}\oldhline\noalign{\vskip1\p@}\oldhline\noalign{\vskip3\p@}}
% 
\def\thetabnote{\@alph\c@tabnote}
\def\tabnote@size{\scriptsize}
\def\firsttabnote@skip{\relax}
\def\legend@tabnotemark@fmt#1{\textit{#1}:\hskip5\p@}
\ifecta@layout
    \def\tabnote@indent{\parindent=10\p@}% was \hskip10\p@
\else
    \def\tabnote@indent{\hskip10\p@}
    \gappto\vtexfltpdf@hypermark{\def\tabnotemark@fmt#1{\textsuperscript{#1}}}
\fi
\def\notabnotemark{%
    \global\let\sv@tabnotemark@fmt\tabnotemark@fmt
    \gdef\tabnotemark@fmt##1{%
        \ifecta@layout
            \legend@tabnotemark@fmt{Note}%
        \else
            \legend@tabnotemark@fmt{Note}%
        \fi
        \global\let\tabnotemark@fmt\sv@tabnotemark@fmt
        }%
    }
%
\def\startscript{%
    \noalign{\gdef\tabular@cell@hook{\if@tabcell@hook\scriptsize\fi}\global\@tabcell@hooktrue}%
    }
\def\endscript{\noalign{\global\let\tabular@cell@hook\relax\global\@tabcell@hookfalse}}
\def\thead{\dblhline\startscript}
\def\endthead{\endscript\hline}
%
\long\def\note#1{{\nomark@tabnotetext{\textit{Note}:\hskip5\p@ #1}}}
%
\let\note\undefined
%
\newcounter{econsocart@legend@count}
\def\legend#1{%
    \stepcounter{econsocart@legend@count}%
    \tabnotetext[]{econsocartlegend\the\c@econsocart@legend@count}{#1}%
    }
%
\long\def\nomark@tabnotetext#1{%
    \tabnote@skip
    \parbox[t]{\tablewidth}{\tabnote@size\tabnote@indent\strut#1\par}%
    \vtop to\z@{ }\par
    }
%
\let\econsocart@save@tabnotetext\@tabnotetext
\long\def\@tabnotetext[#1]#2#3{%
    \endgraf
    \econsocart@save@tabnotetext[#1]{#2}{#3}%
    }
%
\AtBeginDocument{% todo: check if these hooks are needed
    \let\tabular@cell@hook\relax
    \def\@addtopreamble#1{\xdef\@preamble{\@preamble #1\tabular@cell@hook}}%
    \long\def\multicolumn#1#2#3{%
        \multispan{#1}%
        \begingroup
            \def\@addamp{\if@firstamp \@firstampfalse \else\@preamerr 5\fi}%
            \let\saved@tabular@cell@hook\tabular@cell@hook
            \let\tabular@cell@hook\relax
            \@mkpream{#2}%
            \@addtopreamble\@empty
            \let\tabular@cell@hook\saved@tabular@cell@hook
        \endgroup
        \def\@sharp{#3}%
        \@arstrut\@preamble\null
        \ignorespaces
        }%
    }
%
% Last page control
\csuse{econsocart@checklastpage}
% 
% HEADINGS
\ifecta@layout
    \def\ps@headings{%
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
        \def\@evenhead{%
            \runninghead@size
            \rlap{\pagenumber@size\thepage@prefix\thepage}\hfill
            \leftmark\hfill
            }%
        \def\@oddhead{%
            \runninghead@size\hfill
            \limited@wd@runtitle{%
                \pagenumber@size\thepage@prefix\sprintf@four@nines{\thepage}%
                \hskip.5em\runninghead@size\rightmark\pagenumber@size
                \hskip.5em\thepage@prefix\sprintf@four@nines{\thepage}%
                }%
                {\the\textwidth}%
                {\thepage}%
                {\rightmark}%
            \hfill\llap{\pagenumber@size\thepage@prefix\thepage}%
            }%
        }%
\else
    \def\ps@headings{%
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
        \def\@evenhead{\runninghead@size{\pagenumber@size\thepage}\enskip\enskip\leftmark}%
        \def\@oddhead{%
            \runninghead@size
            \limited@wd@runtitle{%
                \runninghead@size
                \if@supplement@onlineonly
                    \@runjournal
                \else
                    \@journal\ \sprintf@with@nines{2}{\@volume}\ (\the\@pubyear)%
                \fi
                \enskip\enskip\@runtitle
                \enskip\enskip\pagenumber@size\sprintf@four@nines{\thepage}%
                }%
                {\the\hsize}%
                {\thepage}%
                {\rightmark}%
            \enskip\enskip{\pagenumber@size\thepage}%
            }%
        }%
\fi
\def\ps@empty{%
    \let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
    \let\@oddfoot\@empty
    \let\@evenhead\@oddhead
    \let\@evenfoot\@oddfoot
    }
\def\ps@plain{%
    \let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
    \let\@oddfoot\@empty
    \let\@evenhead\@oddhead
    \def\@oddfoot{%
        \hfill\pagenumber@plainsize\thepage\hfill
        }%
    \let\@evenfoot\@oddfoot
    }
% First page RH
\ifecta@layout
    \def\ps@copyright{%
        \let\@mkboth\@gobbletwo
        \def\@evenhead{\hfill\copyright@size\copyright@text\hfill}%
        \let\@oddhead\@evenhead
        \def\@oddfoot{\copyright@size\copyrightline@text}%
        \let\@evenfoot\@oddfoot
        }
\else
    \def\ps@copyright{%
        \let\@mkboth\@gobbletwo
        \def\@evenhead{\copyright@size\copyright@text}%
        \let\@oddhead\@evenhead
        \def\@oddfoot{%
            \parbox[b][\z@][b]{\hsize}{%
                \vskip\copyrightline@skip
                \copyright@size\copyrightline@text\hfill
                \ifqe@layout
                    \vadjust{\vskip7.3\p@}%
                \else
                    \vadjust{\vskip5.8\p@}%
                \fi
                }%
            }%
        \let\@evenfoot\@oddfoot
        }%
\fi
%
% FOOTNOTE
\newcommand\@makefntext[1]{%
    \parindent=10\p@
    \@makefnmark #1%
    }
\ifecta@layout
    \def\@makefnmark{\@textsuperscript{\normalfont\@thefnmark}}%
\else
    \def\@makefnmark{\@textsuperscript{\normalfont\upshape\@thefnmark}}%
\fi
%
% hook for hypermark
\gdef\@makefntext@fmt#1{%
    \parindent=10\p@
    \hskip10\p@
    \let\quote@size\footnotesize
    \let\quotation@size\footnotesize
    \@makefnmark
    }
\DeclareRobustCommand\freefootnotetext[2][]{%
    \begingroup
        \unrestored@protected@xdef\@thefnmark{#1}%
    \endgroup
    \@footnotetext{#2}%
    }
\def\footnoterule{%
    \kern-3\p@
    \hrule\@width 4pc%
    \kern2.6\p@
    }
%
% Sectioning commands
\def\section@size{\fontfamily{\econsocart@putx}\fontseries{m}\fontshape{sc}\selectfont}
\def\section@cnt@size{\normalsize\upshape}
\ifecta@layout
    \def\section@size{\footnotesize\baselineskip12\p@\fontshape{uc}\selectfont}
\fi
% 
% last line is centered by page not by a text the first line
\def\fl@hangfrom#1{\noindent {#1}}
\def\TO@fl{\let\@hangfrom\fl@hangfrom}
%
\newcommand\section{%
    \@startsection
        {section}%
        {1}%
        {\z@}%
        {\bigskipamount}%
        {\smallskipamount}%
        {\global\@afterindentfalse\centering\TO@fl\section@size}%
    }
\newcommand\subsection{%
    \@startsection
        {subsection}%
        {2}%
        {\z@}%
        {\bigskipamount}%
        {\smallskipamount}%
        {\global\@afterindentfalse\itshape\centering\TO@fl}%
    }
\newcommand\subsubsection{%
    \@startsection
        {subsubsection}%
        {3}%
        {\z@}%
        {1.55ex\@plus.5ex\@minus.2ex}%
        {-1em}%
        {\normalfont\normalsize\itshape}%
    }
\newcommand\paragraph{%
    \@startsection
        {paragraph}%
        {4}%
        {\z@}%
        {1.55ex\@plus.5ex\@minus.2ex}%
        {-1em}%
        {\normalfont\normalsize\itshape}%
    }
\newcommand\subparagraph{%
    \@startsection
        {subparagraph}%
        {5}%
        {\parindent}%
        {1.55ex\@plus.5ex\@minus.2ex}%
        {-1em}%
        {\normalfont\normalsize\itshape}%
    }
\ifecta@layout
    \renewcommand\section{%
        \@startsection
            {section}%
            {1}%
            {\z@}%
            {\bigskipamount}%
            {\smallskipamount}%
            {\centering\TO@fl\section@size}%
        }
    \renewcommand\subsection{%
        \@startsection
            {subsection}%
            {2}%
            {\z@}%
            {\bigskipamount}%
            {\smallskipamount}%
            {\itshape\centering\TO@fl}%
        }
    \renewcommand\subsubsection{%
        \@startsection
            {subsubsection}%
            {3}%
            {\z@}%
            {\medskipamount}%
            {\smallskipamount}%
            {\itshape\raggedright}%
        }
    \renewcommand\paragraph{%
        \@startsection
            {paragraph}%
            {4}%
            {\parindent}%
            {\medskipamount}%
            {-10\p@}%
            {\itshape}%
        }
    \renewcommand\subparagraph{%
        \@startsection
            {subparagraph}%
            {5}%
            {\parindent}%
            {0.1\p@}%
            {-1em}%
            {\itshape}%
        }
\fi
%
\def\section@numbersep{.}
\def\subsection@numbersep{}
\def\subsubsection@numbersep{}
\def\paragraph@numbersep{}
\def\subparagraph@numbersep{}
%
\ifecta@layout
    \def\subsection@numbersep{.}
    \def\subsubsection@numbersep{.}
    \def\paragraph@numbersep{.}
    \def\subparagraph@numbersep{.}
\fi
%
\def\@seccntformat#1{{%
    \section@cnt@size\csname #1@prefix\endcsname
    \csname the#1\endcsname\csname#1@numbersep\endcsname\enspace
    }}
%
% an article begins with uppercase letters
\def\caps#1{\noindent\textsc{#1}}
%
% Acknowledgements
\def\acknowledgements@error{%
    \econsocart@error{\string\acks\space must be encoded as environment (for XML)}%
    }
\let\acknowledgements@closed\relax
\def\acknowledgements{%
    \global\let\acknowledgements@closed\acknowledgements@error
    \section*{\acknowledgementsname}%
    }
\def\endacknowledgements{%
    \global\let\acknowledgements@closed\relax
    }
\let\acks\acknowledgements
\let\endacks\endacknowledgements
\AtEndDocument{\acknowledgements@closed}
%
% appendix
\def\app@addcontentsline#1#2#3{%
    \ifcsundef{app*star*section}%
        {}%
        {%
            \ifecta@layout
            \else
                \if@allsections\else\write@toc@ignorecontentsline\fi
            \fi
        }%
    \ifstrequal{#1+#2}{toc+section}{\write@toc@ignorenumberline}{}%
    \app@orig@addcontentsline{#1}{#2}{#3}%
    \ifstrequal{#1+#2}{toc+section}{\write@toc@restorenumberline}{}%
    \ifcsundef{app*star*section}%
        {}%
        {%
            \ifecta@layout
            \else
                \if@allsections\else\write@toc@restorecontentsline\fi
            \fi
        }%
    }
%
\newcommand\appendix[1][]{\par
    \def\section@cnt@size{\scshape}%
    \def\section@size{\scshape}%
    \def\section@numbersep{:}%
    \let\old@section\section
    \let\old@subsection\subsection
    \let\old@subsubsection\subsubsection
    \ifecta@layout
        \def\section@prefix{\fontshape{uc}\selectfont\appendixname\ }%
        \def\appendixname@uc##1{{\fontshape{uc}\selectfont ##1}}%
        \def\@appendixname{\appendixname}%
        \def\@thesection{\thesection\section@numbersep}%
    \else
        \let\appendixname@uc\@firstofone
        \ifx.#1.\relax% todo: find out if appendix optional argument is used at all
            \def\@appendixname{\appendixname}%
            \def\@thesection{\thesection\section@numbersep}%
            \def\section@prefix{\fontshape{sc}\selectfont\@appendixname\ }%
        \else
            \def\section@numbersep{.}%
            \def\@appendixname{}%
            \def\@thesection{\thesection\section@numbersep}%
            \old@section*{#1}%
            \def\section@prefix{}%
        \fi
    \fi
    \global\let\app@orig@addcontentsline\addcontentsline
    \let\addcontentsline\app@addcontentsline
    \def\section{\@ifnextchar*{\@appsectionstar}{\@appsectionnostar}}%
    \def\subsection{\@ifnextchar*{\@appsubsectionstar}{\@appsubsectionnostar}}%
    \def\subsubsection{\@ifnextchar*{\@appsubsubsectionstar}{\@appsubsubsectionnostar}}%
    \setcounter{section}{0}%
    \def\thesection{\@Alph\c@section}%
    \if@seceqn
        \@addtoreset{equation}{section}%
        \def\theequation{\thesection.\arabic{equation}}%
    \fi
    \get@changed@counter@info@for@xml{section}{appendix}%
    \if@seceqn
        \get@changed@counter@info@for@xml{equation}{appendix}%
    \fi
    \csname econsocart@appendix@hook\endcsname
    }
%
\def\@appsectionstar*#1{%
    \csedef{app*star*section}{1}%
    \def\section@size{\scshape}%
    \ifx.#1.%
        \old@section*{\appendixname@uc{\appendixname}}%
    \else
        \def\section@numbersep{:}%
        \old@section*{\appendixname@uc{\appendixname}\section@numbersep\enspace #1}%
    \fi
    \ifecta@layout
        \def\section@size{\scshape}%
    \fi
    \stepcounter{section}%
    \csundef{app*star*section}%
    }
%
\def\@appsubsectionstar*#1{%
    \csedef{app*star*section}{2}%
    \old@subsection*{#1}%
    \csundef{app*star*section}%
    }
%
\def\@appsubsectionnostar{\old@subsection}
%
\def\@appsubsubsectionstar*#1{%
    \csedef{app*star*section}{3}%
    \old@subsubsection*{#1}%
    \csundef{app*star*section}%
    }
%
\def\@appsubsubsectionnostar{\old@subsubsection}
%
\def\@appsectionnostar#1{%
    \ifx.#1.%
        \def\section@numbersep{}%
        \old@section[\@appendixname\ \@thesection]{}%
    \else
        \def\section@numbersep{:}%
        \def\@argi{#1}%
        \old@section[\@appendixname\ \@thesection\ \@argi]{#1}%
    \fi
    }
%
% FRONTMATTER FORMATTING PARAMETERS
\def\frontmatter@style{\centering}
\def\address@style{\normaltext}
\def\affiliation@style{\normaltext}
\def\abstract@style{\normaltext}
\def\keyword@style{\normaltext}
%
% FRONT MATTER SKIPS
\def\title@skip{14\p@}
\def\authors@skip{12\p@}
\def\dedicated@skip{12\p@}
\def\affiliation@skip{4\p@}
\def\address@skip{4\p@ \@plus 2\p@}
\def\abstract@skip{10\p@}
\def\keyword@skip{6\p@}
\def\history@skip{14\p@ \@plus 2\p@ \@minus 2\p@}
\def\frontmatter@cmd{\vskip24\p@ \@plus 3\p@ \@minus 3\p@}
\def\abstractname@afterskip{}
\def\abstractname@style{}
\ifecta@layout
    \def\title@skip{-6\p@}
    \def\keyword@skip{10\p@}
    \def\history@skip{8\p@ \@plus 4\p@ \@minus 2\p@}
    \def\frontmatter@cmd{%
        \if@open@access
            \ifcsundef{econsocart@too@long@open@access@text}%
                {}%
                {%
                    \xdef\econsocart@too@long@open@access@corr{%
                        \the\dimexpr\econsocart@too@long@open@access@corr+20\p@\relax
                        }%
                    \econsocart@calc@oa@dim(\econsocart@too@long@open@access@text/%
                        \econsocart@too@long@open@access@spare)*20\p@\@nil
                    \vskip-\econsocart@temp@oa@skip
                }%
        \fi
        \vskip20\p@ \@plus 3\p@ \@minus 3\p@
        }
\fi
% 
% FRONT MATTER DIMENSIONS
\def\abstract@width{28pc}
\def\abstract@indent{0\p@\parindent=10\p@}
\def\keyword@width{28pc}
\def\keyword@indent{0\p@}
\ifecta@layout
    \def\abstract@width{26pc}
    \def\abstract@indent{10\p@}
    \def\keyword@width{26pc}
    \def\keyword@indent{10\p@}
\fi
%
% FRONT MATTER FONTS 
\def\dochead@size{\normalsize\fontshape{uc}\selectfont}
\def\title@size{%
    \fontsize{13.25}{16}\selectfont
    \bfseries\mathversion{bold}%
    }%
\ifecta@layout
    \def\title@size{\normalsize\fontshape{uc}\selectfont}
\fi
\def\author@size{%
    \normalsize
    \fontfamily{\econsocart@putx}\fontseries{m}\fontshape{sc}\selectfont
    }
\ifecta@layout
    \def\author@size{\normalsize}
\fi
\def\address@size{\normalsize\itshape}
\def\affiliation@size{\normalsize\itshape}
\def\dedicated@size{\normalsize\itshape}
\def\abstract@size{\small\upshape}
\def\keyword@size{\small\upshape}
\def\keywordname@size{\fontfamily{\econsocart@putx}\fontseries{m}\fontshape{sc}\selectfont}
\def\history@size{\small\noindent}
%
\def\runninghead@size{\small}
\def\pagenumber@size{\normalsize\upshape}
\def\pagenumber@plainsize{\footnotesize}
\def\copyright@size{\footnotesize}
\ifecta@layout
    \def\abstract@size{\footnotesize\upshape}
    \def\keyword@size{\footnotesize\upshape}
    \def\keywordname@size{\scshape}
    \def\history@size{\centering\footnotesize\itshape}
    \def\runninghead@size{\footnotesize\fontshape{uc}\selectfont}
\fi
% 
% TEXT, etc.
\def\@snumber{%
    \number\@pubyear
    \ifnum\@firstpage<10\relax 
        000\@firstpage
    \else
        \ifnum\@firstpage<100\relax 
            00\@firstpage
        \else 
            \ifnum\@firstpage<1000\relax 
                0\@firstpage
            \else
                \ifnum\@firstpage<10000\relax
                    \@firstpage
                \else 
                    ????\econsocart@error{number \@firstpage\space too large for \string\@snumber}%
                \fi
            \fi
        \fi
    \fi
    }
%
\if@supplement@onlineonly
    \if@supplement
        \AtBeginDocument{\mdforvkt{main-article-info}{articletype}{supplement}}
    \else
        \AtBeginDocument{\mdforvkt{main-article-info}{articletype}{onlineonly}}
    \fi
    \ifecta@layout
        \def\copyright@text{\hfill\url@fmt{}{\itshape}{\sup@journal}{\sup@journal@url}\hfill}
    \else
        \def\copyright@text{\sup@journal\hfill}
    \fi
\else
    \def\copyright@text{%
        \hfilneg
        \url@fmt{}{\upshape}{\@journal}{\journal@url/}\
        \if@report
        \else
            \@gobble{\volume@label\ }\@volume
        \fi
        \@gobble{\issue@label\ \@issue\ } (\the\@pubyear),
        \@pagerange\hfill \@eissn/\@snumber
        }
    \ifecta@layout
        \def\copyright@text{\url@fmt{}{\itshape}{\@journal}{\journal@url}, 
            \volume@label\ \@volume, \issue@label\ \@issue\ (\thepubmonth,\ 
            \the\@pubyear), \@pagerange
            }
    \fi
\fi
\def\copyrightline@skip{\z@}
\let\econsocart@styledata@noexpand\noexpand
\ifecta@layout
    \def\license@type{???license@type???}
    \csdef{license@???license@type???@licencetype}{???}
    \csdef{license@???license@type???@licencetypetext}{???}
    \def\ecta@oa@published@text{ Econometrica published by John Wiley \&
            Sons Ltd on behalf of The Econometric Society}%
    \def\license@CC@BY@NC@licencetype{creativeCommonsBy-nc}
    \def\license@CC@BY@NC@licencetypetext{This is an open access article under the terms of the 
        \econsocart@styledata@noexpand\href{https://creativecommons.org/licenses/by-nc/4.0/}%
            {Creative Commons Attribution-NonCommercial} License, which permits use, 
        distribution and reproduction in any medium, provided the original work is properly 
        cited and is not used for commercial purposes.%
        }
    \def\license@CC@BY@NC@ND@licencetype{creativeCommonsBy-nc-nd}
    \def\license@CC@BY@NC@ND@licencetypetext{This is an open access article under the terms of the 
        \econsocart@styledata@noexpand\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}%
            {Creative Commons Attribution-NonCommercial-NoDerivs} License, 
        which permits use and distribution in any medium, 
        provided the original work is properly cited, 
        the use is non-commercial and no modifications or adaptations are made.%
        }
    \def\license@CC@BY@licencetype{creativeCommonsBy}
    \def\license@CC@BY@licencetypetext{This is an open access article under the terms of the 
        \econsocart@styledata@noexpand\href{https://creativecommons.org/licenses/by/4.0/}%
            {Creative Commons Attribution} License, 
        which permits use, distribution and reproduction in any medium, 
        provided the original work is properly cited.%
        }
    \csdef{copyright@U.S. Government work@holdertext}{Published \the\@copyear. 
        This article is a U.S. Government work and 
        is in the public domain in the USA.%
        }
    \if@open@access
        \def\econsocart@too@long@open@access@corr{0pt}
        \def\econsocart@calc@oa@dim(#1/#2)*#3\@nil{{%
            \@tempdima=#1\relax
            \@tempdimb=#2\relax
            \@tempdimc=#3\relax
            \debug@wlog{econsocart@calc@oa@dim input: 
                (\the\@tempdima/\the\@tempdimb)*\the\@tempdimc}%
            \@tempcnta=\@tempdima
            \@settopoint\@tempdimb
            \edef\@tempdimb@nopt{\strip@pt\@tempdimb}%
            \edef\@tempdima@tosp{\the\@tempcnta sp}%
            \debug@wlog{econsocart@calc@oa@dim 1st arg to sp: \@tempdima@tosp}%
            \debug@wlog{econsocart@calc@oa@dim 2nd arg to integer without pt: \@tempdimb@nopt}%
            \edef\@tempratio{\strip@pt\dimexpr\@tempdima@tosp/\@tempdimb@nopt\relax}%
            \debug@wlog{econsocart@calc@oa@dim 1st arg divided by 2nd and pt removed: 
                \@tempdima@tosp/\@tempdimb@nopt=\@tempratio}%
            \@tempdima=\@tempratio\@tempdimc
            \xdef\econsocart@temp@oa@skip{\the\@tempdima}%
            \debug@wlog{econsocart@calc@oa@dim 3rd arg ratio multiplied by ratio: 
                \the\@tempdimc*\@tempratio=\econsocart@temp@oa@skip}%
            }}
        \def\copyrightline@text{%
            \setbox\@tempboxa\vbox{{%
                \parindent=\z@
                \nohyphen
                \spaceskip=\fontdimen2\font \@plus 1\p@ \@minus 1\p@
                \ifcsundef{correction@text}%
                    {}%
                    {%
                        \correction@text
                        \endgraf
                        \vskip10\p@
                    }%
                \ifcsundef{copyright@holder}%
                    {%
                        \textcopyright\ \the\@copyear\ The Author\ifnum\c@author>1s\fi.%
                        \ecta@oa@published@text.
                    }%
                    {%
                        \ifcsundef{copyright@\copyright@holder @holdertext}%
                            {%
                                \vtxClassError{econsocart}%
                                    {%
                                        There is no text for copyright holder "\copyright@holder".
                                        Please contact TeX support%
                                    }%
                                    {??}%
                            }%
                            {\csuse{copyright@\copyright@holder @holdertext}\\}%
                    }%
                \bgroup
                    \let\econsocart@styledata@noexpand\@empty
                    \ifdefined\econsocart@author@corref@num
                        \ifcsundef{econsocart@author@numid@\econsocart@author@corref@num}%
                            {%
                                \textbf{???CORREF AUTHOR??}%
                                \econsocart@error{failed to find id for author with number 
                                    \econsocart@author@corref@num\space for openaccess license}%
                            }%
                            {%
                                \edef\tmp@id{%
                                    \csuse{econsocart@author@numid@\econsocart@author@corref@num}%
                                    }%
                                \csuse{author@from@label\tmp@id}\
                            }%
                    \else
                        \econsocart@error{failed to find author with corref key}%
                        \textbf{???CORREF AUTHOR??}%
                    \fi
                    is the corresponding author on this paper.
                    \ifcsundef{copyright@holder}%
                        {\csuse{license@\license@type @licencetypetext}}%
                        {}%
                \egroup
                }}%
            \ifdim\ht\@tempboxa>\dimexpr3\baselineskip\relax
                \ifdim\ht\@tempboxa>\dimexpr5\baselineskip\relax
                    \ifcsundef{correction@text}%
                        {%
                            \econsocart@error{open access text in copyright is longer than 5 lines,
                                contact TeX support}%
                        }%
                        {%
                            \ifdim\ht\@tempboxa>\dimexpr8\baselineskip\relax
                                \econsocart@error{%
                                    Please shorten \string\setpkgattr{correction}{text} as correction + copyright
                                    is longer than 7 lines. Please consult this with chief of Red-Mak. More info OTRS139476%
                                    }%
                            \fi
                        }%
                \fi
                \edef\tmp@oa@corr{\the\dimexpr\baselineskip\relax}%
                \ifdim\ht\@tempboxa>\dimexpr4\baselineskip\relax
                    \edef\tmp@oa@corr{\the\dimexpr\baselineskip*2\relax}%
                \fi
                \ifcsundef{correction@text}%
                    {}%
                    {%
                        \@tempdima=\ht\@tempboxa
                        \divide \@tempdima by 10%
                        \@settopoint\@tempdima
                        \multiply \@tempdima by 10%
                        \advance \@tempdima by -2\baselineskip
                        \edef\tmp@oa@corr{\the\@tempdima}%
                    }%
                \immediate\write\@auxout{%
                    \string\xdef\string\econsocart@too@long@open@access@text{\tmp@oa@corr}%
                    }%
                \ifdim\econsocart@too@long@open@access@corr>\z@
                    \immediate\write\@auxout{%
                        \string\xdef\string\econsocart@too@long@open@access@spare{%
                            \econsocart@too@long@open@access@corr}%
                        }%
                \else
                    \immediate\write\@auxout{%
                        \string\xdef\string\econsocart@too@long@open@access@spare{\the\maxdimen}%
                        }%
                \fi
                \edef\tmp@oa@corr{\the\dimexpr6.62\p@+\tmp@oa@corr\relax}%
                \raisebox{\tmp@oa@corr}[\z@][\z@]{\vtop{\unvbox\@tempboxa}}%
            \else
                \raisebox{6.62\p@}[\z@][\z@]{\vtop{\unvbox\@tempboxa}}%
            \fi
            }
    \else
        \def\copyrightline@text{%
            \hsize=\textwidth
            \setbox\@tempboxa\vbox{{%
                \parindent=\z@
                \nohyphen
                \spaceskip=\fontdimen2\font \@plus 1\p@ \@minus 1\p@
                \ifcsundef{correction@text}%
                    {}%
                    {%
                        \correction@text
                        \endgraf
                        \vskip10\p@
                    }%
                \ifcsundef{copyright@holder}%
                    {%
                        \textcopyright\ \the\@copyear\ 
                        \url@fmt{}{}{\copyright@owner}{\journal@url}\hfill
                        \@ifundefined{@doi}%
                            {}%
                            {\startchkuriskip\safe@href{\doi@base\@doi}{\doi@base\@doi}\endchkuriskip}%
                    }%
                    {%
                        \csuse{copyright@\copyright@holder @holdertext}\\
                        \@ifundefined{@doi}%
                            {}%
                            {\startchkuriskip\safe@href{\doi@base\@doi}{\doi@base\@doi}\endchkuriskip}%
                    }%
                }}%
            \ifdim\ht\@tempboxa>\dimexpr8\baselineskip\relax
                \econsocart@error{%
                    Please shorten \string\setpkgattr{correction}{text} as correction + copyright
                    is longer than 7 lines. Please consult this with chief of Red-Mak. More info OTRS139476%
                    }%
            \fi
            \edef\tmp@correction@text@corr{\the\dimexpr\baselineskip\relax}%
            \ifdim\ht\@tempboxa>\dimexpr4\baselineskip\relax
                \edef\tmp@correction@text@corr{\the\dimexpr\baselineskip*2\relax}%
            \fi
            \ifcsundef{correction@text}%
                {}%
                {%
                    \@tempdima=\ht\@tempboxa
                    \divide \@tempdima by 10%
                    \@settopoint\@tempdima
                    \multiply \@tempdima by 10%
                    \advance \@tempdima by -2\baselineskip
                    \edef\tmp@correction@text@corr{\the\@tempdima}%
                }%
            \immediate\write\@auxout{%
                \string\xdef\string\econsocart@too@long@correction@text{\tmp@correction@text@corr}%
                }%
            \ifcsundef{correction@text}%
                {\def\copyrightline@text@corr{\z@}}%
                {\edef\copyrightline@text@corr{\the\dimexpr6.62\p@+\tmp@correction@text@corr\relax}}%
            \raisebox{\copyrightline@text@corr}[\z@][\z@]{\vtop{\unvbox\@tempboxa}}%
            }
    \fi
    \def\author@prefix{%
        \ifcsundef{econsocart@too@long@open@access@text}%
            {%
                \ifcsundef{correction@text}%
                    {}%
                    {\enlargethispage{-\econsocart@too@long@correction@text}}%
            }%
            {\enlargethispage{-\econsocart@too@long@open@access@text}}%
        }
\else
    \def\license@type{CC@BY@NC}
    \csdef{copyright@U.S. Government work@holdertext}{Published \the\@copyear. 
        This article is a U.S. Government work and 
        is in the public domain in the USA.%
        }
    \def\license@CC@BY@NC@licencetype{creativeCommonsBy-nc}
    \def\license@CC@BY@NC@licencetypetext{%
        Licensed under the 
        \econsocart@styledata@noexpand\href{https://creativecommons.org/licenses/by-nc/4.0/legalcode}%
            {Creative Commons Attribution-NonCommercial License 4.0}.%
        }
    \csdef{copyrightline@main@text}{%
        \ifcsundef{copyright@holder}%
            {%
                {\fontfamily{ptm}\selectfont\textcopyright}\ 
                \the\@copyear\ 
                The Author\ifnum\c@author>1 s\fi. \csuse{license@\license@type @licencetypetext}%
                \break
            }%
            {\csuse{copyright@\copyright@holder @holdertext}\\}%
        Available at \url{\journal@url}.
        \@ifundefined{@doi}{}{\startchkuriskip\url{\doi@base\@doi}\endchkuriskip}%
        }
    \def\copyrightline@text{%
        \bgroup
            \let\econsocart@styledata@noexpand\@empty
            \ifcsundef{correction@text}%
                {%
                    \csuse{copyrightline@main@text}%
                }%
                {%
                    \setbox\@tempboxa=\vbox{%
                        \correction@text
                        \endgraf
                        \vskip5.5\p@
                        \csuse{copyrightline@main@text}%
                        }%
                    \@tempdima=\dimexpr\ht\@tempboxa-2\baselineskip\relax
                    \ifdim\ht\@tempboxa>\dimexpr4\baselineskip+5.5\p@\relax
                        \econsocart@error{%
                            Please shorten \string\setpkgattr{correction}{text} as correction + copyright
                            is longer than 4 lines. Please consult this with chief of Red-Mak. More info OTRS139476%
                            }%
                        \@tempdima=\z@
                    \fi
                    \raisebox{-\@tempdima}[\z@][\z@]{\vbox{\unvbox\@tempboxa}}%
                }%
        \egroup
        }
    \def\author@prefix{%
        \enlargethispage{\the\dimexpr-2\baselineskip+11\p@\relax}%
        }% 2 cp lines only (not 3)
\fi
%
\def\keyword@postfix{\unskip.}
%
% HISTORY
\def\history@prefix{}
\def\history@postfix{.}
\def\received@prefix{Manuscript received~}
\def\received@postfix{}
\global\let\revised@prefix\undefined
\global\let\revised@postfix\undefined
\def\accepted@prefix{; final version accepted~}
\def\accepted@postfix{}
\def\pubonline@prefix{; available online~}
\def\pubonline@postfix{}
\def\coeditor@prefix{Co-editor }
\def\coeditor@postfix{ handled this manuscript.}
\ifecta@layout
    \define@key{coeditor}{prefix}{\gdef\coeditor@prefix{#1\ }}%
    \define@key{coeditor}{postfix}{\gdef\coeditor@postfix{\ #1}}%
    \define@key{coeditor}{name}{%
        \gdef\coeditor@postfix{ handled this manuscript as an invited #1 lecture. 
            The invitation to deliver the #1 lecture is also an invitation 
            to publish a suitable version of the lecture in Econometrica.%
            }%
        }%
    \define@key{coeditor}{praddress}[1]{%
        \gdef\coeditor@postfix{ handled this manuscript, which is based 
            on a Presidential Address.}%
        }%
\fi
%
% COUNTERS, ETC
\newcounter{author}
\newcounter{address}
\newdimen\sv@mathsurround
\newcount\@tempcntc
\newcount\@tempcntd
\newcount\@tempcnte
%
% RUNNING HEAD
\def\@runtitle{}
\def\runtitle#1{%
    \gdef\@runtitle{#1}%
    }
\def\@runauthor{}
\def\runauthor#1{{%
    \def\etal{et al.}%
    \gdef\@runauthor{#1}%
    }}
%
% FRONTMATTER STUFF
\csuse{econsocart@fmadd}
%
\newbox\fm@box
\newdimen\fm@size
%
\let\hy@frontmatter\relax
\let\hy@endfrontmatter\relax
%
\def\frontmatter{%
    \global\c@author=\z@
    \global\c@address=\z@
    \ifecta@layout\clearpage\fi% add this line to skip problems with offprint
    \csname fm@hook\endcsname
    \def\pdftitle##1{\write@pdfinfo{\user@hy@title}{##1}}%
    \def\pdfauthor##1{\write@pdfinfo{\user@hy@author}{##1}}%
    \def\pdfsubject##1{\write@pdfinfo{\user@hy@subject}{##1}}%
    \def\pdfkeywords##1{\write@pdfinfo{\user@hy@keywords}{##1}}%
    \sv@mathsurround=\mathsurround \m@th
    \parindent=\z@
    \hy@frontmatter
    \open@fm
    \ignorespaces
    }
\ifecta@layout
\else
    \g@addto@macro\frontmatter{\def\@makefntext@fmt#1{\hskip\z@\@makefnmark}}
\fi
% ENDFRONTMATTER
%
\def\n@authors{0}
% todo: remove when old aux file will be moved
\def\journalcopyrightline#1{}
\def\authorcopyrightline#1{}
\def\xmlrunauthor#1{}
\def\xmlpubmonth#1{}
\def\endfrontmatter{%
    \global\@topnum=\z@
    \set@pagerange
    \if@supplement@onlineonly
        \gdef\@runjournal{\sup@journal}%
    \else
        \if@report
            \gdef\@runjournal{\@journal\ (\the\@pubyear)}%
        \else
            \gdef\@runjournal{\@journal\ \@volume\ (\the\@pubyear)}%
        \fi
    \fi
    \form@runauthors
    \ifecta@layout
        \markboth{{\let\.\econsocart@redef@uc@dot\@runauthor}}{\@runtitle}%
    \else
        \markboth{\@runauthor\hfill\@runjournal}{\@runjournal\hfill\@runtitle}%
    \fi
    \csname econsocart@fm@markboth@hook\endcsname
    \thispagestyle{copyright}%
    \funding@@fmt
    \ifqe@layout
        \ifx\@thanks\@empty
            \def\@thanks{%
                \protect\support@thefnmark{}%
                \protect\@footnotetext{}%
                }%
        \fi
    \fi
    \@thanks
    \abstract@fmt
    \keyword@fmt
    \close@fm
    \ifecta@layout
    \else
        \ifx\copyright@owner\copyright@default
            \ifnum\c@author=2\relax
                \gdef\authors@sep@b{ and }%
            \else
                \ifnum\c@author>2\relax
                    \def\last@num{\alph{author}}%
                    \expandafter\gdef\csname authors@sep@\last@num\endcsname{, and }%
                \fi
            \fi
            \gdef\copyright@owner{\the\authors@list}%
        \fi
        \setbox\@tempboxa\vbox{%
            \parbox[b]{\hsize}{\copyright@size\copyrightline@text\hfill
                \ifqe@layout
                    \vadjust{\vskip7.3\p@}%
                \else
                    \vadjust{\vskip5.8\p@}%
                \fi
                }%
            }%
        \@tempdimc=\ht\@tempboxa
        \ifdim\@tempdimc>26\p@\relax% usually ~26pt
            \advance\@tempdimc by -26\p@
            \enlargethispage{-\@tempdimc}%
        \fi
    \fi
    \write@pdfinfo{\hy@author}{\the\authors@list}%
    \bgroup
        \no@harm
        \xdef\@argi{\@runauthor}%
    \egroup
    \ifx\@runauthor\@empty
    \else
        \expandafter\gdef\expandafter\xml@runauthor\expandafter{\@argi}%
    \fi
    \expandafter\ifx\expandafter&\the\authors@list&%
        \xdef\xml@authorcopyrightline{\noexpand\copyright\ 
            \the\@copyear\space The Econometric Society}%
    \else
        \ifnum\c@author>\@ne
            \xdef\xml@authorcopyrightline{\noexpand\copyright\ 
                \the\@copyear\space The Authors.}%
        \else
            \xdef\xml@authorcopyrightline{\noexpand\copyright\ 
                \the\@copyear\space The Author.}%
        \fi
    \fi
    \ifecta@layout
        \ifcsundef{copyright@holder}%
            {%
                \if@open@access
                    \xappto\xml@authorcopyrightline{\ecta@oa@published@text}%
                \else
                    \global\let\xml@authorcopyrightline\undefined
                \fi
            }%
            {%
                \xdef\xml@authorcopyrightline{%
                    \csuse{copyright@\copyright@holder @holdertext}%
                    }%
            }%
    \else
        \ifcsundef{copyright@holder}%
            {\gpreto\xml@authorcopyrightline{Copyright }}%
            {%
                \xdef\xml@authorcopyrightline{%
                    \csuse{copyright@\copyright@holder @holdertext}%
                    }%
            }%
    \fi
    \bgroup
        \let\smonth\@firstofone
        \xdef\xml@pubmonth{\@pubmonth}%
    \egroup
    \protected@write\@auxout{}{\string\gdef\string\n@authors{\the\c@author}}%
    \if@xmlfmbm
    \else
        \write@pdfinfo{\hy@subject}{\@journal, \volume@label\space\@volume, 
            \issue@label\space\@issue, \thepubmonth, \the\@pubyear, \@pagerange}%
    \fi
    \if@xmlfmbm
    \else
        \write@pdfinfo{\hy@keywords}{\the\keywords@list}%
    \fi
    \mdforvkt{main-article-info}{volume}{\@volume}%
    \mdforvkt{main-article-info}{issue}{\@issue}%
    \mdforvkt{main-article-info}{pubyear}{\the\@pubyear}%
    \mdforvkt{main-article-info}{copyear}{\the\@copyear}%
    \mdforvkt{main-article-info}{firstpage}{\thepage@prefix\@firstpage}%
    \mdforvkt{main-article-info}{lastpage}{\thepage@prefix\@lastpage}%
    \hy@endfrontmatter
    \global\mathsurround=\sv@mathsurround
    \global\let\@thanks\@empty
    \gdef\keyword@exist{0}%
    \global\c@footnote=\c@thanks
    \aftergroup\frontmatter@cmd
    }
\let\maketitle\relax
\newdimen\t@xtheight
\def\init@settings{%
    \splittopskip=\topskip
    \splitmaxdepth=\maxdepth
    \t@xtheight=\textheight
    \advance\t@xtheight by -\splittopskip
    }
\def\no@harm{%
    \def\qq@group@start{}%
    \def\qq@group@end{}%
    \let\qq@cmd\@firstofone
    \def\qq@style{}%
    \let\thanks\@gobble
    \let\thanksref\@gobble
    \let~\space
    \def\ead[##1]##2{}%
    \let\\\@empty
    \def\protect{\noexpand\protect\noexpand}%
    }
%
\def\open@fm{%
    \global\setbox\fm@box=\vbox\bgroup
        \hsize=\textwidth
        \frontmatter@style
    }
%
\def\close@fm{%
        \par
    \egroup
    \fm@size=\dp\fm@box
    \advance\fm@size by \ht\fm@box
    \@whiledim\fm@size>\t@xtheight\do{%
        \global\setbox\@tempboxa=\vsplit\fm@box to \t@xtheight
        \unvbox\@tempboxa
        \fm@size=\dp\fm@box
        \advance\fm@size by \ht\fm@box
        }%
    \unvbox\fm@box
    }
%
% DOCHEAD
\def\dochead#1{%
    \bgroup
        \dochead@size
        \leavevmode\vphantom{\strut}#1\par
    \egroup
    \def\title@skip{8\p@}%
    }
%
\csuse{econsocart@cmn@settings}
%
% TITLE
\def\title#1{%
    \vglue\title@skip
    \bgroup
        \no@harm
        \xdef\@argi{#1}%
    \egroup
    \write@pdfinfo{\hy@title}{\@argi}%
    \ifecta@layout
        \gdef\title@for@off{#1}%
        \write@offdata{title}{}{}{\expandafter\strip@prefix\meaning\title@for@off}%
    \fi
    \mdforvkt{main-article-info}{title}{#1}%
    \bgroup
        \title@size{#1}\par
    \egroup
    }
%
% AUG - author block
\let\sv@thanksref\thanksref % saving previous \thanksref macro
\@namedef{auto@1@and@user@1@printauthor@error}{%
    \econsocart@error{macro \string\printauthor\space must be used 
        for all authors, because automatic printing for partial list
        can not process ranking correctly}%
    }
\newenvironment{aug}%
    {%
        \def\thanksref{%
            \ifcsundef{author@thanksref@used}%
                {%
                    \csxdef{author@thanksref@used}{\the\c@author}%
                }%
                {%
                    \edef\@tmp{\the\c@author}%
                    \ifnum\author@thanksref@used=\@tmp
                    \else
                        \econsocart@error{more than once \string\thanksref\space found}%
                    \fi
                }% 
            \sv@thanksref
            }%
    }%
    {%
        \if@supplement
        \else
            \ifnum\n@authors>\z@
                \@tempcnta=\z@
                \edef\auto@printauthor@used{0}%
                \edef\user@printauthor@used{0}%
                \@whilenum\@tempcnta<\c@author\do{%
                    \advance\@tempcnta by \@ne
                    \edef\auto@prnaut@tmp{\@nameuse{econsocart@author@numid@\the\@tempcnta}}%
                    \edef\auto@prnead@tmp{\@nameuse{econsocart@author@\the\@tempcnta @eadref@numid}}%
                    \@ifundefined{printauthor@used@\auto@prnaut@tmp}%
                        {% auto
                            \@ifundefined{econsocart@author@numdeceased@\the\@tempcnta}%
                                {%
                                    \@ifundefined{econsocart@author@\the\@tempcnta @eadref@numid}%
                                        {}%
                                        {%
                                            \begingroup\unrestored@protected@xdef\@thefnmark{}\endgroup
                                            \@footnotetext{%
                                                \csuse{printauthor@footnotetext@prehook}%
                                                \@printauthor{\auto@prnaut@tmp}: 
                                                \printead{\auto@prnead@tmp}%
                                                }%
                                            \edef\auto@printauthor@used{1}%
                                        }%
                                }%
                                {}%
                        }%
                        {% user
                            \@ifundefined{econsocart@author@numdeceased@\the\@tempcnta}%
                                {\edef\user@printauthor@used{1}}%
                                {}%
                        }%
                    }%
                \@nameuse{auto@\auto@printauthor@used @and@user@%
                    \user@printauthor@used @printauthor@error}%
            \fi
        \fi
    }
%
% AUTHOR
\def\and{\unskip~and~}
\newcounter{econsocartaddressref}
%
\define@key{ead}{label}{%
    \def\ead@label{#1}%
    \protected@write\@auxout{}{\string\csxdef{econsocart@author@\the\c@author @eadref@numid}{#1}}%
    }
%
\ifecta@layout
    \let\econsocart@save@sc@dot\.
    \csdef{econsocart@\detokenize{\i}@sc@dot}{{\fontsize{.8em}{.8em}\selectfont\.I}}
    \protected\def\econsocart@redef@sc@dot#1{%
        \ifcsundef{econsocart@\detokenize{#1}@sc@dot}%
            {\econsocart@save@sc@dot{#1}}%
            {\csuse{econsocart@\detokenize{#1}@sc@dot}}%
        }
    \let\econsocart@save@uc@dot\.
    \csdef{econsocart@\detokenize{\i}@uc@dot}{\.I}
    \protected\def\econsocart@redef@uc@dot#1{%
        \ifcsundef{econsocart@\detokenize{#1}@uc@dot}%
            {\econsocart@save@uc@dot{#1}}%
            {\csuse{econsocart@\detokenize{#1}@uc@dot}}%
        }
\fi
\def\author{\@ifnextchar[{\author@fmt}{\author@fmt[default]}}
%
\def\author@fmt[#1]#2{%
    \stepcounter{author}%
    \setcounter{econsocartaddressref}{0}%
    \csxdef{econsocart@author@numid@\the\c@author}{\the\c@author}%
    \protected@write\@auxout{}{%
        \string\csxdef{econsocart@author@numid@\the\c@author}{\the\c@author}%
        \string\csxdef{econsocart@author@idnum@\the\c@author}{\the\c@author}%
        }%
    \def\@tmp@corref{corref}%
    \def\@tmp@deceased{deceased}%
    \@for\tmp@addr@ref:=#1\do{%
        \ifx\tmp@addr@ref\@tmp@corref
            \xdef\econsocart@author@corref@num{\the\c@author}%
        \else
            \ifx\tmp@addr@ref\@tmp@deceased
                \csxdef{econsocart@author@numdeceased@\the\c@author}{1}%
                \protected@write\@auxout{}{\string\csxdef{econsocart@author@numdeceased@\the\c@author}{1}}%
            \else
                \stepcounter{econsocartaddressref}%
                \@ifundefined{econsocart@address@idnum@\tmp@addr@ref}%
                    {%
                        \ifnum\n@authors>\z@
                            \econsocart@error{there is no address with label: \tmp@addr@ref}%
                        \fi
                    }%
                    {}%
                \protected@write\@auxout{}{%
                    \string\csxdef{econsocart@author@\the\c@author @addressref@numid@%
                        \the\c@econsocartaddressref}{\tmp@addr@ref}%
                    }%
            \fi
        \fi
        }%
    \ifnum\c@econsocartaddressref=\z@
        \stepcounter{econsocartaddressref}%
        \protected@write\@auxout{}{%
            \string\csxdef{econsocart@author@\the\c@author @addressref@numid@%
                \the\c@econsocartaddressref}{default}%
            }%
    \fi
    \protected@write\@auxout{}{%
        \string\csxdef{econsocart@author@\the\c@author @addressrefs}{\the\c@econsocartaddressref}%
        }%
    \ifnum\c@author=\@ne
        \author@fmt@init
    \fi
    \bgroup% for offdata and pdf metadata
        \def\inits##1{##1}%
        \def\fnms##1{{##1}}%
        \def\particle##1{##1}%
        \def\snm##1{##1}%
        \edef\tmp@aut@id{\@nameuse{econsocart@author@numid@\@arabic\c@author}}%
        \global\@namedef{author@from@label\tmp@aut@id}{%
            \def\inits####1{####1}%
            \def\fnms####1{####1}%
            \def\particle####1{####1}%
            \def\snm####1{####1}%
            \def\ead####1####{\@gobble}%
            #2%
            }%
        \ifnum\c@author=\@ne
            \addto@authors@list{\alph{author}}{}{#2}%
        \else
            \addto@authors@list{\alph{author}}{, }{#2}%
        \fi
        \ifecta@layout
            \ifx.#1.%
                \write@offdata{author}{\@arabic\c@author}{default}{#2}%
            \else
                \write@offdata{author}{\@arabic\c@author}%
                    {\csuse{econsocart@author@numid@\@arabic\c@author}}{#2}%
            \fi
        \fi
    \egroup
    \bgroup% for view and aux metadata
        \def\fnms##1{%
            \ifecta@layout\fm@add@inits@from@name@by@aux{##1}\fi
            \cmd@for@aut@elem{fnms}{\the\c@author}{##1}%
            \mdforvkt{main-article-info}{fnm-\the\c@author}{##1}%
            \ifecta@layout
                \bgroup
                    \let\.\econsocart@redef@sc@dot
                    ##1%
                \egroup
            \else
                ##1%
            \fi
            }%
        \def\inits##1{%
            \ifecta@layout
                \fm@add@inits@used
                \protected@write\@auxout{}{\string\csxdef{author@\the\c@author @inits@used}{1}}%
            \fi
            \cmd@for@aut@elem{inits}{\the\c@author}{##1}%
            \mdforvkt{main-article-info}{inits-\the\c@author}{##1}%
            ##1%
            }%
        \def\particle##1{%
            \cmd@for@aut@elem{snm}{\the\c@author}{##1 }%
            ##1%
            }% prefix to snm
        \def\snm##1{%
            \csgappto{\short@journal @snm@\the\c@author @author}{##1}%
            \mdforvkt{main-article-info}{snm-\the\c@author}{%
                \csuse{\short@journal @snm@\the\c@author @author}%
                }%
            \ifecta@layout
                \bgroup
                    \let\.\econsocart@redef@sc@dot
                    ##1%
                \egroup
            \else
                ##1%
            \fi
            }%
        \ifecta@layout
            \scshape
        \fi
        #2%
    \egroup
    \endgraf
    \ifecta@layout
        \makeauthornumaffiliations{\the\c@author}%
    \fi
    \aff@fmt{\printauthornumaddresses{\the\c@author}}%
    }
% 
\def\authors@septwo{\unskip~and \ignorespaces}
\def\authors@sepmid{\unskip, \ignorespaces}
\def\authors@seplast{\unskip~and \ignorespaces}
\def\authors@endgraf{\endgraf}
% 
\def\author@fmt@init{%
    \vskip\authors@skip
    \leavevmode\author@size\author@prefix
    }
% 
\def\@printauthor#1{%
    \@ifundefined{author@from@label#1}%
        {\econsocart@error{there is no author with label: #1}}%
        {\csname author@from@label#1\endcsname}%
    }
\newcommand\printauthor[1][]{%
    \@printauthor{#1}%
    \protected@write\@auxout{}{\string\csxdef{printauthor@used@#1}{1}}%
    }
%
\def\makeauthornumaffiliations#1{%
    \@ifundefined{econsocart@aff@made@for@#1@author}%
        {%
            \@ifundefined{econsocart@author@#1@addressrefs}%
                {}%
                {%
                    \@tempcntb=\z@
                    \edef\aff@toks{}%
                    \@whilenum\@tempcntb<\csuse{econsocart@author@#1@addressrefs}\do{%
                        \advance\@tempcntb\@ne
                        \xdef\tmp@add@ref{%
                            \csuse{econsocart@author@#1@addressref@numid@\the\@tempcntb}%
                            }%
                        \protected@edef\aff@toks{\aff@toks
                            \csuse{address@for@affiliation@num@%
                                \csuse{econsocart@address@idnum@\tmp@add@ref}}%
                            \sep@by@num@in@seq{\the\@tempcntb}%
                                {\csuse{econsocart@author@#1@addressrefs}}%
                                {{} and }{, }{, and } {}}%
                        }%
                        \protected@write\@auxout{}{%
                            \string\csxdef{affiliation@\csuse{econsocart@author@numid@#1}}%
                            {\aff@toks}%
                            }%
                }%
        }%
        {}%
    }
%
% print all author addresses
\def\printauthornumaddresses#1{%
    \ifnum\n@authors>\z@
        \@tempcntb=\z@
        \@whilenum\@tempcntb<\@nameuse{econsocart@author@#1@addressrefs}\do{%
            \advance\@tempcntb\@ne
            \edef\tmp@add@ref{\@nameuse{econsocart@author@#1@addressref@numid@\the\@tempcntb}}%
            \printaddressnum{\@nameuse{econsocart@address@idnum@\tmp@add@ref}}%
            \sep@by@num@in@seq{\the\@tempcntb}%
                {\@nameuse{econsocart@author@#1@addressrefs}}%
                {{} and }{, }{, and }{}%
            }%
    \fi
    }
%
% DEDICATED
\def\dedicated#1{%
    \vskip\dedicated@skip
    \bgroup
        \dedicated@size #1\par
    \egroup
    }
%
% ADDRESS
\def\address{\@ifnextchar[{\address@fmt}{\address@fmt[default]}}
%
\ifecta@layout
    \def\aff@eat@stop{}
    \def\aff@eat@this#1\aff@eat@stop{}
    \def\aff@eat@this@till@comma#1,#2\aff@eat@stop{\ignorespaces #2}
    \def\def@orgdiv@for@aux{\def\orgdiv##1{\protect\aff@eat@stop\space##1}}
    \def\address@fmt[#1]#2{%
        \stepcounter{address}%
        \protected@write\@auxout{}{%
            \string\csxdef{econsocart@address@numid@\the\c@address}{#1}%
            \string\csxdef{econsocart@address@idnum@#1}{\the\c@address}%
            }%
        \csxdef{econsocart@address@numid@\the\c@address}{#1}%
        \csxdef{econsocart@address@idnum@#1}{\the\c@address}%
        \edef\tmp@addr@id{\csuse{econsocart@address@numid@\the\c@address}}%
        \expandafter\protected@xdef\csname address@ref@\tmp@addr@id\endcsname{\the\c@address}%
        \expandafter\newtoks\csname @address@\the\c@address\endcsname
            \expandafter\expandafter\expandafter\global
            \csname @address@\the\c@address\endcsname={#2}%
        \protected@write\@auxout
            {%
                \def@orgdiv@for@aux
                \def\dept##1{\protect\aff@eat@this@till@comma\space##1}%
                \def\orgname##1{\protect\aff@eat@stop\space##1}%
                \def\state##1{\protect\aff@eat@stop\space##1}%
                \def\street##1{\protect\aff@eat@this\space##1}%
                \def\postcode##1{\protect\aff@eat@stop\space##1}%
                \def\postbox##1{\protect\aff@eat@stop\space##1}%
                \def\city##1{\protect\aff@eat@stop\space##1}%
                \def\cny##1{\protect\aff@eat@stop\space##1}%
            }{%
                \string\global\string\@namedef{address@for@affiliation@num@\the\c@address}%
                {#2\string\aff@eat@stop}%
            }%
        \protected@write\@auxout
            {%
                \let\dept\@firstofone
                \let\orgdiv\@firstofone
                \let\orgname\@firstofone
                \let\postbox\@firstofone
            }{%
                \string\global\string\@namedef{econsocart@address@for@author@\the\c@address}{#2}%
            }%
        }
\else
    \def\address@fmt[#1]#2{%
        \stepcounter{address}%
        \protected@write\@auxout{}{%
            \string\csxdef{econsocart@address@numid@\the\c@address}{#1}%
            \string\csxdef{econsocart@address@idnum@#1}{\the\c@address}%
            }%
        \csxdef{econsocart@address@numid@\the\c@address}{#1}%
        \csxdef{econsocart@address@idnum@#1}{\the\c@address}%
        \protected@write\@auxout
            {%
                \let\orgdiv\@firstofone
                \let\orgname\@firstofone
                \let\state\@firstofone
                \let\street\@firstofone
                \let\postcode\@firstofone
                \let\postbox\@firstofone
                \let\city\@firstofone
                \let\cny\@firstofone
            }{%
                \string\global\string\@namedef{econsocart@address@for@author@\the\c@address}{#2}%
            }%
        \expandafter\newtoks\csname @address@\the\c@address\endcsname
        \expandafter\expandafter\expandafter\global\csname @address@\the\c@address\endcsname={#2}%
        }
\fi
\def\printaddressnum#1{%
    \ifnum\n@authors>\z@
        \bgroup
            \@ifundefined{econsocart@address@for@author@#1}%
                {\econsocart@error{there is no address with number: #1}}%
                {}%
            \@nameuse{econsocart@address@for@author@#1}%
        \egroup
    \fi
    }
%
\gpreto\enddocument{%
    \@ifundefined{bibliographyexists}%
        {%
            \printhistory
        }%
        {%
            \medskip
            \ifecta@layout
            \else
                \csuse{econsocart@printhistory@rule@position}%
                \hrule\@width 18mm\relax
            \fi
            \printhistory
        }%
    }
%
% affiliation
\def\affiliation{\@ifnextchar[{\affiliation@fmt}{\affiliation@fmt[default]}}
%
\long\def\aff@fmt#1{\bgroup\footnotesize\upshape#1\par\egroup
    \if@open@access
        \ifcsundef{econsocart@too@long@open@access@text}%
            {}%
            {%
                \xdef\econsocart@too@long@open@access@corr{%
                    \the\dimexpr\econsocart@too@long@open@access@corr+\baselineskip\relax
                    }%
                \econsocart@calc@oa@dim(\econsocart@too@long@open@access@text/%
                    \econsocart@too@long@open@access@spare)*\baselineskip\@nil
                \vskip-\econsocart@temp@oa@skip
            }%
    \fi
    \vskip\baselineskip
    }
\ifecta@layout
    \def\affiliation@fmt[#1]#2{%
        \@for\tmp@aff@id:=#1\do{%
            \@ifundefined{econsocart@author@idnum@\tmp@aff@id}%
                {\econsocart@error{there is no author with id '\tmp@aff@id'}}%
                {}%
            \protected@write\@auxout{}{%
                \string\csxdef{econsocart@aff@made@for@%
                    \csuse{econsocart@author@idnum@\tmp@aff@id}@author}{1}%
                }%
            \write@offdata{affiliation}{}{\tmp@aff@id}{#2}%
            }%
        }
\else
    \def\affiliation@fmt[#1]#2{\aff@fmt{#2}}%
\fi
%
% ABSTRACT
\newbox\abstract@box
%
\def\abstract{%
    \global\setbox\abstract@box=\vbox\bgroup
        \@tempdima=\textwidth
        \advance\@tempdima by-\abstract@width
        \divide\@tempdima by 2%
        \abstract@style
        \leftskip=\@tempdima
        \rightskip=\@tempdima
        \abstract@size
        \parindent=\sv@parindent
        \noindent
        \hskip\abstract@indent
        {\abstractname@style\abstractname}%
        \abstractname@afterskip\ignorespaces
    }
\def\endabstract{\par\egroup}
%
\def\abstract@fmt{%
    \ifvoid\abstract@box
    \else
        \if@open@access
            \ifecta@layout
                \ifcsundef{econsocart@too@long@open@access@text}%
                    {}%
                    {%
                        \xdef\econsocart@too@long@open@access@corr{%
                            \the\dimexpr\econsocart@too@long@open@access@corr+\abstract@skip\relax
                            }%
                        \econsocart@calc@oa@dim(\econsocart@too@long@open@access@text/%
                            \econsocart@too@long@open@access@spare)*\abstract@skip\@nil
                        \vskip-\econsocart@temp@oa@skip
                    }%
            \fi
        \fi
        \vskip\abstract@skip
        \unvbox\abstract@box
    \fi
    }
%
% pubmonth, doi, aid
\def\pubmonth#1{%
    \gdef\@pubmonth{#1}%
    \global\let\set@pubmonth@by@issue\relax
    }
\def\@pubmonth{0}
%
\AtBeginDocument{\set@pubmonth@by@issue}
%
\def\thepubmonth{%
    \@ifundefined{month@item@\@pubmonth}%
        {????}%
        {\getitemvalue{month}{\@pubmonth}}%
    }
\ifecta@layout
    \def\pubmonth@by@issue@list{0,1,3,5,7,9,11}
\else
    \def\pubmonth@by@issue@list{0,1,5,7,11}
\fi
\def\set@pubmonth@by@issue{%
    \@tempcnta=\z@
    \@for\my@iss:=\pubmonth@by@issue@list\do{%
        \ifnum\@issue=\@tempcnta
            \xdef\@pubmonth{\my@iss}%
            \xdef\pubmonth@set{1}%
        \fi
        \advance\@tempcnta\@ne
        }%
    \@ifundefined{pubmonth@set}%
        {\econsocart@error{not found month by issue value \issue\space 
            from month list: \pubmonth@by@issue@list}}%
        {}%
    }
%
\def\doi#1{\gdef\@doi{#1}}
\def\@doi{}
\def\doi@base{https://doi.org/}
%
\def\@aid{<undef>}
\def\aid#1{%
    \ifx&#1&%
        \econsocart@error{\string\aid\space number can not be empty!}%
    \else
        \gdef\@aid{#1}%
    \fi
    }
%
% doctopic
\DeclareRobustCommand\doctopic[2][]{%
    \mdforvkt{main-article-info}{doctopic}{#2}%
    \def\@tempa{#2}%
    \ifx\@tempa\@empty
    \else
        \def\@tempa{#1}%
        \ifx\@tempa\@empty
            \gdef\@doctopic{#2}%
        \else
            \@ifundefined{doctopic@#1@text@#2}%
                {\econsocart@error{there is no such doctopic code!}}%
                {\csname doctopic@#1@extra@#2\endcsname
                    \xdef\@doctopic{\csname doctopic@#1@text@#2\endcsname}%
                }%
        \fi
    \fi
    }
%
\def\seqiniss#1{\gdef\@seqiniss{#1}\mdforvkt{main-article-info}{seqiniss}{#1}}
%
% HISTORY: received, accepted
\def\history@exist{0}
%
\def\@received{\@nil}
\def\received#1{%
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
    \else
        \gdef\@received{#1}%
        \gdef\history@exist{1}%
    \fi
    }
\def\@accepted{\@nil}
\def\accepted#1{%
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
    \else
        \gdef\@accepted{#1}%
        \gdef\history@exist{1}%
    \fi
    }
\global\let\revised\undefined
\def\@pubonline{\@nil}
\def\pubonline#1{%
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
    \else
        \gdef\@pubonline{#1}%
        \gdef\history@exist{1}%
    \fi
    }
\def\@coeditor{\@nil}
\def\coeditor{\@ifnextchar[{\coeditor@}{\coeditor@[]}}
\def\coeditor@[#1]#2{%
    \ifx.#1.%
    \else
        \gdef\coeditor@prefix{#1\ }%
    \fi
    \def\@tempa{#2}%
    \ifx\@tempa\@empty
    \else
        \gdef\@coeditor{#2}%
        \gdef\history@exist{1}%
    \fi
    }
\ifecta@layout
    \def\coeditor@[#1]#2{%
        \setkeys{coeditor}{#1}%
        \def\@tempa{#2}%
        \ifx\@tempa\@empty
        \else
            \gdef\@coeditor{#2}%
            \gdef\history@exist{1}%
        \fi
        }
\fi
\def\empty@data{\@nil}
\def\history@fmt{%
    \ifcase\history@exist
    \else
        \ifecta@layout
            \par
            \vskip-\medskipamount
            \centerline{%
                \csuse{econsocart@printhistory@rule@position}%
                \rule[-3\p@]{18mm}{.4\p@}%
                }%
        \fi
        \bgroup
            \nobreak
            \vskip\history@skip
            \nobreak
            \history@size
            \leavevmode
            \history@prefix
            \ifx\@coeditor\empty@data
            \else
                \bgroup
                    \let\prefix\@firstofone
                    \let\fnm\@firstofone
                    \let\snm\@firstofone
                    \let\suffix\@firstofone
                    \coeditor@prefix\@coeditor\coeditor@postfix
                    \smallskip\ifecta@layout\else\hfill\fi\break
                \egroup
            \fi
            \csuse{econsocart@printhistory@history@position}%
            \ifx\@received\empty@data
            \else
                \received@prefix\@received\received@postfix
            \fi
            \ifx\@accepted\empty@data
            \else
                \accepted@prefix\@accepted\accepted@postfix
            \fi
            \ifx\@pubonline\empty@data
            \else
                \pubonline@prefix\@pubonline\pubonline@postfix
            \fi
            \history@postfix\par
            \@ifundefined{replication@statement}%
                {%
                    \csuse{econsocart@printhistory@error@output}%
                }%
                {%
                    \vskip\baselineskip
                    \ifecta@layout
                        \parindent=\sv@parindent
                    \else
                        \noindent
                    \fi
                    \replication@statement
                }%
        \egroup
        \gdef\history@exist{0}%
    \fi
    }
\let\printhistory\history@fmt
%
\def\sday#1{#1}
\def\smonth@by@word#1{%
    \@ifundefined{month@item@#1}%
        {\econsocart@error{there is no month with number: #1}}%
        {\getitemvalue{month}{#1}}%
    }
\ifqe@layout
    \let\smonth\smonth@by@word
\else
    \def\smonth#1{#1}
    \let\smonth\smonth@by@word
\fi
\def\syear#1{#1}
\setvaluelist{month}{January,February,March,April,May,June,July,%
    August,September,October,November,December}
\expandafter\def\csname month@item@0\endcsname{????}
%
% KEYWORDS
\newbox\keyword@box
\newdimen\pre@kwd@depth
%
\def\keyword@AMS{AMS 2000 subject classifications:}
\def\keyword@KWD{Keywords.}
\def\keyword@JEL{JEL classif{i}cation.}
\def\keyword@class{KWD}
\ifecta@layout
    \def\keyword@KWD{Keywords:}
\fi
\gdef\keyword{\@ifnextchar[{\@keyword}{\@keyword[class=KWD]}}
\gdef\@keyword[#1]{%
    \do@option@list{keyword}{#1}%
    \def\keyword@name{\csname keyword@\keyword@class\endcsname}%
    \let\kwd@sep\relax
    \global\setbox\keyword@box=\vbox\bgroup
        \ifvoid\keyword@box
        \else
            \unvbox\keyword@box
            \vskip-\pre@kwd@depth
            \vtop to\pre@kwd@depth{}%
            \ifecta@layout\else\vskip2\p@\fi
        \fi
        \@tempdima\textwidth
        \advance\@tempdima by-\keyword@width
        \divide\@tempdima by 2%
        \keyword@style
        \leftskip\@tempdima
        \rightskip\@tempdima
        \keyword@size
        \parindent\sv@parindent
        \noindent
        \hskip\keyword@indent{\keywordname@size\keyword@name}\space
        \hskip.1\p@
    }
\def\endkeyword{%
        \keyword@postfix
        \par
        \global\pre@kwd@depth=\prevdepth
    \egroup
    }
\def\keyword@fmt{%
    \ifvoid\keyword@box
    \else
        \if@open@access
            \ifecta@layout
                \ifcsundef{econsocart@too@long@open@access@text}%
                    {}%
                    {%
                        % keywords are close too abstract so only 30% of spare space is used
                        \@tempskipa=\keyword@skip
                        \xdef\econsocart@too@long@open@access@corr{%
                            \the\dimexpr\econsocart@too@long@open@access@corr+0.5\@tempskipa\relax
                            }%
                        \econsocart@calc@oa@dim(\econsocart@too@long@open@access@text/%
                            \econsocart@too@long@open@access@spare)*0.5\@tempskipa\@nil
                        \vskip-\econsocart@temp@oa@skip
                    }%
            \fi
        \fi
        \vskip\keyword@skip
        \unvbox\keyword@box
    \fi
    }
\def\sep{\unskip\string, }
\DeclareRobustCommand*\kwd{\@ifnextchar[\@kwd{\@kwd[\kwd@sep]}}
\gdef\keywords@list@sep{}
\def\@kwd[#1]#2{%
    \unskip
    #1{#2}%
    \addto@keywords@list{\keywords@list@sep #2}%
    \xdef\keywords@list@sep{, }%
    \let\kwd@sep\sep
    }
%
% Layouts:
\def\layout@notes{% todo: update for new converter?
    \xdef\layout@notes@used{1}%
    \let\seccnt@size\small
    \setlength\smallskipamount{4.5\p@ \@plus 1\p@ \@minus 1\p@}%
    \setlength\medskipamount{11\p@ \@plus 3\p@ \@minus 3\p@}%
    \setlength\bigskipamount{17\p@ \@plus 3\p@ \@minus 3\p@}%
    \def\dochead@size{\small\fontshape{uc}\selectfont}%
    \def\title@size{\small\fontshape{uc}\selectfont}%
    \def\author@size{\small\scshape}%
    \def\affiliation@size{\small\itshape}%
    \def\dedicated@size{\small\itshape}%
    \small
    }
%
% \tableofcontents
\csuse{econsocart@imstoc}
%
% interaction with hyperref: {prefix}{font}{text}{url}
\def\url@fmt#1#2#3#4{%
    \edef\@tempa{#3}%
    \ifx\@tempa\@empty
    \else
        #1{#2\safe@href{#4}{#3}}%
    \fi
    }
%
\csuse{econsocart@hyper@settings}
%
\def\write@pdfinfo#1#2{}
%
\newtoks\authors@list
\def\addto@authors@list#1#2#3{%
    \expandafter\gdef\csname authors@sep@#1\endcsname{#2}%
    \begingroup
        \no@harm
        \xdef\@act{%
            \global\noexpand\authors@list{%
                \the\authors@list\noexpand\csname authors@sep@#1\endcsname #3%
                }%
            }%
        \@act
    \endgroup
    }
%
\newtoks\keywords@list
\def\addto@keywords@list#1{%
    \begingroup
        \no@harm
        \xdef\@act{\global\noexpand\keywords@list{\the\keywords@list#1}}%
        \@act
    \endgroup
    }
%
% bibitem
\let\real@bibitem\bibitem
%
\csuse{econsocart@print@msnbibl}
%
\csuse{econsocart@urilist}
%
\csuse{econsocart@bibliography@exists}
%
\csuse{econsocart@offprint}
%
\csuse{econsocart@bibtags}
%
\csuse{econsocart@sici}
%
\csuse{econsocart@backref}
%
\csuse{econsocart@queries}
%
% SUPPORTING INFORMATION
\def\online@title{Supporting Information}
\def\online@text{Additional Supporting Information may be found in the online 
    version of this article at the \mbox{publisher's} website:}
\define@key{online}{title}{\def\online@title{#1}}
\define@key{online}{text}{\long\def\online@text{#1}}
\newenvironment{online}[1][]%
    {\setbox\@tempboxa\vbox\bgroup}%
    {\egroup\aftergroup\ignorespaces}%
\def\ESM#1#2#3{#3\endgraf}% todo: move to cfg if it is not needed in template
%% INITIALIZATION
% DIMENSIONS
\@twosidetrue
\pagenumbering{arabic}
\ifte@layout
    \def\etal{et~al\spacefactor=999\relax}
\else
    % condition \ifnum\sfcode`\.=\@m from kernel will fail, as \sfcode`.=1006 (from amsgen)
    \let\normalsfcodes\frenchspacing
    \frenchspacing
\fi
\init@settings
\pagestyle{headings}
%
\if@bookmarks
    \csuse{econsocart@bookmarks@true}
\else
    \newwrite\@outlinefile
    \if@filesw\immediate\openout\@outlinefile=\jobname.out
        \immediate\closeout\@outlinefile
    \fi
\fi
%
\let\econsocart@setref\@setref
\ifecta@layout
    \let\econsocart@setref@textup\@firstofone
    \def\@setref#1#2#3{%
        \econsocart@setref@textup{\econsocart@setref{#1}{#2}{#3}}%
        }
\else
    \ifqe@layout
        \def\@setref#1#2#3{%
            \textup{\econsocart@setref{#1}{#2}{#3}}%
            }
    \fi
\fi
%
\if@xmlfmbm
    \def\xmlfirstpage#1{\gdef\@fp{#1}}
    \def\xmllastpage#1{\gdef\@lp{#1}}
    \renewenvironment{frontmatter}{}{}
    \def\title#1{%
        \bgroup
            \no@harm
            \xdef\@argi{#1}%
        \egroup
        \write@pdfinfo{\hy@title}{\@argi}%
        \write@pdfinfo{\hy@subject}{\@journal, \volume@label\space\@volume, 
            \issue@label\space\@issue, \thepubmonth, \the\@pubyear, \@fp-\@lp}%
        \ifecta@layout% there was no nor journalcopyrightline neither authorcopyrightline in ECTA
        \else
            \xdef\xml@authorcopyrightline{\noexpand\copyright\ \the\@pubyear\space 
                The Econometric Society}%
        \fi
        }%
\fi
% dirty trick...
\def\label@hyperref[#1]#2{% working backref for hyperlinks
    \protected@write\@auxout{}{\string\backrefcite{#1}{\thepage}}%
    \b@cite@color\hyper@linkstart{link}{#1.label}#2\hyper@linkend\e@cite@color
    }
%
\let\geqslant\geq
\let\leqslant\leq
% \frac, \cases, \(p)matrix arguments should be displaystyle 
% in displaystyle environments (as in ECTA)
\if@displaystyle@addons% todo: this one is redundant it duplicates amsmath env
    % original macros
    \let\teqe@orig@displaystyle\displaystyle
    \let\teqe@orig@frac\frac
    \let\teqe@orig@cases\cases
    \let\teqe@orig@matrix\matrix
    % display style addons (dsa) redefs
    \def\dsa@frac#1#2{\teqe@orig@frac{\teqe@orig@displaystyle #1}{\teqe@orig@displaystyle #2}}
    \def\dsa@cases#1{\left\{\,\vcenter{\normalbaselines\m@th
        \ialign{$\teqe@orig@displaystyle ##\hfil$&\quad{##}\hfil\crcr#1\crcr}}\right.}
    \def\dsa@matrix#1{%
        \null\,\vcenter{%
            \normalbaselines\m@th
            \ialign{%
                \hfil$\teqe@orig@displaystyle ##$\hfil&&\quad\hfil
                $\teqe@orig@displaystyle ##$\hfil\crcr
                \mathstrut\crcr\noalign{\kern-\baselineskip}%
                #1\crcr\mathstrut\crcr\noalign{\kern-\baselineskip}%
                }%
            }\,
        }
    % macro to activate dsa
    \def\displaystyle@addons{%
        \let\frac\dsa@frac
        \let\cases\dsa@cases
        \let\matrix\dsa@matrix% pmatrix comes from matrix
    }
    % dsa activating
    \everydisplay{\displaystyle@addons}
    \def\displaystyle{\displaystyle@addons\teqe@orig@displaystyle}
\fi
% macros for XML
\let\xmlstring\@gobble
\let\noxml\@firstofone
\def\inlinefig{\ignorespaces}
\newenvironment{displayfig}{\par}{\par}
\newenvironment{sgmlfig}{\ignorespaces}{}
\def\floatanchor#1{}
\csuse{econsocart@xml@settings}
%
\endinput
%%
%% End of file `econsocart.cls'
