%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UNILIM THESIS TEMPLATE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Based on the original template of "limthesis"
% Originally by Rafael de sousa Marinho, 2019
%
% Based on the original template of "ociamthesis"
% Originally by Keith A. Gillow (gillow@maths.ox.ac.uk), 1997
% Modified by Sam Evans (sam@samuelevansresearch.org), 2007
% Modified by John McManigle (john@oxfordechoes.com), 2015
%
% Broad permissions are granted to use, modify, and distribute this software
% as specified in the MIT License included in this distribution's LICENSE file.
%
%
% Modified by Rémy Bouché, 2020
% This template is based on the "limthesis" and "ociamthesis" templates.
% I have picked up files from these two templates to create an improved crossover version.
% I have also corrected some warnings and simplified the files.
% The template is aimed for Unilim students, therefore it is commented in French.
%
%


%%% PREAMBULE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ne pas toucher ces lignes (sauf si vous maitrisez) !

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unilim}[2020/03/01]

% On se base sur la classe "report" déjà existante
\LoadClass[openright,12pt]{report}

% On passe les options à la classe "report"
\newif\ifmc@nobind\mc@nobindfalse
\DeclareOption{nobind}{\mc@nobindtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\usepackage{tocloft} % Outils pour la TdM (package à charger avant \parskip)




%%% ESPACEMENTS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{parskip}
\usepackage{setspace}

% Valeurs par défaut de l'espacement entre les paragraphes :
% \setlength{\parskip}{0pt plus 1pt} % Espace entre les paragraphes
% \setlength{\parfillskip}{0pt plus .7\textwidth} % Espace de la dernière ligne du paragraphe.
\setlength{\parindent}{0pt} % Pas d'indentation pour les paragraphes

% Espacement inter-lignes - Trois types d'espacement sont utilisés :
\newlength{\singlebaselineskip} % Espacement simple (légendes, etc.)
\newlength{\textbaselineskip} % Espacement du texte principal
%\newlength{\romanbaselineskip} % Espacement des pages romaines (remerciements, TdM, etc.)

% Valeurs par défaut de l'espacement entre les lignes :
% \setlength{\singlebaselineskip}{\baselineskip}
\setlength{\textbaselineskip}{1.15\baselineskip plus2pt}
% \setlength{\romanbaselineskip}{17pt plus1pt minus1pt}
% \setlength{\baselineskip}{\textbaselineskip}




%%% GÉOMÉTRIE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La mise en page du document (marges, etc.) est fixée ci-dessous.
% Les marges latérales sont modifiées dans le cas d'une reliure.

\ifmc@nobind
    \usepackage[
    includeheadfoot,
    marginparwidth=2cm, % Évite un warning de todonotes
    %showframe, % Affiche le cadre
    includeheadfoot,
    hmargin={2.5cm, 2.5cm},
    vmargin={2cm, 2cm},
    headsep=.8cm,
    headheight=15pt,
    footskip=1.5cm]
    {geometry}
\else
    \usepackage[
    includeheadfoot,
    marginparwidth=2cm, % Évite un warning de todonotes
    %showframe, % Affiche le cadre
    includeheadfoot,
    hmargin={3cm, 2cm},
    vmargin={2cm, 2cm},
    headsep=.8cm,
    headheight=15pt,
    footskip=1.5cm]
    {geometry}
\fi




%%% EN-TÊTES ET PIEDS DE PAGES
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La disposition des en-têtes et pieds de page est fixée ci-dessous.
% Au total, quatre styles "fancy" sont utilisés dans le document :
% * empty (page vierge)
% * core (en-têtes et pieds de page, pour le texte principal)
% * plain (uniquement pieds de page, pour les remerciements et autres)
% * appendix et biblio (en-têtes et pieds de page, pour les annexes et biblio)

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\makeatletter

% Supprime les lignes de séparation
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Dans le cas d'un document recto verso, la disposition est alternée (gauche/droite).
\if@twoside

    \fancypagestyle{core}{% Chapitre en haut de page + Pied de page alterné
    	\fancyhf{}
        \onehalfspacing
        \fancyhead[RO, LE]{\textcolor{gray}{Chapitre~\thechapter~--~\leftmark}}
        \fancyfoot[RO]{\makebox[20pt][r]{\textcolor{gray}{\thepage}}}    
        \fancyfoot[LE]{\makebox[20pt][l]{\textcolor{gray}{\thepage}}}
        \fancyfoot[LO, RE]{\textcolor{gray}{\scriptsize \@author ~\textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
    }
    
    \fancypagestyle{appendix}{% Chapitre en haut de page + Pied de page alterné
    	\fancyhf{}
        \onehalfspacing
        \fancyhead[RO, LE]{\textcolor{gray}{\thechapter~--~\leftmark}}
        \fancyfoot[RO]{\makebox[20pt][r]{\textcolor{gray}{\thepage}}}    
        \fancyfoot[LE]{\makebox[20pt][l]{\textcolor{gray}{\thepage}}}
        \fancyfoot[LO, RE]{\textcolor{gray}{\scriptsize \@author ~\textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
    }
    
        \fancypagestyle{biblio}{% Chapitre en haut de page + Pied de page alterné
    	\fancyhf{}
        \onehalfspacing
        \fancyhead[RO, LE]{\textcolor{gray}{B - Bibliographie}}
        \fancyfoot[RO]{\makebox[20pt][r]{\textcolor{gray}{\thepage}}}    
        \fancyfoot[LE]{\makebox[20pt][l]{\textcolor{gray}{\thepage}}}
        \fancyfoot[LO, RE]{\textcolor{gray}{\scriptsize \@author ~\textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
    }
    
    \fancypagestyle{plain}{% Pied de page alterné
        \fancyhf{}
        \onehalfspacing
        \fancyfoot[RO]{\makebox[20pt][r]{\textcolor{gray}{\thepage}}}   
        \fancyfoot[LE]{\makebox[20pt][l]{\textcolor{gray}{\thepage}}} 
        \fancyfoot[LO, RE]{\textcolor{gray}{\scriptsize \@author ~\textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
    }
        
\else

    \fancypagestyle{core}{% Chapitre en haut de page + Pied de page
        \fancyhf{}
        \onehalfspacing
        \renewcommand{\subsectionmark}[1]{}
        \fancyhead[R]{\textcolor{gray}{Chapitre~\thechapter~--~\leftmark}}
        \fancyfoot[L]{\textcolor{gray}{\scriptsize \@author \textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
        \fancyfoot[R]{~\makebox[20pt][r]{\textcolor{gray}{\thepage}}}    
    }
    
    \fancypagestyle{appendix}{% Chapitre en haut de page + Pied de page
        \fancyhf{}
        \onehalfspacing
        \renewcommand{\subsectionmark}[1]{}
        \fancyhead[R]{\textcolor{gray}{\thechapter~--~\leftmark}}
        \fancyfoot[L]{\textcolor{gray}{\scriptsize \@author \textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
        \fancyfoot[R]{~\makebox[20pt][r]{\textcolor{gray}{\thepage}}}    
    }
    
    \fancypagestyle{biblio}{% Chapitre en haut de page + Pied de page
        \fancyhf{}
        \onehalfspacing
        \renewcommand{\subsectionmark}[1]{}
        \fancyhead[R]{\textcolor{gray}{B - Bibliographie }}
        \fancyfoot[L]{\textcolor{gray}{\scriptsize \@author \textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
        \fancyfoot[R]{\makebox[20pt][r]{\textcolor{gray}{\thepage}}}    
    }
    
    \fancypagestyle{plain}{% Pied de page
        \fancyhf{}
        \onehalfspacing
        \renewcommand{\subsectionmark}[1]{}
        \fancyfoot[L]{\textcolor{gray}{\scriptsize \@author ~\textbar~Thèse de doctorat~\textbar~Université de Limoges\linebreak Licence CC BY-NC-ND 3.0}}
        \fancyfoot[R]{\makebox[20pt][r]{\textcolor{gray}{\thepage}}}   
    }

\fi




%%% PACKAGES IMPORTANTS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Les packages ci-dessous sont utilisés dans le template.
% Vérifier la compatibilité en cas de modification/suppression.

% Packages de base
\usepackage[utf8]{inputenc} % Encodage UTF8
\usepackage[T1]{fontenc} % Encodage OT1
\usepackage[french,english]{babel} % Règles typographiques pour l'anglais et le français
\usepackage[protrusion=true,expansion=true]{microtype} % Amélioration de la typographie
\usepackage{textcomp} % Chargement des symboles ASCII
\usepackage{amsmath} % Outils mathématiques
\usepackage{amssymb} % Chargement des symboles mathématiques
\usepackage{enumerate} % Insertion de listes
\usepackage{enumitem} % Personnalisation des listes
\usepackage{calc} % Syntaxe naturelle pour les calculs

% Esthétique
\usepackage[svgnames]{xcolor} % Gestion des couleurs
\usepackage[grey,avantgarde]{quotchap} % Page de garde des chapitres (changement de police possible)
\usepackage{lettrine} % Lettrines en début de chapitre
\usepackage{helvet} % Police Helvetica (sans serif)
\renewcommand{\familydefault}{\sfdefault} % Police similaire à Arial
\usepackage{ragged2e}
%\usepackage{fontspec}
%\setmainfont{Arial}
\usepackage{tcolorbox} % Zones de texte colorées
\usepackage{nicefrac} % Meilleur affichage des fractions dans le texte

% TdM & Biblio
\usepackage[nonumberlist]{glossaries} % Permet de créer un glossaire
\usepackage{csquotes} % Règles typographiques pour les citations
\usepackage{notoccite} % Formatage de la bibliographie
\usepackage[nottoc, notlof, notlot, notbib]{tocbibind} % Bibliographie dans la TdM

% Tableaux
\usepackage{multicol,multirow,array} % Gestion des tableaux
\usepackage{longtable} % Autorise les tableaux sur plusieurs pages (à appeler avant hyperref)
\usepackage{tabularx} % Environnement de tableaux amélioré (largeur automatique)
\usepackage{tabu} % Outils pour les tableaux
\usepackage{makecell} % Outils pour les tableaux
\usepackage{booktabs} % Tableaux 'bookstyle'
\usepackage{rotating} % Utilisation de tableaux en mode paysage
\usepackage{hhline} % Amélioration des lignes dans les tableaux
\usepackage{colortbl} % Gestion des couleurs dans les tableaux

% Autres
\usepackage{lipsum} % Lorem Ipsum en latin
\usepackage{kantlipsum} % Lorem Ipsum en anglais
\usepackage{etoolbox} % Outils de programmation pour les packages LaTeX
\usepackage{graphicx} % Options graphiques pour le texte (rotation, etc.)
\usepackage{float} % Forcer l'environnement float pour les figures
\usepackage{overpic} % Superposition de texte sur les figures
\usepackage{soul} % Surligner le texte
\usepackage{xspace} % Insère un espace automatiquement après les abbréviations
\usepackage{chngcntr} % Meilleur usage des compteurs
\usepackage{ifoddpage} % Détecte si la page est impaire


% Gestion des couleurs
\definecolor{redxlim}{HTML}{B51621}


% Amélioration des légendes
\usepackage[
    font=small,
    labelfont=bf,
    %format=hang,
    %labelsep=colon,
    tableposition=top]{caption}


% Liens hypertexte dans le document (changement de couleur possible)
\usepackage[
    colorlinks=true,
    citecolor=redxlim,
    linkcolor=black,
    urlcolor=redxlim]{hyperref} 


% Unités SI
\usepackage{siunitx}
\sisetup{detect-all = true}


% Génération d'un sommaire à chaque chapitre
\usepackage[nohints,tight]{minitoc}
\setcounter{minitocdepth}{2} 
\let\oldmtc@verse\mtc@verse
\renewcommand{\mtc@verse}[1]{\oldmtc@verse{#1}\setlength{\baselineskip}{\z@}} % Fixe l'espacement


% Gestion de la bibliographie avec biblatex
% Dans le cas d'un document pdf (nobind), les liens hypertexte vers les références sont affichés.
\ifmc@nobind
    \usepackage[
        style=ieee,
        doi=false,
        isbn=false,
        url=true,
        defernumbers]{biblatex}
\else
        \usepackage[
        style=ieee,
        doi=false,
        isbn=false,
        url=false,
        defernumbers]{biblatex}
\fi


% Filigrane "Brouillon" sur la page de couverture (commenter pour la version finale)
%\usepackage[firstpage]{draftwatermark}
%\SetWatermarkText{BROUILLON}
%\SetWatermarkScale{3}

% Package "todonotes" qui sert d'aide à la rédaction.
% Utiliser "enable/disable" pour l'activer/le désactiver.
\usepackage[shadow,disable]{todonotes}
%\geometry{marginparwidth=5cm, left=1.5cm, right=6cm}





%%% PACKAGES OPTIONNELS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Les packages suivants sont des packages utiles que vous pouvez incorporez.
% Vérifiez leur compatibilité avec les packages précédents.

%\usepackage{xfrac} % Meilleur usage des fractions
%\usepackage[makeroom]{cancel} % Barre le texte à supprimer pour correction
%\usepackage{subfig} % Figures multiples
%\usepackage{subcaption} % Légendes multiples
%\usepackage{threeparttable} % Notes de bas de page sous les tableaux
%\usepackage{appendix} % Formatage des annexes
%\usepackage{xltxtra} % Fonctionnalités additionelles pour le texte
%\usepackage{pdfpages} % Permet d'insérer des PDF multi-pages en tant que graphique
%\usepackage{wrapfig} % Figures englobées par du texte
%\usepackage{pinlabel} % Superposition de labels sur les images vectorielles
%\usepackage{dcolumn} % Permet d'aligner les données d'un tableau sur la décimale

% Création d'éléments graphiques avec Tikz
% \usepackage{tikz}
% \usetikzlibrary{calc}
% \usetikzlibrary{shapes}
% \usetikzlibrary{plotmarks}
% \usetikzlibrary{arrows, backgrounds}
% \tikzset{>=stealth}

% Tracé de courbe avec pgf
% \usepackage{pgfplots}
% \pgfplotsset{minor grid style={dashed,white}}
% \pgfplotsset{major grid style={thick,dashed,white}}
% \pgfplotsset{compat=1.16}




%%% DÉCLARATIONS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ces macros permettent de définir les informations présentes sur la couverture.

\def\degreefield#1{\gdef\@degreefield{#1}} % Discipline
\def\degreedate#1{\gdef\@degreedate{#1}} % Date de soutenance
\def\ED#1{\gdef\@ED{#1}} % École Doctorale
\def\englishtitle#1{\gdef\@englishtitle{#1}} % Titre en anglais



%%% ENVIRONNEMENTS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ces macros définissent des environnements personnalisés.

% Pages romaines :
% Les pages sont numérotées en chiffres romains minuscules avant le début du premier chapitre.
% Quand l'environnement est fermé, les pages sont remises à zéro en numérotation arabe.
\newenvironment{romanpages}{
    \cleardoublepage
    \setlength{\baselineskip}{\romanbaselineskip}
    \setcounter{page}{1}
    \renewcommand{\thepage}{\roman{page}}}
    {\cleardoublepage
    \setcounter{page}{1}
    \renewcommand{\thepage}{\arabic{page}}}




%%% DIVERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Suppléments.

% Les lignes suivantes améliorent le placement des figures sur la page.
% (Source : http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont)
\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}


% La ligne suivante fixe les équations par section (2.3.12) plutôt que par chapitre (2.18).
%\numberwithin{equation}{subsection}


% Définition de la couleur "redxlim" et application aux numéros des chapitres.
\AtBeginDocument{\colorlet{chaptergrey}{redxlim}}


% Espace flexible après une figure pour améliorer la mise en page.
\setlength{\textfloatsep}{20pt plus15pt minus4pt}


% Paramètres de sortie du fichier pdf.
\pdfminorversion=5
\pdfcompresslevel=9
\pdfobjcompresslevel=3

