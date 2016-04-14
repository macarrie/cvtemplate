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
\usepackage[quiet]{fontspec}
\usepackage{ifthen}
\usepackage{fontawesome}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{textcolor} {HTML}{333333}
\definecolor{fade}      {HTML}{777777}
\definecolor{blue}      {HTML}{4B84CC}
\definecolor{green}     {HTML}{4BCC53}
\definecolor{orange}    {HTML}{FA8507}
\definecolor{black}     {HTML}{222222}
\definecolor{pink}      {HTML}{CC4BC4}
\definecolor{red}       {HTML}{C24242}
\definecolor{lightblue} {HTML}{33DECD}
\newcommand{\primarycolor}{\color{black}}
\newcommand{\firstnamecolor}{\primarycolor}
\newcommand{\lastnamecolor}{\primarycolor}
\newcommand{\rulecolor}{\color{textcolor}}
\newcommand{\sectioncolor}{\primarycolor}


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
    \leaders \hbox to 0.5pt{\rule[#1]{1pt}{#2}}
    \hfill \kern \z@
}

\renewcommand{\section}[1]{
    {\sectioncolor
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
\newcommand*{\website}[1]{\def\@website{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

%%% Icons
\newcommand{\addresssymbol}  {\hspace{-0.3cm}\faMapMarker}
\newcommand{\phonesymbol}    {\hspace{-0.3cm}\faPhone}
\newcommand{\emailsymbol}    {\hspace{-0.3cm}\faEnvelopeO}
\newcommand{\websitesymbol}  {\hspace{-0.3cm}\faGlobe}
\newcommand{\githubsymbol}   {\hspace{-0.3cm}\faGithub}
\newcommand{\linkedinsymbol} {\hspace{-0.3cm}\faLinkedin}
\newcommand{\twittersymbol}  {\hspace{-0.3cm}\faTwitter}
\newcommand{\extrasymbol}    {\hspace{-0.3cm}\faEllipsisH}

\title{}
\address{}
\phone{}
\email{}
\website{}
\github{}
\linkedin{}
\twitter{}
\extrainfo{}

\newcommand{\makecvheader}[0]{
    \lhead{
        \parbox[c]{0.5\textwidth}{\centering
            {\Huge\headerfont {\firstnamecolor\@firstname}{\lastnamecolor\textbf{\@lastname} } }  \\
            \vspace*{0.5em}
            \color{textcolor}\headerfont\large\@title
        }
    }
    \rhead{\small\color{fade}
        \renewcommand{\arraystretch}{1.1}
        \begin{tabularx}{0.5\textwidth}{>{\raggedleft}X c}
            \ifthenelse{\equal{\@address}{}}{}  {\@address      & {\addresssymbol}\\}
            \ifthenelse{\equal{\@phone}{}}{}    {\@phone        & {\phonesymbol}\\}
            \ifthenelse{\equal{\@email}{}}{}    {\@email        & {\footnotesize\emailsymbol}\\}
            \ifthenelse{\equal{\@website}{}}{}  {\@website      & {\websitesymbol}\\}
            \ifthenelse{\equal{\@github}{}}{}   {\@github       & {\githubsymbol}\\}
            \ifthenelse{\equal{\@linkedin}{}}{} {\@linkedin     & {\linkedinsymbol}\\}
            \ifthenelse{\equal{\@twitter}{}}{}  {\@twitter      & {\twittersymbol}\\}
            \ifthenelse{\equal{\@extrainfo}{}}{}{\@extrainfo    & {\extrasymbol}\\}
        \end{tabularx}
    }
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
    \renewcommand{\rulecolor}{\sectioncolor}
}
\DeclareOption{coloredname}{
    \renewcommand{\firstnamecolor}{\primarycolor}
}
\DeclareOption{blue}{
    \renewcommand{\primarycolor}{\color{blue}}
}
\DeclareOption{green}{
    \renewcommand{\primarycolor}{\color{green}}
}
\DeclareOption{orange}{
    \renewcommand{\primarycolor}{\color{orange}}
}
\DeclareOption{black}{
    \renewcommand{\primarycolor}{\color{black}}
}
\DeclareOption{rainbow}{
    \newcounter{sectionColorCounter}
    \renewcommand{\sectioncolor}{
        \ifcase\value{sectionColorCounter}%
        \color{blue}\or%
        \color{red}\or%
        \color{green}\or%
        \color{orange}\or%
        \color{lightblue}\or%
        \color{pink}\else%
        \color{blue}\setcounter{sectionColorCounter}{0}\fi
        \stepcounter{sectionColorCounter}
    }
    \renewcommand{\rulecolor}{
        \addtocounter{sectionColorCounter}{-1}
        \sectioncolor
    }
}
\DeclareOption{blackrules}{
    \renewcommand{\rulecolor}{\color{textcolor}}
}
\DeclareOption{noicons}{
    \renewcommand{\addresssymbol}{\hspace{-0.5cm}~}
    \renewcommand{\phonesymbol}{\hspace{-0.5cm}~}
    \renewcommand{\emailsymbol}{\hspace{-0.5cm}~}
    \renewcommand{\websitesymbol}{\hspace{-0.5cm}~}
    \renewcommand{\githubsymbol}{\hspace{-0.5cm}~}
    \renewcommand{\linkedinsymbol}{\hspace{-0.5cm}~}
    \renewcommand{\twittersymbol}{\hspace{-0.5cm}~}
    \renewcommand{\extrasymbol}{\hspace{-0.5cm}~}
}

% Default Options
\ExecuteOptions{blue}

\ProcessOptions\relax
