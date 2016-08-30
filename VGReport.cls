%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for Vilsagame's report
%% Based on "Modèle rapport UAPV"
%% https://www.overleaf.com/latex/templates/modele-rapport-uapv/pdbgdpzsgwrt#.Vw1nzUe_y70
%%
%% Authors :
%%   - Vilsafur
%%
%% v1   - 04/2016 : First version
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% init class
    \NeedsTeXFormat{LaTeX2e}
    \ProvidesClass{VGReport}[2016/10/04 Report LaTeX class]
    \LoadClass[a4paper, 11pt, final]{report}                                        % based on the existing latex class

% various packages
    \RequirePackage{xspace}                                                         % used by babel
    \RequirePackageWithOptions{babel}                                               % necessary for language of documents
    \RequirePackage[utf8]{inputenc}                                                 % use source file containing diacritics
    \RequirePackage[T1]{fontenc}                                                    % select font encoding and allow hyphenation
    \RequirePackage[table]{xcolor}                                                  % put colors in the document
    \let\normalcolor\relax
    \RequirePackage{lmodern}                                                        % use specific fonts
    \RequirePackage{graphicx}                                                       % include pictures
    \RequirePackage{url}                                                            % display urls
    \RequirePackage{amsmath}                                                        % extended equations
    \RequirePackage{lastpage}                                                       % last page number
    \RequirePackage{textcomp}                                                       % degree character
    \RequirePackage{printlen}                                                       % display lengths
    \RequirePackage{xstring}                                                        % handle strings functions
    \RequirePackage{subfig}                                                         % subfloats (subfigures, subtables...)
    \RequirePackage{float}                                                          % custom floats environments
%    \RequirePackage{tocloft}                                                       % list of custom float objects
    \RequirePackage{setspace}
    \RequirePackage{tikz}
    \RequirePackage{authoraftertitle}                                               % access title and author names
    \RequirePackage{fancyhdr}                                                       % custom headers and footers
    \RequirePackage{soul}
    \RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}     % custom margins
    \RequirePackage[
            bookmarks=true, bookmarksnumbered=true, bookmarksopen=true, unicode=true, colorlinks=true, linktoc=all, linkcolor=primary3, citecolor=primary3, filecolor=primary3, urlcolor=primary3, pdfstartview=FitH]{hyperref}   % hyperlinks
    \RequirePackage{array}                                                          % handle arrays
    \RequirePackage{chngcntr}                                                       % hide the chapter number in section headings
    \RequirePackage{caption}                                                        % custom caption
    \RequirePackage{datetime}                                                       % custom date format
    \RequirePackage{enumitem}

% due to a warning
    \setlength{\headheight}{13.6pt}

% needed fo UAPV title page formating
    \sodef\ugg{}{.4em plus 1fill}{1em plus 2 fill}{2em plus 2fill minus.1em}

% thick lines in the tables
    \newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

% colors
    \definecolor{DarkColor}{gray}{0.75}
    \definecolor{LightColor}{gray}{0.9}
    \definecolor{LightGrey}{rgb}{0.96,0.96,0.96}
    \definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}

    \definecolor{primary1}{rgb}{0.36078, 0.58824, 0.19608}
    \definecolor{primary2}{rgb}{0.04706, 0.11373, 0.00000}
    \definecolor{primary3}{rgb}{0.17647, 0.35294, 0.05490}
    \definecolor{primary4}{rgb}{0.59216, 0.82745, 0.42353}
    \definecolor{primary5}{rgb}{0.78431, 0.95294, 0.66275}


