# JeanMichelCV Template

## Dependencies

- LuaTex or XeTex (for custom font, installable via `texlive-luatex` or `texlive-xetex` packages)
- Packages:
    - `inputenc`
    - `xcolor`
    - `geometry`
    - `titlesec`
    - `tabularx`
    - `array`
    - `fancyhdr`
    - `fontspec`
    - `ifthen`
    - `fontawesome` (available in `texlive-fonts-extra`)

## Document class

Provides a `jeanmichelcv` documentclass

### Options

- `coloredrules`: Makes the titlerules colored
- `blackrules`: Makes the titlerules black
- `coloredname`: Makes the first name colored as well
- `blue`: Define blue as global color
- `orange`: Define orange as global color
- `black`: Define black as global color
- `rainbow`: Color is changed for each different section (blue, red, green, orange, lightblue and loop to blue)

### Default Options

If no options are passed, `blue` is used as default color.

## Commands

### Header

Contains fullname and contact informations.

- Fullname
```latex
\name{JeanMichel}{CV}

or

\firstname{JeanMichel}
\lastname{CV}
```

- Title: Description under fullname
```latex
\title{Bla bla bla bla bla bla}
```

- Address
```latex
\address{City, Country}
```

- Phone number
```latex
\phone{06~00~00~00~00}
```

- Extra info: anything that can be useful
```latex
\extrainfo{Extra info bla bla bla}
```

- Email address
```latex
\email{lolololol@lol.com}
```

These informations are required and used to render the header:
```latex
 \makecvheader
```

### Content

Sections are overridden to display a horizontal rule. No option is taken in account for this command:
```latex
 \section{My section}
```

CV entries must be placed into a `cventrylist` environment:
```latex
\begin{cventrylist}
    \cventry{date}{title}{location}{description}{content}
\end{cventrylist}
```
For `cventry`, the `location`, `description`, `content` arguments can be left blank without corrupting the layout.

## Customization

### Color

Global color can be changed be redefining the `primary` color.
```latex
% Define primary as black (#000000)
\definecolor{\primary}{HTML}{000000}
```
All definitions following the `xcolor` package specifications are accepted.

### Spacing

In CV entries, left column size can be adjusted by changing the `datewidth` length.
```latex
 \setlength{\datewidth}{5cm}
```
or other length related commands.
Default value for `datewidth` is 3cm.
