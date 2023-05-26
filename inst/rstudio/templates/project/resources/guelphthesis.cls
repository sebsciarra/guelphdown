%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doctoral/Master's Thesis
% Class File
% Version 1 (2022/10/11)
%
% Note:
% This class file defines the structure and design of the template file (template.tex).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------
%Class definition
%required to create a class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guelphthesis}[2022/10/11] %info in square brackets specifies release date

\providecommand{\baseclass}{book} %define \baseclass command

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax
\LoadClass{\baseclass}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage{xurl} %ensures urls do not go outside page margins
\RequirePackage{titlecaps} %capitalizes first letter of words (needed to toc entries when using \addcontentsline)
\RequirePackage{titlesec}
\RequirePackage{fancyhdr} %needed for header and footer formatting
\RequirePackage{etoolbox}
\RequirePackage{multicol} %needed for multicolumn layout in abstract papge
\RequirePackage[]{footmisc}  %removes indentation in footnotes
\RequirePackage{soul}

\RequirePackage[labelfont = {bf, up}]{caption}
\RequirePackage[flushleft]{threeparttable}
\RequirePackage{anyfontsize} %needed for tables to take on Helvetica font
\RequirePackage{textcomp} %for copyright symbol on title page
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage[section]{placeins}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{pdflscape}
\RequirePackage{tabu}
\RequirePackage[normalem]{ulem}
\RequirePackage{amsthm}
\RequirePackage{amsmath} %needed for argmax
\RequirePackage{bm}  %thicker bold in math
\RequirePackage{upgreek}  %required for non-italic greek letters
\RequirePackage{longtable,booktabs,setspace}
\RequirePackage{xargs} %needed to create environments with multiple optional arguments (e.g., apaFigure)
\RequirePackage{enumitem} %needed to remove spacing between list items
\RequirePackage{geometry}
\RequirePackage[absolute]{textpos} %allows everything below title on titlepage to be positioned regardless of how long the title is
\RequirePackage{xparse}
\RequirePackage{fvextra}
\RequirePackage{framed}
\RequirePackage{float} %cannot use floatrow when using caption (or else formatting of figures and tables will be messed up)
\RequirePackage{pdflscape}
\RequirePackage{graphicx}
\RequirePackage{everypage}

\setlist{nolistsep} %remove spacings between list items
\counterwithout*{footnote}{chapter} %stops footnote counter from resetting in new chapters
%place footnoterule definition into  new command, then modify spacing between footnoterule and footnotetext with \vskip10pt
\let\newfootnoterule\footnoterule
\def\footnoterule{\newfootnoterule \vskip10pt}