% arrays and tables
    % Macro by A. Kassi
    % http://www.ukonline.be/programmation/latex/tutoriel/chapitre4/page2.php
    \makeatletter
        \def\hlinewd#1{
        \noalign{\ifnum0=`}\fi\hrule \@height #1
        \futurelet\reserved@a\@xhline}
    \makeatother
    % end macro

% NOTE: only (?) for the report class
    \counterwithout{section}{chapter}       % hide the chapter number in section headings

% change default font
    \renewcommand{\familydefault}{\sfdefault}

% custom captions
    \captionsetup{
        labelfont={color=primary3, bf, small}, % font(sf), color, bold, size of the caption label
        textfont={small},                               % font(sf) and size of the caption text itself
        labelsep=period,                                % separator between label and text
        margin=10mm                                     % left/right margins
    }

% custom equations
    \makeatletter                               % change equation numbers
    \def\tagform@#1{\maketag@@@{(\color{primary3}\textbf{#1}\normalcolor)\@@italiccorr}}
    \makeatother

% custom section headers
    \makeatletter
        \renewcommand{\section}{
            \@startsection{section}{1}{0pt}
            {-3.5ex plus -1ex minus -.2ex}
            {2.3ex plus.2ex}
            {\color{primary3}\normalfont\Large\bfseries}
        }
        \renewcommand\subsection{
            \@startsection{subsection}{2}{\z@}
                {-3.25ex\@plus -1ex \@minus -.2ex}
            {1.5ex \@plus .2ex}
            {\color{primary3}\normalfont\large\bfseries}
        }
        \renewcommand\subsubsection{
                \@startsection{subsubsection}{3}{\z@}
                {-3.25ex\@plus -1ex \@minus -.2ex}
                {1.5ex \@plus .2ex}
                {\color{primary3}\normalfont\normalsize\bfseries}
        }
        \renewcommand\paragraph{
                \@startsection{paragraph}{4}{\z@}
                {-3.25ex\@plus -1ex \@minus -.2ex}
                {-1em}
                {\color{primary3}\normalfont\normalsize}
        }
        \renewcommand\subparagraph{
                \@startsection{subparagraph}{5}{\z@}
                {-3.25ex\@plus -1ex \@minus -.2ex}
                {-1em}
                {\color{primary3}\normalfont\normalsize}
        }
    \makeatother
    \setcounter{secnumdepth}{5}     % number subsubsections
    \setcounter{tocdepth}{5}            % and include them in the TOC

% title page
    \renewcommand{\maketitle}{
        % setup PDF doc info
        \hypersetup{
            pdftitle={\MyTitle},%
            pdfauthor={\MyAuthor},%
        }

        % custom headers and footers
        \pagestyle{fancy}
        \fancyhf{}
        \renewcommand{\headrulewidth}{0.4pt}
        \renewcommand{\footrulewidth}{0.4pt}
        \cfoot{\thepage\ / \pageref*{LastPage}}
        \chead{\MyTitle}

        % draw title page
        \phantomsection
        \begin{titlepage}
            \begin{tikzpicture}[remember picture,overlay]
                % vertical lines
                \node at (current page.south west)
                {   \begin{tikzpicture}[remember picture,overlay]
                        \fill[fill=LightGrey]  (0cm,21.2cm) rectangle(21cm,29.7cm);
                        \fill[fill=DarkGrey] (0cm,0cm) rectangle(21cm,24.0cm);
                        \fill[fill=primary1] (1cm,0cm) rectangle(5.2cm,24.0cm);
                        \pgftext[x=1cm,y=24.8cm,bottom,left]{\includegraphics[width=4.2cm]{picts/logo.png}};
                        \pgftext[x=1.1cm,y=23.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{ptm}\selectfont{}\textcolor{primary5}{\makebox[6.7cm][l]{\ugg{\textbf{Vilsagame}}}}}}};
                        \pgftext[x=1.1cm,y=22.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{ptm}\selectfont{}\textcolor{primary4}{\makebox[6.7cm][l]{\ugg{\textbf{}}}}}}};
                        \pgftext[x=1.1cm,y=22.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\textcolor{primary4}{\makebox[6.7cm][l]{\ugg{\textbf{THE FUTURE IS}}}}}}};
                        \pgftext[x=1.1cm,y=21.4cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\textcolor{primary4}{\makebox[6.7cm][l]{\ugg{\textbf{IN OPEN SOURCE}}}}}}};
%                       \pgftext[x=3.5cm,y=16.2cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{}}}};
                        \pgftext[x=3.5cm,y=18.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{\textcolor{primary5}{>{}>{}>}\hspace{0.7cm}\textcolor{primary1}{\parbox{19cm}{\raggedright\MyTitle}}}}}};
                        \pgftext[x=5.5cm,y=17.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{20}{20}{\fontfamily{phv}\selectfont{}\textcolor{primary1}{\MyAuthor}}}};
                        \pgftext[x=5.5cm,y=16.1cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textcolor{primary1}{\textbf{\today}}}}};
                    \end{tikzpicture}
                };
            \end{tikzpicture}
        \end{titlepage}

        \setcounter{page}{2}    % set the second page... to number 2
        \thispagestyle{fancy}   % force header/footer
        \newpage
    }

% tables
    \newcommand{\MyToc}{
        \phantomsection
        \tableofcontents                            % insert TOC
        \thispagestyle{empty}                       % force header/footer
        \newpage
    }

% bibliography
    % receives the bibtex file
    \newcommand{\MyBibliography}[1]{
        % NOTE: for TexMaker it was necessary to reconfigure the bibtex target from "bibtex %.aux" to "bibtex %"
        \newpage
        \phantomsection
        \bibliographystyle{plainnat}
        \bibliography{#1}                           % bibtex file
        \thispagestyle{fancy}                       % force header/footer
    }