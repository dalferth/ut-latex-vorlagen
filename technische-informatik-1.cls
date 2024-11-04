\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techinf1}[Technische Informatik 1]

\LoadClass[a4paper]{scrartcl}

% change for each exercise
% \newcommand{\NUMBER}{1}
% \newcommand{\EXERCISES}{3}

% only once
\newcommand{\COURSE}{KURS}
\newcommand{\STUDENTA}{STUDENTA}
\newcommand{\STUDENTB}{STUDENTB}

% Packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{lastpage}
\RequirePackage{listings}
\RequirePackage{tikz}
\RequirePackage{pdflscape}
\RequirePackage{subfigure}
\RequirePackage{float}
\RequirePackage{polynom}
\RequirePackage{hyperref}
\RequirePackage{tabularx}
\RequirePackage{forloop}
\RequirePackage{geometry}
\RequirePackage{listings}
\RequirePackage{fancybox}
\RequirePackage{tikz}
\RequirePackage{float}
\RequirePackage{enumitem}
%\RequirePackage{algpseudocode,algorithm,algorithmicx}

\input 100_template/kvmacros/kvmacros
\geometry{a4paper,left=3cm, right=3cm, top=3cm, bottom=3cm}

\newcolumntype{C}{>{$}c<{$}}
\newcolumntype{L}{>{$}l<{$}}

\kvunitlength=10mm

% headline
\newcommand{\header}[1]{
	\begin{center}
		{\Large Übungsblatt Nr. #1}
	\end{center}
}

% Tabelle für Punkte
\newcounter{punktelistectr}
\newcounter{punkte}
\newcommand{\punkteliste}[2]{%
	\setcounter{punkte}{#2}%
	\addtocounter{punkte}{-#1}%
	\stepcounter{punkte}%
	\begin{center}%
		\begin{tabularx}{9.5cm}[]{@{}*{\thepunkte}{>{\centering\arraybackslash} X|}@{}>{\centering\arraybackslash}X}
			\forloop{punktelistectr}{#1}{\value{punktelistectr} < #2 } %
			{%
				\thepunktelistectr &
			}
			#2 &  $\Sigma$ \\
			\hline
			\forloop{punktelistectr}{#1}{\value{punktelistectr} < #2 } %
			{%
				&
			} &\\
			\forloop{punktelistectr}{#1}{\value{punktelistectr} < #2 } %
			{%
				&
			} &\\
		\end{tabularx}
	\end{center}
}

% Kopfzeile
\pagestyle{fancy}
\fancyhead[L]{\COURSE}
\fancyhead[C]{}
\fancyhead[R]{\today}

% Fußzeile
\fancyfoot[L]{}
\fancyfoot[C]{}
\fancyfoot[R]{Seite \thepage /\pageref*{LastPage}}

% Informationen über Studierende und Punkteliste einfügen
\newcommand{\studentinfo}[3]{
	\begin{tabularx}{\linewidth}{m{0.2 \linewidth}X}
		\begin{minipage}{\linewidth}
			#1\\
			#2
		\end{minipage} & \begin{minipage}{\linewidth}
			\punkteliste{1}{#3}
		\end{minipage}\\
	\end{tabularx}
}

% Assignment-Umgebung
\newenvironment{assignment}[2]{%
	\studentinfo{\STUDENTA}{\STUDENTB}{#2}%
	\header{#1}%
}{}

\endinput
