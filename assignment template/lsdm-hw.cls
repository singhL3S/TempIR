%
% Class for typesetting homework and  solutions for LSDM
% Written by Avishek Anand
%
% Important information:
%   - Do not forget to call \hwname and \hwdue.
%

% Identify our package.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lsdm-hw}[2016/11/07 Temporal IR Assignments]

% We base our class on article.
\LoadClass[a4paper,11pt]{article}

% The commands below are basically equivalent to calling
% \usepackage{...} inside the document.
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{xspace}
\RequirePackage[top=3cm,bottom=4cm,left=25mm,right=25mm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{tikz}
\RequirePackage{subfig}
\RequirePackage{bm}

\usetikzlibrary{arrows,positioning,shapes,shadows}

%If option solution is used, then the solutions are shown.
\newcommand{\hwsolution}[1]{}
\newcommand{\hwhandoutonly}[1]{#1}
\DeclareOption{solution}{
  \renewcommand{\hwsolution}[1]{\par \textbf{Solution:} #1}
  \renewcommand{\hwhandoutonly}[1]{}
}

% This is needed for \DeclareOption to work.
\ProcessOptions

\newcommand{\hwsec}[1]{{\large \textsc{#1}}\vspace{2ex}\\}

% Declare the problem counter and an environment for problems.
\newcounter{QProblemCounter}
\setcounter{QProblemCounter}{1}
\newenvironment{hwproblem}[1][]
{{\textbf{Problem \arabic{QProblemCounter}\stepcounter{QProblemCounter}. #1}}}
{\vspace{1cm}}

% When the document calls \hwname or \hwdue it defines the commands
% \@hwname and \@hwdue. We use the in the header. This is basically
% the same as title in article class.
\newcommand\hwname[1]{\renewcommand\@hwname{#1}}
\newcommand\@hwname{\ClassError{No hwname given}}
\newcommand\hwdue[1]{\renewcommand\@hwdue{#1}}
\newcommand\@hwdue{\ClassError{No hwdue given}}

% Here go the math abbreviations
\newcommand{\E}{\mathbf{E}}
\newcommand{\Var}{\mathbf{Var}}
\newcommand{\e}{\mathrm{e}}
\newcommand{\probdf}{\textsc{pdf}\xspace}
\newcommand{\cdf}{\textsc{cdf}\xspace}
\newcommand{\iid}{\textsc{iid}\xspace}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\indep}{\,\bot\,}
\newcommand{\ddx}[1]{\frac{\mathrm{d}}{{\mathrm{d}#1}}}
\newcommand{\matr}[1]{\ensuremath{\bm{#1}}}
\renewcommand{\vec}[1]{\ensuremath{\bm{#1}}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}


% No indentation at the beginning of a paragraph.
\setlength{\parindent}{0pt}

% Setup the header with fancyhdr
\renewcommand{\headrulewidth}{0.6pt}
\lhead{
  \textsc{L3S Research Center}\\
  \textsc{Temporal Information Retrieval, WiSe 2016-17}\\
  \textsc{Dr.~Avishek Anand}\\
  \textsc{\@hwname, due: {\bf \@hwdue}}
}
\rhead{
 \includegraphics[height=20mm]{logo/l3s_logo.pdf}
  \vfill
}
\pagestyle{fancy}

\headheight=61pt
\footskip=10pt

% Standard text at the beginning of each homework.
\newcommand{\hwintro}{
\hwhandoutonly\emph{Please complete the programming assignment using Java. If you are extremely unfamiliar with Java you may use another language that has a Lucene port. The evaluation script will be in Java and requires you to have the latest JVM installed.
}
\vspace{3ex}
}



% Note.
% Taken from blog.karssen.org/2009/09/14/using-tikz-to-generate-an-abstract-box-in-latex
% TODO: there is too much space between the box and the prevoius paragraph.
\colorlet{notecolor}{blue!60!black}
\newcommand{\notebox}[2][fill=white]{
  \textcolor{notecolor}{\begin{center}
      \begin{tikzpicture}
        \node[draw=notecolor, fill=white, rectangle, 
          inner sep=10pt, style=rounded corners, drop shadow={fill=notecolor,
          opacity=1}, #1] (box)
          {\begin{minipage}{0.90\linewidth} \bf #2 \end{minipage}};
        \node[fill=white, right=10pt] at (box.north west) {\bf \scshape Note};
      \end{tikzpicture}
    \end{center}}
  }
