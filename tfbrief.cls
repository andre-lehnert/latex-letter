% tfbrief is a LaTeX class for letters written in German.
% This class is written by Thomas Fischer <fischer@unix-ag.uni-kl.de>
% and licensed by the Creative Commons Attribution-Share Alike 3.0 License
% http://creativecommons.org/licenses/by-sa/3.0/
%
% Additional translations provided by Martin van Driel <Martin@vandriel.de>
% (Spanish)

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tfbrief}[2011/10/03 TF-Brief]

\DeclareOption{german}{%
\PassOptionsToClass{ngerman}{babel}%
}

\newcommand{\labelphone}{Telefon}
\newcommand{\labelfax}{Fax}
\newcommand{\labelmobile}{Mobil}
\newcommand{\labelemail}{E-Mail}
\newcommand{\labelwww}{WWW}
\newcommand{\labelourref}{Unser Zeichen}
\newcommand{\labelyourref}{Ihr Zeichen}
\newcommand{\labelviafaxto}[1]{per FAX an #1}
\newcommand{\labelviaemailto}[1]{per E-MAIL an #1}
\newcommand{\labelfromanddate}[2]{#1, den #2}
\newcommand{\labelgreeting}{Sehr geehrte Damen und Herren}
\newcommand{\labelleave}{Mit freundlichen Gr{\"u}{\ss}en}
\newcommand{\labelattachment}{Anlagen}


% Replace German text fragments with English text fragments
\DeclareOption{english}{%
  \PassOptionsToClass{english}{babel}%
  \renewcommand{\labelphone}{phone}%
  \renewcommand{\labelfax}{fax}
  \renewcommand{\labelmobile}{mobile}%
  \renewcommand{\labelemail}{email}%
  \renewcommand{\labelwww}{www}%
  \renewcommand{\labelourref}{our reference}
  \renewcommand{\labelyourref}{your reference}
  \renewcommand{\labelviafaxto}[1]{sent via FAX to #1}%
  \renewcommand{\labelviaemailto}[1]{sent via EMAIL to #1}%
  \renewcommand{\labelfromanddate}[2]{#2}% no location for English letters
  \renewcommand{\labelgreeting}{Dear Sir/Madam}
  \renewcommand{\labelleave}{Sincerely,}
  \renewcommand{\labelattachment}{Attachments}
}

% Replace German text fragments with Spanish text fragments
\DeclareOption{spanish}{%
  \PassOptionsToClass{spanish}{babel}%
  \renewcommand{\labelphone}{Tel.}%
  \renewcommand{\labelmobile}{Cel.}%
  \renewcommand{\labelemail}{E-mail}%
  \renewcommand{\labelwww}{www}%
  \renewcommand{\labelourref}{nuestro acta Nr.}
  \renewcommand{\labelyourref}{su acta Nr.}
  \renewcommand{\labelviafaxto}[1]{FAX #1}%
  \renewcommand{\labelviaemailto}[1]{EMAIL #1}%
  \renewcommand{\labelfromanddate}[2]{#1, #2}%
  \renewcommand{\labelgreeting}{A quien le corresponda}
  \renewcommand{\labelleave}{Attentamente}
  \renewcommand{\labelattachment}{Anexo}
}

% Replace German text fragments with Swedish text fragments
\DeclareOption{swedish}{%
  \PassOptionsToClass{swedish}{babel}%
  \renewcommand{\labelphone}{telefon}%
  \renewcommand{\labelfax}{fax}
  \renewcommand{\labelmobile}{mobil}%
  \renewcommand{\labelemail}{e-post}%
  \renewcommand{\labelwww}{www}%
  \renewcommand{\labelourref}{v{\aa}r referens}
  \renewcommand{\labelyourref}{er referens}
  \renewcommand{\labelviafaxto}[1]{via fax till #1}%
  \renewcommand{\labelviaemailto}[1]{via e-post till #1}%
  \renewcommand{\labelfromanddate}[2]{#2}%
  \renewcommand{\labelgreeting}{Hej}
  \renewcommand{\labelleave}{Med v{\"a}nliga h{\"a}lsningar}
  \renewcommand{\labelattachment}{Bilagor}
}

\newcommand{\flagfromheadernarrow}{}
\DeclareOption{fromheadernarrow}{%
  \renewcommand{\flagfromheadernarrow}{yes}
}

\newcommand{\flagnofoldingmark}{}
\DeclareOption{nofoldingmark}{%
  \renewcommand{\flagnofoldingmark}{yes}
}

% use right-ragged (left-justified) text by default
\newcommand{\textbodyalignment}{\RaggedRight}
\DeclareOption{justify}{%
  % using option "justify" switch to center-justified (i.e. no justification)
  \renewcommand{\textbodyalignment}{}
}


\ProcessOptions

\LoadClass[12pt,a4paper]{scrartcl}

\RequirePackage{vmargin}
\RequirePackage{ifthen}
\RequirePackage{textcase}

% The "microtype" package provides a LaTeX interface to pdfTeXs
% micro-typographic extensions: character protrusion and font
% expansion.
% http://tug.ctan.org/info?id=microtype
\RequirePackage{microtype}

% Implements a workaround for the LaTeX bug that marginpars will
% sometimes come out at the wrong margin.
% http://tug.ctan.org/info?id=mparhack
\RequirePackage{mparhack}

% Alternative versions of "ragged"-type commands
% http://tug.ctan.org/info?id=ragged2e
\RequirePackage{ragged2e}



\newlength{\fromwidth}
\newlength{\fromwidthinternal}
\newlength{\dummylength}
\setlength{\fromwidthinternal}{1cm}
\setlength{\fromwidth}{20cm}

\newlength{\footerheight}
\newcommand{\TheFooter}{}
\newcommand{\footer}[2][1cm]{\setlength{\footerheight}{#1}\AtBeginDocument{\renewcommand{\TheFooter}{#2}}}

\newcommand{\TheFromNameShort}{}
\newcommand{\fromnameshort}[1]{\AtBeginDocument{\renewcommand{\TheFromNameShort}{#1}}}
\newcommand{\TheFromName}{}
\newcommand{\fromname}[2][]{\AtBeginDocument{\renewcommand{\TheFromName}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromNameShort}{#1}}}}
\newcommand{\TheFromDegreePre}{}
\newcommand{\TheFromDegreePreSig}{}
\newcommand{\fromdegreepre}[2][]{\AtBeginDocument{\renewcommand{\TheFromDegreePre}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromDegreePreSig}{#1}}}}
\newcommand{\TheFromDegreePost}{}
\newcommand{\TheFromDegreePostSig}{}
\newcommand{\fromdegreepost}[2][]{\AtBeginDocument{\renewcommand{\TheFromDegreePost}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromDegreePostSig}{#1}}}}
\newcommand{\TheFromTitle}{}
\newcommand{\TheFromTitleSig}{}
\newcommand{\fromtitle}[2][]{\AtBeginDocument{\renewcommand{\TheFromTitle}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromTitleSig}{#1}}}}
\newcommand{\TheFromStreetShort}{}
\newcommand{\fromstreetshort}[1]{\AtBeginDocument{\renewcommand{\TheFromStreetShort}{#1}}}
\newcommand{\TheFromStreet}{}
\newcommand{\fromstreet}[2][]{\AtBeginDocument{\renewcommand{\TheFromStreet}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromStreetShort}{#1}}}}
\newcommand{\TheFromCityCC}{}
\newcommand{\fromcitycc}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCC}{#1}}}
\newcommand{\TheFromCityShort}{}
\newcommand{\fromcityshort}[1]{\AtBeginDocument{\renewcommand{\TheFromCityShort}{#1}}}
\newcommand{\TheFromCity}{}
\newcommand{\fromcity}[2][]{\AtBeginDocument{\renewcommand{\TheFromCity}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromCityShort}{#1}}}}
\newcommand{\TheFromCityCode}{}
\newcommand{\fromcitycode}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCode}{#1}}}
\newcommand{\TheFromCountry}{}
\newcommand{\fromcountry}[1]{\AtBeginDocument{\renewcommand{\TheFromCountry}{#1}}}
\newcommand{\TheFromPhone}{}
\newcommand{\TheFromPhoneLabel}{}
\newcommand{\fromphone}[2][\labelphone]{\AtBeginDocument{\renewcommand{\TheFromPhoneLabel}{#1}\renewcommand{\TheFromPhone}{#2}}}
\newcommand{\TheFromFax}{}
\newcommand{\TheFromFaxLabel}{}
\newcommand{\fromfax}[2][\labelfax]{\AtBeginDocument{\renewcommand{\TheFromFaxLabel}{#1}\renewcommand{\TheFromFax}{#2}}}
\newcommand{\TheFromMobile}{}
\newcommand{\TheFromMobileLabel}{}
\newcommand{\frommobile}[2][\labelmobile]{\AtBeginDocument{\renewcommand{\TheFromMobileLabel}{#1}\renewcommand{\TheFromMobile}{#2}}}
\newcommand{\TheFromEMail}{}
\newcommand{\TheFromEMailLabel}{}
\newcommand{\fromemail}[2][\labelemail]{\AtBeginDocument{\renewcommand{\TheFromEMailLabel}{#1}\renewcommand{\TheFromEMail}{#2}}}
\newcommand{\TheFromWWW}{}
\newcommand{\TheFromWWWLabel}{}
\newcommand{\fromwww}[2][\labelwww]{\AtBeginDocument{\renewcommand{\TheFromWWWLabel}{#1}\renewcommand{\TheFromWWW}{#2}}}
\newcommand{\TheYourRef}{}
\newcommand{\TheYourRefLabel}{}
\newcommand{\yourref}[2][\labelyourref]{\AtBeginDocument{\renewcommand{\TheYourRefLabel}{#1}\renewcommand{\TheYourRef}{#2}}}
\newcommand{\TheOurRef}{}
\newcommand{\TheOurRefLabel}{}
\newcommand{\ourref}[2][\labelourref]{\AtBeginDocument{\renewcommand{\TheOurRefLabel}{#1}\renewcommand{\TheOurRef}{#2}}}
\newcommand{\TheToName}{}
\newcommand{\toname}[1]{\AtBeginDocument{\renewcommand{\TheToName}{#1}}}
\newcommand{\TheToStreet}{}
\newcommand{\tostreet}[1]{\AtBeginDocument{\renewcommand{\TheToStreet}{#1}}}
\newcommand{\TheToCityCC}{}
\newcommand{\tocitycc}[1]{\AtBeginDocument{\renewcommand{\TheToCityCC}{#1}}}
\newcommand{\TheToCity}{}
\newcommand{\tocity}[1]{\AtBeginDocument{\renewcommand{\TheToCity}{#1}}}
\newcommand{\TheToCityCode}{}
\newcommand{\tocitycode}[1]{\AtBeginDocument{\renewcommand{\TheToCityCode}{#1}}}
\newcommand{\TheToCountry}{}
\newcommand{\tocountry}[1]{\AtBeginDocument{\renewcommand{\TheToCountry}{#1}}}
\newcommand{\TheToFax}{}
\newcommand{\tofax}[1]{\AtBeginDocument{\renewcommand{\TheToFax}{#1}}}
\newcommand{\TheToEMail}{}
\newcommand{\toemail}[1]{\AtBeginDocument{\renewcommand{\TheToEMail}{#1}}}
\newcommand{\TheSubject}{Betreff}
\renewcommand{\subject}[1]{\AtBeginDocument{\renewcommand{\TheSubject}{#1}}}
\newcommand{\TheDate}{\today}
\renewcommand{\date}[1]{\AtBeginDocument{\renewcommand{\TheDate}{#1}}}
\newcommand{\TheGreeting}{\labelgreeting,}
\newcommand{\greeting}[1]{\AtBeginDocument{\renewcommand{\TheGreeting}{#1}}}
\newcommand{\TheLeave}{\labelleave}
\newcommand{\leave}[1]{\AtBeginDocument{\renewcommand{\TheLeave}{#1}}}
\newcommand{\TheSignature}{\vspace{1cm}}
\newcommand{\signature}[1]{\AtBeginDocument{\renewcommand{\TheSignature}{#1}}}
\newcommand{\TheLogo}{}
\newcommand{\logo}[1]{\AtBeginDocument{\renewcommand{\TheLogo}{#1}}}

\newcommand{\fromheaderentry}[2][]{%
\ifthenelse{\equal{\flagfromheadernarrow}{}}{%
\ifthenelse{\equal{#1}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\itshape\footnotesize{}#1\hspace{1em}}#2\\}%
}{%
\ifthenelse{\equal{#1}{}}{}{{\itshape\footnotesize\vspace*{-0.25em}#1}\\#2\\}%
}
}

\setmarginsrb{2.5cm}{2cm}{2.5cm}{2cm}{0cm}{0cm}{2cm}{2cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{1.75ex plus 0.75ex minus 0.75ex}

\newenvironment{letter}{
\thispagestyle{empty}
%
\setlength{\unitlength}{1mm}%
\ifthenelse{\equal{\flagnofoldingmark}{}}{% FIXME switching folding mark on and off causes x-shift in the next LaTeX element
\begin{picture}(0,0)%
%% y-offset of 25 is required
\put(-25,-81){\line(1,0){5}}%
\put(-25,-124.5){\line(1,0){7}}%
\put(-25,-186.5){\line(1,0){5}}%
\end{picture}%
}{}%
%
\ifthenelse{\equal{\TheFooter}{}}{}{%
\enlargethispage{-\footerheight}
\enlargethispage{0.5cm}% FIXME should be a page-specific variable
\begin{picture}(0,0)%
\put(-1,-250){\begin{minipage}[b][\footerheight]{\linewidth}%
\vfill%
\fontfamily{phv}\fontseries{mc}\selectfont\footnotesize%
\TheFooter
\end{minipage}}%
\end{picture}%
}%
%
\begin{minipage}[t]{8cm}\vspace*{-0.1pt}
% Alternate position for the logo
%\begin{minipage}[t][2.5cm]{\linewidth}
%\vspace{-0.001mm}\TheLogo
%\end{minipage}\\
\vspace*{2.5cm}
\begin{minipage}[t]{\linewidth}\vspace*{-0.1pt}
{\fontfamily{phv}\fontseries{mc}\selectfont \scriptsize \ifthenelse{\equal{\TheFromNameShort}{}}{\TheFromName}{\TheFromNameShort} $\cdot$ \ifthenelse{\equal{\TheFromStreetShort}{}}{\TheFromStreet}{\TheFromStreetShort} $\cdot$ \ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC --\TheFromCityCode} \ifthenelse{\equal{\TheFromCityShort}{}}{\TheFromCity}{\TheFromCityShort} \ifthenelse{\equal{\TheFromCountry}{}}{}{$\cdot$ \TheFromCountry} \vspace{-1ex} \rule{0cm}{0cm}\\\hrule\rule{0cm}{0cm}}

\TheToName \\
\ifthenelse{\equal{\TheToStreet}{}}{\vspace*{0.75ex}\\}{\TheToStreet\vspace*{0.6ex}\\}
{\bfseries \ifthenelse{\equal{\TheToCityCC}{}}{\TheToCityCode}{\TheToCityCC --\TheToCityCode} \TheToCity}
\ifthenelse{\equal{\TheToCountry}{}}{}{\vspace*{0.6ex}\\\textbf{\MakeTextUppercase{\TheToCountry}}}
\ifthenelse{\equal{\TheToFax}{}}{}{

\vspace{0.5em}
\fbox{\footnotesize\labelviafaxto{\TheToFax}}}
\ifthenelse{\equal{\TheToEMail}{}}{}{

\vspace{0.5em}
\fbox{\footnotesize\labelviaemailto{\TheToEMail}}}
\end{minipage}
\end{minipage}
%
\hfill
%
\settowidth{\dummylength}{\TheFromDegreePre{} \TheFromName, \TheFromDegreePost}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromTitle}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromStreet}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC{}--\TheFromCityCode} \TheFromCity}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromPhone}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromFax}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromMobile}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromEMail}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheFromWWW}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheOurRef}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\settowidth{\dummylength}{\TheYourRef}%
\ifthenelse{\dummylength>\fromwidthinternal}{\setlength{\fromwidthinternal}{\dummylength}}{}%
\ifthenelse{\fromwidth>\fromwidthinternal}{\setlength{\fromwidth}{\fromwidthinternal}}{}
\begin{minipage}[t]{\fromwidth}\vspace*{-0.1pt}%
\begin{minipage}[t]{\linewidth}\vspace*{-0.1pt}%
\TheLogo%
\end{minipage}\par%
\ifthenelse{\equal{\TheFromDegreePre}{}}{}{\TheFromDegreePre{} }%
\TheFromName%
\ifthenelse{\equal{\TheFromDegreePost}{}}{}{, \TheFromDegreePost}%
\\%
\ifthenelse{\equal{\TheFromTitle}{}}{}{\TheFromTitle\\}%
\TheFromStreet\\%
\ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC{}--\TheFromCityCode}
\TheFromCity\\%
\ifthenelse{\equal{\TheFromCountry}{}}{}{\TheFromCountry\\}%
\fromheaderentry[\TheFromPhoneLabel]{\TheFromPhone}%
\fromheaderentry[\TheFromFaxLabel]{\TheFromFax}%
\fromheaderentry[\TheFromMobileLabel]{\TheFromMobile}%
\fromheaderentry[\TheFromEMailLabel]{\TheFromEMail}%
\fromheaderentry[\TheFromWWWLabel]{\TheFromWWW}%
\fromheaderentry[\TheOurRefLabel]{\TheOurRef}%
\ifthenelse{\equal{\TheYourRef}{}}{}{\\}%
\fromheaderentry[\TheYourRefLabel]{\TheYourRef}%
\end{minipage}

\vspace{2cm plus 3.5cm minus 1.75cm}

\begin{flushright}
\labelfromanddate{\TheFromCity\ifthenelse{\equal{\TheFromCountry}{\TheToCountry}}{}{\ifthenelse{\equal{\TheFromCountry}{}}{}{, \TheFromCountry}}}{\TheDate}
\end{flushright}

\vspace{2cm plus 3.5cm minus 1.75cm}

{\bfseries \sffamily \TheSubject}

\vspace{1cm plus 1cm minus 0.75cm}

\TheGreeting%

\textbodyalignment
\renewcommand{\baselinestretch}{1.2}\normalsize%
}%
{%

% empty line required, as otherwise the baselinestretch
% of the letter's last paragraph will be set to 1.0, too.
\renewcommand{\baselinestretch}{1.0}\normalsize

\ifthenelse{\equal{\TheLeave}{}}{}{
\vspace{1.5em plus 0.75em minus 0.75em}

\TheLeave
}

\vspace{0.25cm plus 0.25cm minus 0.25cm}

\TheSignature
\ifthenelse{\equal{\TheFromDegreePreSig}{}}{\TheFromDegreePre}{\TheFromDegreePreSig}
\TheFromName%
\ifthenelse{\equal{\TheFromDegreePostSig}{}}{\ifthenelse{\equal{\TheFromDegreePost}{}}{}{, \TheFromDegreePost}}{, \TheFromDegreePostSig}%
\ifthenelse{\equal{\TheFromTitleSig}{}}{\ifthenelse{\equal{\TheFromTitle}{}}{}{\\\TheFromTitle}}{\\\TheFromTitleSig}%
}


\newenvironment{attachment}[1][\labelattachment]{
\newcommand{\TheAttachmentLabel}{#1}
%\enlargethispage{2cm}
%\vspace{2cm plus 2fil minus 1cm}
\vspace{2cm plus 2cm minus 1cm}\vfill
\TheAttachmentLabel
\begin{itemize}
\setlength{\itemsep}{0cm}
}
{\end{itemize}}
