\ProvidesClass{resume}

\LoadClass[10pt]{article}
% Depends on:
\usepackage{ifthen}
\usepackage{geometry}
\usepackage[usenames,dvipsnames]{color}
\usepackage{marvosym}
\usepackage{wasysym}
\usepackage{enumitem}
\usepackage{setspace}
\usepackage[pdftex]{graphicx}
\usepackage{hyperref}

% Optionally remove page numbers:
%\thispagestyle{empty}\pagestyle{empty}

% No indent and increased paragraph spacing
\setlength{\parindent}{0pt}

\pdfminorversion=5
\pdfcompresslevel=9
\pdfobjcompresslevel=2

% Configure margins:
\geometry{top=2.5cm,bottom=2.5cm,left=3.5cm,right=3.5cm}

% Commands
% - \cvtitle{Name}{ColorForName}{LiteralsOrRightText}{SpaceBelow} - Creates the CV title
\newcommand{\cvtitle}[4] {%
	{\LARGE\color{#2}\textsc{#1}}\hspace{\stretch{3}}{\large \textbf{#3}}\\[#4]}

% - \positionedbox{TextSide}{Width}{TextContent} - Creates a box of given width with text aligned as specified by 'TextSide' of given width. Note if you use box sizes which are less that the width of the page they can wrap together , ie 2 boxes of size 0.5\textwidth will sit side by side
\newcommand{\positionedbox}[3]{%
	\begin{minipage}{#2}
		\begin{flush#1}
			#3
		\end{flush#1}
	\end{minipage}}
	
% - \information{pieceofinfo}{pic/rightpic/space/none}{character} - Displays a piece of information pre/post-fixed with a 'character' symbol (pic), or leading space (space) or nothing (none).
% characters: phone = \Telefon, letter = \Letter, email = \MVAt, URL = \Flatsteel, twitter = $\mathcal{T}$
% NOTE: at the moment if you specify 'none' for the type, you still should put a non breaking space for 'character'
\newcommand{\information}[3]{
		\ifthenelse{\equal{#2}{pic}}
			{#3~ }
			{\ifthenelse{\equal{#2}{space}}
				{~ ~ }
				{}
			}
		#1\ifthenelse{\equal{#2}{rightpic}}
			{~ #3}
			{}
		}

% \cvheaderseperator{a}{b}{c}: Creates a horizontal rule separator where 'a' is the thickness, 'b' is the spacing above and 'c' is the spacing below.
\newcommand{\cvheaderseperator}[3]{\hspace{#2}\\\rule{\linewidth}{#1}\\[#3]}

% \cvskill{skill}{type}: Creates a 'skill' bullet. 'skill' is the actual skill text and 'type' is one of 'full', 'semi' or 'none' to indicate whether a full, half-full or empty bullet circle should be used. 
\newcommand{\cvskill}[2]{\hspace{4mm}%
	\ifthenelse{\equal{#2}{full}}%
		{\CIRCLE~ }%
		%else%
		{\ifthenelse{\equal{#2}{semi}}%
			{\LEFTcircle ~ }%
			{\Circle ~ }}#1\\}

% \cvsectiontitle{title}: Creates a section with the given title.
\newcommand{\cvsectiontitle}[1]{%
	\rule{\linewidth}{0.2mm}\\%
		{\large\indent\textsc{#1}}\\%
	\\[-6mm]\rule{\linewidth}{0.2mm}\\[2mm]%
	}

% \cvpub{Authors}{Title}{Date}{Journal/Conference}{Pages}: Create a publication entry
\newcommand{\cvpub}[5]{#1. (#3) ``#2'' \emph{#4}, pages #5} 

% \cvcompany{Name}{Position}{Date}{URL}: A new company in the experience section
\newcommand{\cvcompany}[4]{\textbf{\href{#4}{#1}}\hspace{\stretch{3}}{(#3)}\\\textit{#2}}

% \cvcert{Name}{Date}: A Certification entry
\newcommand{\cvcert}[2]{#1\hspace{\stretch{2}}{(#2)}}

% \cvsublevel{Text}: Create an indented item list
\newcommand{\cvsublevel}[1]{\begin{itemize}[leftmargin=0.5cm] #1\end{itemize}}

% \cvsubbullet{Text}: Create a buller in the sub level
\newcommand{\cvsubbullet}[1]{\vspace{-1mm}\item #1}

% Modify List enviroment
\renewcommand{\labelitemi}{\RIGHTarrow}
\renewcommand{\labelitemii}{$\bullet$}
\renewcommand{\labelitemiii}{\RIGHTarrow}
\renewcommand{\labelitemiv}{\RIGHTarrow}