%----------------------------------------------------------------------------------------
%	Variable declarations
%----------------------------------------------------------------------------------------
%allows linespacing to be specified using YAML of linespacing
\newcommand{\setFrontmatterLinespacing}[1]{
    \setstretch{#1}
}

\def\degree#1{\gdef \@degree{#1}}
\def\year#1{\gdef \@year{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\def\institution#1{\gdef \@institution{#1}}
\def\@institution{\@latex@warning@no@line{No \noexpand\institution given}}
\def\department#1{\gdef \@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\advisor#1{\gdef \@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}


\def\specialization#1{\gdef \@specialization{#1} \@specializationtrue}
\global\let\@specialization\@empty
\newif\if@specialization
\@specializationfalse


\def\altadvisor#1{\gdef \@altadvisor{#1} \@altadvisortrue}
\global\let\@altadvisor\@empty
\newif\if@altadvisor
\@altadvisorfalse

\def\field#1{\gdef \@field{#1} \@fieldtrue}
\global\let\@field\@empty
\newif\if@field
\@fieldfalse

%----------------------------------------------------------------------------------------
%	Commands
%----------------------------------------------------------------------------------------

\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\linespacing}[1]{\def \@linespacing{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Acknowledgements}[1]{\def\@Acknowledgements{#1}}
\newcommand{\Dedication}[1]{\def\@Dedication{#1}}
\newcommand{\Preface}[1]{\def\@Preface{#1}}



%----------------------------------------------------------------------------------------
% Header level formatting
%----------------------------------------------------------------------------------------
%follows heading format specified in ETD_template_monograph; note that formatting has been done until Heading 6 style
%(to add more heading styles, see https://tex.stackexchange.com/questions/60209/how-to-add-an-extra-level-of-sections-with-headings-below-subsubsection)

\renewcommand*{\@seccntformat}[1]{\csname the#1\endcsname\hspace{0.3cm}} %sets spacing between section number and section title

%section (heading level 1 from Word)
\renewcommand\chapter{
 \@startsection{chapter}
 {0} %level
 {0cm}%indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{16pt}{16pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}


%section (heading level 2 from Word)
\renewcommand\section{
 \@startsection{section}
 {1} %level
 {0cm}%indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{14pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%subsection (heading level 3 from Word)
\renewcommand\subsection{
 \@startsection{subsection}
 {2} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%subsubsection (heading level 4 from Word)
\renewcommand\subsubsection{
 \@startsection{subsubsection}
 {3} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%para (heading level 5 from Word)
\renewcommand\paragraph{
 \@startsection{paragraph}
 {4} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}


%subparagraph (heading level 6 from Word)
%%command is redefined so that built-in defaults can be reset (e.g., indentation, vertical spacing after text + heading).
\renewcommand\subparagraph{
 \@startsection{subparagraph}
 {5} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14.6pt}\selectfont}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

%command called at beginning of document
\newcommand{\setGeometry}{
\geometry{
	paper=a4paper, % Default paper size, change to "letterpaper" for US Letter (you'll need to adjust margins after)
	inner=2.54cm, %left
	outer=2.54cm, %right
	top=2.54cm,
	bottom=3.54cm,
	headheight=0cm, % Header height
	headsep=1.252cm, % Header separation
	foot = 0.75cm, %space between text and page number in bottom
	footskip = 1cm,  %space between footnote and page number
	footnotesep = 1cm
}
}

\setGeometry{} %set geometry in here (in preamble) so that it can be restored in document when needed


%----------------------------------------------------------------------------------------
%	TITLEPAGE
%----------------------------------------------------------------------------------------

\renewcommand{\maketitle}{%

  \begin{titlepage}
  \newgeometry{top = 2.52cm, bottom = 2.52cm, right = 2.52cm,left = 2.52cm}

  \begin{center}

     \vspace*{3cm}
     \setstretch{1.25}
        {\fontsize{14pt}{14pt}\selectfont\textbf{\@title}}
    \vspace{2cm}

      \setstretch{2}

      by \\
      \@author
   \vspace{2cm}

    \setstretch{1.25}

    A Thesis \\
    presented to \\
    The \@institution \\

  \vspace{2cm}

     \setstretch{1}
    In partial fulfilment of requirements \\
    for the degree of
    \\
     \setstretch{1.5}
   \@degree \\
   in \\
   \@department \\

   %optional field and specialization entreies
  \if@field in the field of \@field \\ \fi
   \if@specialization (Specialization in \@specialization) \\ \fi


  %has to be absolutely positioned at the bottom of the page so that longer titles do not cause it to go to the next page
  %block width just has to be wide enough to fit contents on each line
  %to position textblock absolutely,  it is defined with respect to a refrence point of the middle of the page (i.e., [0.5, 0.5])
  \setstretch{2}
  \begin{textblock*}{10cm}[0.5, 0.5](10.5cm, 26.5cm) % {block width} (coords)(⟨hpos⟩,⟨vpos⟩)
      Guelph, Ontario, Canada \\
  \textcopyright\hspace{0.25em}\@author, \@date
  \end{textblock*}

 \end{center}
 \restoregeometry  %changes geometry back to what was defined
  \end{titlepage}
}


%----------------------------------------------------------------------------------------
%	Abstract
%----------------------------------------------------------------------------------------
\newenvironment{abstract}[2]{%
 %\cleardoublepage
 \phantomsection
   \clearpage
  \pagestyle{empty} % remove page numbering on all pages of the abstract
  \thispagestyle{empty} % remove page numbering on the first page of the abstract

 \addcontentsline{toc}{chapter}{\titlecap{Abstract}}  %adds abstract to toc
  \begin{center}

  {\fontsize{14}{14}\textbf{\selectfont ABSTRACT}}

   \vspace{1.5cm}

	  {\normalsize \MakeUppercase{\@title}} % University name in capitals

	   \vspace{1cm}

  \end{center}


    \setlength{\columnsep}{1.1cm} %sets spacing between columns of text
    \setstretch{1.5}
	  \begin{multicols}{2}
	  \raggedright

	  \@author \\
	  \@institution, \@year \\
	  \columnbreak

    Advisor(s): \\
	  \@advisor
	  \if@altadvisor \\ \@altadvisor  \fi

    \end{multicols}

     \setFrontmatterLinespacing{#1}

    \vspace{0.5cm}

    #2  %prints abstract
     \clearpage % add \clearpage to ensure that subsequent pages of the abstract also have no page numbering
      \pagestyle{empty} %
}{%
  \clearpage
  % ... your existing code ...
}


%----------------------------------------------------------------------------------------
%	Preamble command (for acknowledgements and dedication)
%----------------------------------------------------------------------------------------
\newenvironment{preambleItem}[3]{  %{linespacing}{title}{contents}

  \setFrontmatterLinespacing{#1}

  \begin{center}
     \fontsize{14}{14}{\textbf{\MakeUppercase{#2}}}
  \end{center}

  %settings needed for text
  \setlength{\parindent}{1cm} %paragraph indentation
  \phantomsection
  \addcontentsline{toc}{chapter}{\titlecap{#2}}
  \vspace{20pt}

 #3
}

%newpages after end of each preamble entry
\AfterEndEnvironment{preambleItem}{\newpage}
\AfterEndEnvironment{abstract}{\newpage}

%----------------------------------------------------------------------------------------
%	Table formatting
%----------------------------------------------------------------------------------------
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareCaptionFont{CaptionFont}{\fontfamily{phv}} %sets caption font to sans serif font of Helvetica (used in Tables and Figures)
\DeclareCaptionFont{titleSize}{\fontsize{11pt}{13.2pt}\fontfamily{phv}\selectfont}
\DeclareCaptionLabelSeparator{captionSep}{\newline} %separates figure label and figure title with newlin
\DeclareCaptionLabelFormat{tableLabel}{Table \thetable}

\captionsetup[table]{labelformat = tableLabel, labelfont={CaptionFont, titleSize, bf}, textfont = {it, CaptionFont, titleSize}, labelsep = captionSep, justification= raggedright, singlelinecheck=off, skip = 0pt}

\AtBeginEnvironment{ThreePartTable}{\vspace{0.4cm}\par\setstretch{1.5}\fontfamily{phv}\fontsize{10.5pt}{12pt}\selectfont\relax}
\AtBeginEnvironment{TableNotes}{\setstretch{1.5}\fontfamily{phv}\fontsize{10pt}{12pt}\selectfont}
\AtBeginEnvironment{longtable}{\vspace{0.4cm}\par\setstretch{1.5}\fontfamily{phv}\fontsize{10.5pt}{12pt}\selectfont\relax} %table without figure notes

%set table line widths
\setlength\cmidrulewidth{1pt} %line thickness of lines within table and in multi-row headers
\setlength\lightrulewidth{1pt} %line thickness of bottom line in header

%----------------------------------------------------------------------------------------
%	Figure formatting
%----------------------------------------------------------------------------------------
%Figure settings
\DeclareCaptionLabelFormat{figureLabel}{Figure \thefigure}
\captionsetup[figure]{labelformat = figureLabel, labelfont={CaptionFont, titleSize, bf}, textfont = {it, CaptionFont, titleSize},  justification= raggedright, singlelinecheck=off, labelsep = captionSep, skip = 10pt}
\newcommand{\figurefootnote}{\raggedright\linespread{1.5}\fontfamily{phv}\fontsize{9.5pt}{11.4pt}\selectfont \textit{Note. }}
\newcommand{\emptyfootnote}{}

\raggedbottom

%format figures according to apa7
\NewDocumentEnvironment{apaFigure}{O{portrait} O{samepage} O{-0.4cm} m m m m m  O{track}} {

  \vspace{1cm}
  \def\pagelayout{#1}
  \def\ls{landscape}

  %print figure on new page if desired
  \def\np{#2}
  \def\npTarget{np}

  \ifx\np\npTarget
  \newpage
  \fi

  %footnote modification
  \def\ft{#8}
  \def\ftTarget{}

   %footnote modification
  \def\track{#9}
  \def\cpTarget{track}

  %%set distance between footnote text and bottom of figure
  \setlength{\intextsep}{#3}

  \ifx\pagelayout\ls

  \begin{landscape}
  \begin{figure}[H]
   \ifx\track\cpTarget
    \caption{#4}
  \else
   \caption[]{#4}
  \fi
  \label{fig:#5}
  \includegraphics[scale = #6, clip]{#7}
  \end{figure}

  %no footnote if empty
  \ifx\ft\ftTarget
  \empty
  \else
  \figurefootnote{#8}
  \fi

  \end{landscape}

  \else

  \begin{figure}[H]

  \ifx\track\cpTarget
    \caption{#4}
  \else
   \caption[]{#4}
  \fi

  \label{fig:#5}
  \includegraphics[scale = #6, clip]{#7}
  \end{figure}

  \ifx\ft\ftTarget
  \empty
  \else
  \figurefootnote{#8}
  \fi

  \vspace{0.4cm}

  \fi
}

%----------------------------------------------------------------------------------------
%	Code chunk formatting
%----------------------------------------------------------------------------------------
%https://stackoverflow.com/questions/50702942/does-rmarkdown-allow-captions-and-references-for-code-chunks
%syntax highlighting
\AtBeginEnvironment{Shaded}{
  \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\},  breaksymbol=}
  \definecolor{shadecolor}{rgb}{0.94, 0.97, 1.0} %background color for code chunks
}

%see https://gist.github.com/Manuel-S/f285795979f42f65a144bf87ac52013b for all possible syntax highlighting customizations
\AtBeginEnvironment{Highlighting}{
  \setstretch{1}\fontsize{10pt}{10pt}
  \renewcommand{\CommentTok}[1]{\textcolor[RGB]{94, 90, 90}{#1}}%#comment colour
  \renewcommand{\DocumentationTok}[1]{\textcolor[RGB]{94, 90, 90}{#1}} %multiline comments colour
  \renewcommand{\NormalTok}[1]{\textcolor[RGB]{0, 24, 45}{#1}} %variable name color
  \renewcommand{\OtherTok}[1]{\fontsize{8pt}{8pt}\textcolor[RGB]{0, 24, 45}{#1}}
  \renewcommand{\AttributeTok}[1]{\textcolor[RGB]{0, 24, 45}{#1}} %attribute color
  \renewcommand{\FunctionTok}[1]{\textcolor[RGB]{6, 120, 225}{#1}} %function names
  \renewcommand{\StringTok}[1]{\textcolor[RGB]{212, 93, 196}{#1}} %strings
  \renewcommand{\ConstantTok}[1]{\textcolor[RGB]{212, 93, 196}{#1}} %constants such as NA, NULL
}

%vertical space above and below chunk
\setlength{\topsep}{-20pt}
\AfterEndEnvironment{Shaded}{\vspace{20pt}}


\newfloat{chunk}{placement = t}{chk}
\captionsetup{options=chunk}
\renewcommand{\thechunk}{\theapp.\arabic{chunk}}
\DeclareCaptionLabelFormat{chunkLabel}{Code Block \thechunk}
\captionsetup[chunk]{labelformat = chunkLabel,  labelfont={CaptionFont, titleSize, bf}, textfont = {it, CaptionFont, titleSize}, labelsep = captionSep, justification= raggedright, singlelinecheck=off, skip = 30pt}

%restores paragraph indenting after using captionof for caption of code blocks
\edef\restoreparindent{\parindent = 1cm}
\restoreparindent

%----------------------------------------------------------------------------------------
%	Quote formatting, list formatting, etc.
%----------------------------------------------------------------------------------------
\AtBeginDocument{%
  \setlength{\parindent}{1cm} %indentation of first line of paragraphs (important to load indentfirst for first-paragraph indentation
  \frenchspacing %sets all spaces between sentences to one space
}


%necessary to define tighlist
\def\tightlist{}

%no hyphenation across pages
\brokenpenalty10000\relax
\AtBeginEnvironment{quote} {
  \vspace{20pt}
  \setstretch{1.25}
}

\AfterEndEnvironment{quote}{

%empty line to ensure paragaph indent after quote
}

\AfterEndEnvironment{example}{
  \vspace{30pt}
}

\AfterEndEnvironment{itemize}{

%empty line to ensure paragaph indent after itemize
}

\newcommand{\tabitem}{\textbullet\hspace{0.2cm}}

%page number location for landscape pages (see https://tex.stackexchange.com/questions/209685/landscape-mode-and-page-numbering/209692#209692)
%define command for landscape page number
\def\landscapePageNum{\fontsize{12pt}{12pt}\fontfamily{cmr}\selectfont\arabic{page}}

%$if(ArialFont)$
% \renewcommand\landscapePageNum{\fontsize{12pt}{12pt}\sffamily\selectfont\arabic{page}}
%$endif$

%add page number to bottom middle of page in landscape pages
\newlength{\hfoot}
\newlength{\vfoot}
\AddEverypageHook{\ifdim\textwidth=\linewidth\relax
\else\setlength{\hfoot}{-\topmargin}%
\addtolength{\hfoot}{-\headheight}%
\addtolength{\hfoot}{-\headsep}%
\addtolength{\hfoot}{-.5\linewidth}%
\ifodd\value{page}\setlength{\vfoot}{\oddsidemargin}%
\else\setlength{\vfoot}{\evensidemargin}\fi%
\addtolength{\vfoot}{\textheight}%
\addtolength{\vfoot}{\footskip}%
\raisebox{\hfoot}[0pt][0pt]{\rlap{\hspace{\vfoot}\rotatebox[origin=cB]{90}{\landscapePageNum}}}\fi}%

%redefine landscape to remove page numbering
\let\oldlandscape\landscape
\let\endoldlandscape\endlandscape
\renewenvironment{landscape}{
  \oldlandscape
  \thispagestyle{empty}
}{
\thispagestyle{empty}
  \endoldlandscape
}


%remove page number location from landsape
\AtBeginEnvironment{ThreePartTable}{
\pagestyle{empty}
}










