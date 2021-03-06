% vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:
%
%                                   _      _
%                   _o)   __ _  ___/ /__ _/ /_  __ _  (o_
%%%%%%%%%%%%%%%%%   /\\  /  ' \/ _  / _ `/ _  \/  ' \ //\   %%%%%%%%%%%%%%%%%%
%                   \_v /_/_/_/\_,_/\_, /_/ /_/_/_/_/ v_/
%                                  /___/
%
% Author:       Michel Massaro
% Version :     V1.0
% Date :        04/01/17
% Description : Personnal class to write a beamer presentation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beamer_massaro}[2014/10/03 Classe personnelle, V1.0]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Classe de base                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[slidetop,10pt, mathserif]{beamer}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Extensions                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc}        % Police contenant les caracteres francais
\RequirePackage[utf8]{inputenc}     % sous Mac
\RequirePackage[frenchb]{babel}
\RequirePackage{color}

\RequirePackage{tikz}
\usetikzlibrary[patterns]
\usetikzlibrary[arrows]
\usetikzlibrary[shadows]
\usetikzlibrary{lindenmayersystems}
\usetikzlibrary{3d}
\usetikzlibrary{fadings}
\tikzfading[name=fade out,
  inner color=transparent!0, outer color=transparent!100]

\RequirePackage{animate}
\RequirePackage{calc}
\RequirePackage{times}
\RequirePackage{todonotes}
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{epsfig}             % (preferer graphicx, si possible)
\RequirePackage{hyperref}
\RequirePackage{geometry}           % Definir les marges
\RequirePackage{moreverb}
\RequirePackage{latexsym}
\RequirePackage{bbm}                % fontes doubles (pour les ensembles, ...)
\RequirePackage{amsmath}
\RequirePackage{authblk}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{pifont}
\RequirePackage{animate}
\RequirePackage{subfigure}
\RequirePackage{psfrag}
\RequirePackage{dsfont}
\RequirePackage{array}
\RequirePackage{cases}
\RequirePackage[absolute,showboxes,overlay]{textpos}
\RequirePackage{xparse}

%\uselanguage{French}
%\languagepath{French}
%\usepackage{pgfmath}
%\hypersetup{pdfpagemode=FullScreen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Raccourcis                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Z}{\ensuremath{\mathds{Z}}}
\newcommand{\C}{\ensuremath{\mathds{C}}}
\newcommand{\R}{\ensuremath{\mathds{R}}}
\newcommand{\Q}{\ensuremath{\mathds{Q}}}
\newcommand{\N}{\ensuremath{\mathds{N}}}

% Partial derivative
\newcommand{\dt}{\ensuremath{\partial_t}}
\newcommand{\dx}{\ensuremath{\partial_x}}
\newcommand{\dy}{\ensuremath{\partial_y}}
\newcommand{\dz}{\ensuremath{\partial_z}}

% Derivative operator
\newcommand{\rot}{\ensuremath{\nabla \times}}
\newcommand{\divv}{\ensuremath{\nabla \cdot}}
\newcommand{\grad}{\ensuremath{\nabla}}

%petit o et grand o
\newcommand{\bigO}[1]{\ensuremath{\mathop{}\mathopen{}\mathcal{O}\mathopen{}\left(#1\right)}}
\newcommand{\smallO}[1]{\ensuremath{\mathop{}\mathopen{}{\scriptstyle\mathcal{O}}\mathopen{}\left(#1\right)}}

% Vector
\newcommand{\vect}[1]{\ensuremath{\mathbf{#1}}}

% Scalar product need vector
\newcommand{\scal}[2]{\ensuremath{\vect{#1}\cdot\vect{#2}}}

% Domain
\newcommand{\timeDomain}{\ensuremath{\left[0, T\right]}}

% Jump
\newcommand{\jump}[1]{\ensuremath{\left[\!\!\left[ #1 \right]\!\!\right]}}

\newcommand{\numeq}[1]{\begin{equation} \text{#1} \end{equation}}
\newcommand{\nnumeq}[1]{\begin{equation*} \text{#1} \end{equation*}}

\newcommand{\tbf}[1]{\textbf{#1}}
\newcommand{\etal}{\textit{et al. }}
\newcommand{\diff}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\diffd}[3]{%
    \if#2#3%
        \frac{\partial ^2#1}{\partial #2^2}%
    \else%
        \frac{\partial ^2#1}{\partial #2 \partial #3}%
    \fi}

\newcommand{\sdiff}[2]{\partial_{#2} (#1)}
\newcommand{\sdiffd}[3]{\partial_{#2#3}(#1)}

\newcommand{\intervalleoo}[2]{\mathopen{\rbrack}#1\,;#2\mathclose{\lbrack}}
\newcommand{\intervalleof}[2]{\mathopen{\rbrack}#1\,;#2\mathclose{\rbrack}}
\newcommand{\intervallefo}[2]{\mathopen{\lbrack}#1\,;#2\mathclose{\lbrack}}
\newcommand{\intervalleff}[2]{\mathopen{\lbrack}#1\,;#2\mathclose{\rbrack}}

\newcommand{\pg}{\ensuremath{\boldsymbol\xi}}
\newcommand{\pgref}{\ensuremath{\widehat{\boldsymbol\xi}}}
\newcommand{\wpg}{\ensuremath{\lambda}}
\newcommand{\wpgref}{\ensuremath{\widehat{\lambda}}}

\newcommand*{\intervalle}[4]{\mathopen{\left{#1}}#2\mathclose{}\mathpunct{};#3\mathclose{\right{#4}}}



%utilise xparse
\NewDocumentCommand{\incl}{m g}{%
    \begin{figure}[!h]
    \includegraphics[width=5cm]{#1}%
    \IfNoValueF{#2}{\hspace{0.5cm}\includegraphics[width=5cm]{#2}}
    \end{figure}
}

\NewDocumentCommand{\inclwc}{m m g}{%
    \begin{figure}[!h]
    \includegraphics[width=5cm]{#2}%
    \IfNoValueF{#3}{\hspace{0.5cm}\includegraphics[width=5cm]{#3}}
    \caption{#1}
    \end{figure}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Informations                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Counters
\newcounter{m}      % Number of sides of the polygon
\setcounter{m}{2}
\newcounter{c}      % Internal Control Counter


\mode<presentation>{
    \setbeamertemplate{background canvas}[vertical shading]
    [bottom=yellow!10, top=white!100]  %Degrade de couleur en fond
    \usetheme{Warsaw}
    \setbeamercovered{transparent}
}


