% vi: set syntax=tex:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jeanmichelcv}[2016/04/03 Le CV qui est plus beau que ta maman]

\LoadClass{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[utf8]{inputenc}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[top=2.5cm, bottom=1.1cm, left=2cm, right=2cm]{geometry}
\usepackage{titlesec}
\usepackage{tabularx}
\usepackage{array}
\usepackage{fancyhdr}
\RequirePackage[quiet]{fontspec}
\usepackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{primary}   {HTML}{000000}
\definecolor{textcolor} {HTML}{333333}
\definecolor{fade}      {HTML}{777777}
\newcommand{\firstnamecolor}{\color{textcolor}}
\newcommand{\lastnamecolor}{\color{primary}}
\newcommand{\rulecolor}{\color{textcolor}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Font spec
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setmainfont{Roboto-Light}[
	Mapping=tex-text,
	Path=fonts/roboto/,
	BoldFont=Roboto-Regular,
	ItalicFont=Roboto-LightItalic,
	Extension=.ttf
]

\newfontface\headerfont{HapnaSlabSerif}[
    Mapping=tex-text,
    Path=fonts/hapnaslab/,
    BoldFont=HapnaSlabSerifDemiBold,
    Extension=.ttf
]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}
\color{textcolor}

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headsep}{5em}

\renewcommand*{\hrulefill}[2][0pt]{
    \leavevmode
    %\leaders \hrule height 1pt
    \leaders \hbox to 0.5pt{\rule[#1]{1pt}{#2}}
    \hfill \kern \z@
}

\renewcommand{\section}[1]{
    {\color{primary}
        \vspace*{1em} ~\\
        \noindent {\headerfont\bfseries\Large #1}
    }
    {\rulecolor
        \hrulefill[0.3em]{0.25em}
    }
    \vspace*{1em} ~\\
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\firstname} [1]{\def\@firstname{#1}}
\newcommand{\lastname}  [1]{\def\@lastname{#1}}
\newcommand{\name}      [2]{\def\@firstname{#1}\def\@lastname{#2}}

\renewcommand{\title}[1]{\def\@title{#1}}

\newcommand{\address}[1]{\def\@address{#1}}

\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

\newcommand{\makecvheader}[0]{
    \lhead{
        {\Huge\headerfont {\firstnamecolor\@firstname}{\lastnamecolor\textbf{\@lastname} } }  \\
        \vspace{0.5em}
        \hspace{0.1em}\color{textcolor}\headerfont\large\@title
    }
    \rhead{\color{fade}\small\@phone \\ \@email \\ \@extrainfo}
}

%%%% Cv entries

\newlength{\datewidth}
\setlength{\datewidth}{3cm}

\renewcommand{\arraystretch}{1.5}

\newenvironment{cventrylist}{
    \tabularx{\textwidth}{>{\raggedleft\arraybackslash}b{\datewidth} X}
}{
    \endtabularx
}
% \cventry{date}{title}{location}{description}{content}
\newcommand{\cventry}[5]{
    {\color{fade}\small #1} & {
    \textbf{#2}
    \ifthenelse{\equal{#3}{}}{}{, \textit{#3}}%
    \ifthenelse{\equal{#4}{}}{}{, #4}%
    \ifthenelse{\equal{#5}{}}{}{\newline \small{#5}}%
    } \\
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{coloredrules}{
    \renewcommand{\rulecolor}{\color{primary}}
}
\DeclareOption{coloredname}{
    \renewcommand{\firstnamecolor}{\color{primary}}
}
\DeclareOption{blue}{
    \definecolor{primary}{HTML}{4B84CC}
}
\DeclareOption{green}{
    \definecolor{primary}{HTML}{4EC766}
}
\DeclareOption{orange}{
    \definecolor{primary}{HTML}{FA8507}
}
\DeclareOption{black}{
    \definecolor{primary}{HTML}{222222}
}

% Default Options
\ExecuteOptions{blue}

\ProcessOptions\relax
