% vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:

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

\newcommand{\Z}{\mathbb Z}
\newcommand{\C}{\mathbb C}
\newcommand{\R}{\mathbb R}
\newcommand{\Q}{\mathbb Q}
\newcommand{\N}{\mathbb N}

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


