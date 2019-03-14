%
% acmsiggraph.cls
%
% version history
%
% - borrows *heavily* from Daniel Kartch's 'siggraph' class. 
% - also uses pieces of 'apalike.sty' and 'authordate1-4.cls'
% - modifications include adjustment of citation format to more closely
%   align with new (for SIGGRAPH 2002 conference and beyond) reference
%   and citation formatting requirements.
% - version 0.1 2001/06/01 Stephen Spencer (spencer@acm.org)
% - version 0.2 2001/10/15 Stephen Spencer
%   - the "\onlineid" variable works with the "review" mode, placing a
%     banner across the top of each page "Online Submission ID 'onlineid'
% - version 0.3 2002/01/11 Stephen Spencer
%   - disabled the cover page option.
% - version 0.4 2002/01/23 Stephen Spencer
%   - based on suggestions from James O'Brien, the following changes:
%     - correction if '\ifcamera' and '\ifcameraelse' commands
%     - page numbering in both review and preprint modes
%     have been made.
% - version 0.5 2005/01/22 Stephen Spencer
%   - removed the category markers
% - version 0.6 2006/12/15 Stephen Spencer
%   - tightened up space around section headings
% - version 0.7 2008/10/21 Stephen Spencer
%   - added 'annualconference' parameter for copyright space
%   - added line number support for 'review' mode
% - version 0.8 2011/03/02 Stephen Spencer (with Hugues Hoppe)
%   - removal of 'widereview' mode
%   - added hyperref
%   - added URL Links for paper DOI and author-provided content.
% - version 0.81 2012/01/03 Stephen Spencer
%   - bugfix: returned the "amsmath" package requirement, which
%     resolves the line-numbering issue (thank you, Sylvain Paris
%     and Hanspeter Pfister)
% - version 0.82 2012/01/05 Stephen Spencer
%   - bugfix: added ``breaklinks=true'' to hyperref setup
% - version 0.9  2013/12/06 Stephen Spencer
%   - removed "abstract" environment for copyright space
%   - renamed remaining environments to "tog" and "conference"
% - version 0.91
%   - removed the hyperlink icons
%   - added date to the external class name
%
%
% - version 0.92 2015/11/04 Boris Veytsman
%   - Added new copyright, conference info and doi commands
%
% ---------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{acmsiggraph}[2015/11/04 v0.92 ACM SIGGRAPH class]

% lots of options aren't allowed.

\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
\DeclareOption{14pt}{\OptionNotUsed}

% options that we DO want to set.

\newlength{\ACMpointsize}
\setlength{\ACMpointsize}{9pt}

% ``documentclass'' options.

\newif\if@ACMtog
\@ACMtogfalse
\DeclareOption{tog}{\@ACMtogtrue}

\newif\if@ACMconference
\@ACMconferencefalse
\DeclareOption{conference}{\@ACMconferencetrue}

\newif\if@ACMreview
\@ACMreviewfalse
\DeclareOption{review}{\@ACMreviewtrue}

\newif\if@ACMpreprint
\@ACMpreprintfalse
\DeclareOption{preprint}{\@ACMpreprinttrue}

% pass the options, and load the 'article' class, on which 'acmsiggraph' 
% is based.

\ProcessOptions\relax
\LoadClass[twocolumn,letterpaper]{article}

% required packages.

\RequirePackage{amsmath}
\RequirePackage{lineno}
\RequirePackage[scaled=.92]{helvet}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage[labelfont=bf,textfont=it]{caption}
\RequirePackage{parskip}

% define things.

\setlength{\textheight}{9.250in}
\setlength{\textwidth}{7.000in}
\setlength{\topmargin}{-0.700in}
\setlength{\oddsidemargin}{-0.250in}
\setlength{\evensidemargin}{-0.250in}
\setlength{\columnsep}{2pc}
\setlength{\headheight}{0.200in}
\setlength{\headsep}{0.250in}
\setlength{\footskip}{0.500in}

\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}


% in ``review'' mode, the ``\onlineid'' command passes the value given
% to the paper by the online submission system. This gets printed out 
% at the top of each page.

\newcommand{\TOGonlineid}[1]{\gdef\@ACMonlineid{#1}}
\newcommand{\@ACMreviewtext}{Online Submission ID: \@ACMonlineid}

% in ``preprint'' mode, the ``\TOGvolume'' and ``\TOGnumber'' commands 
% pass the volume and number of the TOG issue in which the paper will be
% published. This gets printed out at the top of each page.

\newcommand{\TOGvolume}[1]{\gdef\@ACMvolume{#1}}
\newcommand{\TOGnumber}[1]{\gdef\@ACMnumber{#1}}
\newcommand{\@ACMpreprinttext}{To appear in ACM TOG \@ACMvolume(\@ACMnumber).}

%%%

\newcommand{\ifreview}[1]{\if@ACMreview #1 \fi}
\newcommand{\ifreviewelse}[2]{\if@ACMreview #1 \else #2 \fi}

%%% 

\newcommand{\@ACMarticleDOI}{}	% of the form 1073204.1073261
\newcommand{\@ACMarticleDOIsuffix}{} % of the form 1073261

\def\@ACMgetDOIsuffix#1.#2\@nil{#2}

\newcommand{\TOGarticleDOI}[1]{%
  \renewcommand{\@ACMarticleDOI}{#1}
  \in@{.}{#1}% given DOI of the form 1073204.1073261, if there is a period, extract the second part
  \ifin@
    \renewcommand{\@ACMarticleDOIsuffix}{\@ACMgetDOIsuffix#1\@nil}
  \else
    \renewcommand{\@ACMarticleDOIsuffix}{#1}
  \fi
}

%%%

\newcommand{\pdfauthor}[1]{\gdef\@ACMpdfauthor{#1}}

% if we are in ``review'' or ``preprint'' modes, set up special headers 
% and footers for each page of the paper.

\renewcommand{\ps@plain}%
{%
    \renewcommand{\@oddhead}{}%
    \renewcommand{\@oddfoot}{}%

    \if@ACMpreprint%
      \renewcommand{\@oddhead}{\hfil\textit{\large\@ACMpreprinttext}\hfil}%
      \renewcommand{\@oddfoot}{\hfil\textrm{\thepage}\hfil}%
    \fi%

    \if@ACMreview%
      \renewcommand{\@oddhead}{\hfil\textit{\large\@ACMreviewtext}\hfil}%
      \renewcommand{\@oddfoot}{\hfil\textrm{\thepage}\hfil}%
    \fi%

    \renewcommand{\@evenhead}{\@oddhead}%
    \renewcommand{\@evenfoot}{\@oddfoot}%
}

\renewcommand{\ps@empty}%
{%
    \renewcommand{\@oddhead}{}%
    \renewcommand{\@oddfoot}{}%

    \if@ACMpreprint%
      \renewcommand{\@oddhead}{\hfil\textit{\large\@ACMpreprinttext}\hfil}%
      \renewcommand{\@oddfoot}{\hfil\textrm{\thepage}\hfil}%
    \fi%

    \if@ACMreview%
      \renewcommand{\@oddhead}{\hfil\textit{\large\@ACMreviewtext}\hfil}%
      \renewcommand{\@oddfoot}{\hfil\textrm{\thepage}\hfil}%
    \fi%

    \renewcommand{\@evenhead}{\@oddhead}%
    \renewcommand{\@evenfoot}{\@oddfoot}%
}

% no page numbers!

\pagestyle{plain}

% if we are in ``review'' mode, turn on line numbers.

\if@ACMreview%
  \linenumbers
\fi

% Nine-point type is the standard.

\newcommand{\@ACMsetninepoint}{
    \renewcommand\normalsize{%
        \@setfontsize\normalsize\@ixpt\@xpt
        \abovedisplayskip 9\p@ \@plus2\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus3\p@
        \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
        \belowdisplayskip \abovedisplayskip
        \let\@listi\@listI}
    \renewcommand\small{%
        \@setfontsize\small\@viipt\@ixpt
        \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus2\p@
        \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
        \def\@listi{\leftmargin\leftmargini
                    \topsep 4\p@ \@plus2\p@ \@minus2\p@
                    \parsep 2\p@ \@plus\p@ \@minus\p@
                    \itemsep \parsep}%
        \belowdisplayskip \abovedisplayskip}
    \renewcommand\footnotesize{%
        \@setfontsize\footnotesize\@viiipt{9.5}%
        \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus\p@
        \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
        \def\@listi{\leftmargin\leftmargini
                    \topsep 3\p@ \@plus\p@ \@minus\p@
                    \parsep 2\p@ \@plus\p@ \@minus\p@
                    \itemsep \parsep}%
        \belowdisplayskip \abovedisplayskip}
    \renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
    \renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
    \renewcommand\large{\@setfontsize\large\@xpt\@xiipt}
    \renewcommand\Large{\@setfontsize\Large\@xiipt{14}}
    \renewcommand\LARGE{\@setfontsize\LARGE\@xivpt{18}}
    \renewcommand\huge{\@setfontsize\huge\@xviipt{22}}
    \renewcommand\Huge{\@setfontsize\Huge\@xxpt{25}}
    \selectfont
}

\@ACMsetninepoint

% Section and subsection environment tweaks.

\newcommand{\@ACMsectionfont}{}
\newcommand{\sectionfont}[1]{\renewcommand{\@ACMsectionfont}{#1}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                {-1.0ex}%
                {1.0ex}%
                {\reset@font\Large\sffamily\bfseries\@ACMsectionfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                {-1.0ex}%
                {1.0ex}%
                {\reset@font\large\sffamily\bfseries\@ACMsectionfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                {-1.0ex}%
                {1.0ex}%
                {\reset@font\normalsize\sffamily\bfseries\@ACMsectionfont}}

% Paragraph and subparagraph environment tweaks.

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                {2.05ex}%
                {-1em}%
                {\reset@font\normalsize\sffamily\bfseries\@ACMsectionfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                {3.25ex \@plus1ex \@minus .2ex}%
                {-1em}%
                {\reset@font\normalsize\sffamily\bfseries\@ACMsectionfont}}

% no labels in bibliography.

\def\@biblabel#1{}

% bibitems are flush left, with successive lines indented by 1em.

\newlength{\bibhang}
\setlength{\bibhang}{1em}

\def\thebibliography#1{%
  \section*{%
    \refname\@mkboth{\sl\uppercase{\refname}}{\sl\uppercase{\refname}}}
  \list{\relax}{\setlength{\labelsep}{0em}
                \setlength{\itemindent}{-\bibhang}
                \setlength{\leftmargin}{\bibhang}}
  \def\newblock{\hskip .11em plus .33em minus .07em}
  \sloppy\clubpenalty4000\widowpenalty4000
  \sfcode`\.=1000\relax}

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \def\@citea{}\@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{; }\@ifundefined
      {b@\@citeb}{{\bf ?}\@warning
      {Citation '\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}

\let\@internalcite\cite
\def\cite{\def\citename##1{##1}\@internalcite}
\def\shortcite{\def\citename##1{}\@internalcite}

% title stuff...

\newcommand{\@ACMempty}{}

\newcommand{\@ACMaffiliation}{}
\newcommand{\affiliation}[1]{\gdef\@ACMaffiliation{#1}}

\newcommand{\@ACMteaser}{}
\newcommand{\teaser}[1]{\gdef\@ACMteaser{#1}}

\newlength{\titlespace}
\setlength{\titlespace}{0.25in}

\newlength{\teaserspace}
\setlength{\teaserspace}{0.25in}

\if@ACMreview
    \renewcommand{\@maketitle}{%
        \begin{center}%
            \renewcommand{\thanks}[1]{}
            {\LARGE\sffamily\bfseries\@ACMsectionfont \@title \par}%
            \vspace{1\baselineskip}%
            \vspace{\titlespace}%
            \ifx\@ACMteaser\@ACMempty \else%
                \begingroup%
                    \def\@captype{figure}%
                    \@ACMteaser%
                \endgroup\par%
                \vspace{\teaserspace}%
            \fi%
        \end{center} \par%
    }
\else
    \renewcommand{\@maketitle}{%
        \begin{center}%
            {\LARGE\sffamily\bfseries\@ACMsectionfont \@title \par}%
            \vspace{1\baselineskip}%
            \large
            \begin{tabular}[t]{c}%
                \@author
            \end{tabular}\par%
            \ifx\@ACMaffiliation\@ACMempty \else%
                \vspace{0.5\baselineskip}%
                \@ACMaffiliation\par%
            \fi%
            \vspace{\titlespace}%
            \ifx\@ACMteaser\@ACMempty \else%
                \begingroup%
                    \def\@captype{figure}%
                    \@ACMteaser%
                \endgroup\par%
                \vspace{\teaserspace}%
            \fi%
        \end{center} \par%
    }
\fi

\let\@ACMorigmaketitle\maketitle
\let\@ACMorigand\and
\renewcommand{\maketitle}{%
    \let\@ACMtitle\@title%
    \let\@ACMauthor\@author%
    \@ACMorigmaketitle%
    \thispagestyle{empty}%
}

% Abstract stuff...

\newtoks\@ACMabs
\if@ACMreview
    \long\def\@ACMadd#1{\global\@ACMabs\expandafter{\the\@ACMabs#1}}
    \long\def\@ACMcollect{%
        \global\@ACMabs{}%
        \let\abstract\@ACM@collect
        \abstract
    }
    \long\def\@ACM@collect#1\end#2{%
        \def\@tempa{#2}%
        \ifx\@tempa\@currenvir
            \@ACMadd{#1}%
            \edef\abstract{\noexpand\end{\@tempa}}%
        \else
            \@ACMadd{#1\end{#2}}%
        \fi
        \abstract
    }
    \newcommand{\@ACMmodify}{%
        \let\@ACMorigabs\abstract%
        \let\@ACMorigendabs\endabstract%
        \renewenvironment{abstract}%
            {\@ACMcollect}%
            {\begingroup
                \let\abstract\@ACMorigabs
                \let\endabstract\@ACMorigendabs
                \begin{abstract} \the\@ACMabs \end{abstract}
            \endgroup}%
    }
    \AtBeginDocument{\@ACMmodify}
\fi

%%% Keyword list.

\newcommand{\@ACMkeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@ACMkeywords}{#1}}

\newcommand{\keywordlist}{%
    \vspace{0.5\baselineskip}%
    \par\noindent \textbf{Keywords: } \@ACMkeywords%
}

%%% Computing Review (CR) categories.

\newenvironment{CRcatlist}{%
    \vspace{0.5\baselineskip}%
    \par\noindent \textbf{CR Categories: }%
}{}

\newcommand{\CRcat}[4]{%
    #1 [#2]%
    \ifx#3\@ACMempty \else : #3\fi%
    \ifx#4\@ACMempty \else ---#4\fi%
}

% Support for CCSXML file
\RequirePackage{comment}
\excludecomment{CCSXML}


% New concepts scheme
\let\@concepts\@empty
%
% The first argument is the significance, the
% second is the concept(s)
%
\newcommand\ccsdesc[2][100]{%
  \ccsdesc@parse#1~#2~}
%
% The parser of the expression Significance~General~Specific
%
\def\ccsdesc@parse#1~#2~#3~{%
  \expandafter\ifx\csname CCS@#2\endcsname\relax
    \expandafter\gdef\csname CCS@#2\endcsname{\textbullet\textbf{#2} $\to$ }%
  \g@addto@macro{\@concepts}{\csname CCS@#2\endcsname}\fi
  \expandafter\g@addto@macro\expandafter{\csname CCS@#2\endcsname}{%
    \ifnum#1>499\textbf{#3; }\else
    \ifnum#1>299\textit{#3; }\else
    #3; \fi\fi}}

\def\conceptlist{\textbf{Concepts:} \@concepts}


\def\conferenceinfo#1#2{\gdef\conf{#1}\gdef\confinfo{#2}}
\conferenceinfo{}{}
\def\doi#1{\def\@doi{#1}}
\doi{}
\def\isbn#1{\gdef\@isbn{#1}}
\isbn{}
\RequirePackage{url}
\urlstyle{rm}
\def\printdoi#1{\url{#1}}



\RequirePackage{acmcopyright}

\def\copyrightspace{}

\newcommand\printcopyright{%
  \renewcommand{\thefootnote}{}%
  \footnotetext[0]{%
\hspace*{-1.8em}%
  \@copyrightpermission
  \if@printcopyright
    \copyright\ \@acmYear\ \@copyrightowner\
  \fi
  \ifx\conf\@empty\else
  \\\conf, \confinfo\fi
  \ifx\@isbn\@empty\else
  \\ISBN: \@isbn\fi
  \ifx\@doi\@empty\else
  \\DOI: \printdoi{\@doi}\fi
}%
  \renewcommand{\thefootnote}{\arabic{footnote}}
}

\def\copyrightyear#1{\def\@acmYear{#1}}
\copyrightyear{\the\year}

%%% Icon(s) with hyperlinks.

%\newcommand{\@ACMurlWeb}{}
%\newcommand{\TOGprojectURL}[1]{\renewcommand{\@ACMurlWeb}{#1}}
%\newcommand{\@ACMurlVideo}{}
%\newcommand{\TOGvideoURL}[1]{\renewcommand{\@ACMurlVideo}{#1}}
%\newcommand{\@ACMurlData}{}
%\newcommand{\TOGdataURL}[1]{\renewcommand{\@ACMurlData}{#1}}
%\newcommand{\@ACMurlCode}{}
%\newcommand{\TOGcodeURL}[1]{\renewcommand{\@ACMurlCode}{#1}}

%\newcommand{\icon@DL}{\raisebox{-.02in}{\includegraphics[width=.13in]{icons/iconacm}}\hspace{.01in}DL}
%\newcommand{\icon@PDF}{\raisebox{-.02in}{\includegraphics[width=.11in]{icons/iconpdf}}\hspace{.015in}PDF}
%\newcommand{\icon@Web}{\raisebox{-.025in}{\includegraphics[width=.11in]{icons/iconweb}}\hspace{.01in}Web}
%\newcommand{\icon@Video}{\raisebox{-.01in}{\includegraphics[width=.11in]{icons/iconvideo}}\hspace{.007in}Video}
%\newcommand{\icon@Data}{\raisebox{-.01in}{\includegraphics[width=.10in]{icons/icondata}}\hspace{.015in}Data}
%\newcommand{\icon@Code}{\raisebox{-.005in}{\includegraphics[width=.10in]{icons/iconcode}}\hspace{.017in}Code}

%\newcommand{\TOGlinkslist}{%
%  \if@ACMtog
%  {%
%    \ifx\@ACMarticleDOI\@ACMempty%
%	  \ClassWarningNoLine{acmsiggraph}{Please set \noexpand\TOGarticleDOI.}%
%	\fi%
%    {\bf Links:}%
%    \sc%
%    \ifx\@ACMarticleDOI\@ACMempty\else%
%      \hspace{0.09in}\href{http://doi.acm.org/10.1145/\@ACMarticleDOI}{\icon@DL}%
%     \ifx\@ACMarticleDOIsuffix\@ACMempty\else%
%       \hspace{0.09in}\href{http://portal.acm.org/ft_gateway.cfm?id=\@ACMarticleDOIsuffix&type=pdf}{\icon@PDF}\fi%
%     \ifx\@ACMurlWeb\@ACMempty\else%
%       \hspace{0.09in}\href{\@ACMurlWeb}{\icon@Web}\fi%
%     \ifx\@ACMurlVideo\@ACMempty\else%
%       \hspace{0.09in}\href{\@ACMurlVideo}{\icon@Video}\fi%
%     \ifx\@ACMurlData\@ACMempty\else%
%       \hspace{0.09in}\href{\@ACMurlData}{\icon@Data}\fi%
%     \ifx\@ACMurlCode\@ACMempty\else%
%       \hspace{0.09in}\href{\@ACMurlCode}{\icon@Code}\fi%
%    \fi%
%  }%
%  \fi
%}

% Package hyperref should come late in class file to properly apply to any modified commands.
\RequirePackage{ifpdf}
\ifpdf
  \usepackage[pdftex,breaklinks,hyperfootnotes=false,bookmarks=false]{hyperref}
\else
  \usepackage[hyperfootnotes=false,bookmarks=false]{hyperref}
\fi
\hypersetup{
  colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,breaklinks=true
}

% remove newlines ('\\') from \title when assigning \pdftitle
\pdfstringdefDisableCommands{%
  % \let~\textasciitilde
  % \def\url{\pdfstringdefWarn\url}%
  % \let\textcolor\@gobble
  \let\\\@gobble
}

\AtBeginDocument{%
  \if@ACMreview%
  \hypersetup{
    pdfcreator={LaTeX acmsiggraph.cls (11/2015)},
    pdfkeywords={\@ACMkeywords},
    pdftitle={\@title},
  }%
  \else%
  \hypersetup{
    pdfcreator={LaTeX acmsiggraph.cls (11/2015)},
    pdfkeywords={\@ACMkeywords},
    pdftitle={\@title},
    pdfauthor={\@ACMpdfauthor},
  }%
  \fi
}

% fix for disappearing line numbers in paragraphs with equations
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
	\expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
	\expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
	\renewenvironment{#1}%
	{\linenomath\csname old#1\endcsname}%
	{\csname oldend#1\endcsname\endlinenomath}}%
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
	\patchAmsMathEnvironmentForLineno{#1}%
	\patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
	\patchBothAmsMathEnvironmentsForLineno{equation}%
	\patchBothAmsMathEnvironmentsForLineno{align}%
	\patchBothAmsMathEnvironmentsForLineno{flalign}%
	\patchBothAmsMathEnvironmentsForLineno{alignat}%
	\patchBothAmsMathEnvironmentsForLineno{gather}%
	\patchBothAmsMathEnvironmentsForLineno{multline}%
	\patchBothAmsMathEnvironmentsForLineno{eqnarray}%
}

%% end of file
\endinput
