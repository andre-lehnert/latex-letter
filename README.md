# LaTeX-Briefklasse *tfbrief*

## Voraussetzungen

Die Dokumentenklasse basiert auf der Artikel-Klasse des [KOMA-Script](https://komascript.de) - *scrartcl*.

## Klassenoptionen

Option | Funktion
--- | ---
`german, english, spanish, swedish` | Lokalisierung der Labels und voreingestellten Anrede- und Grußformeln, beim Laden von *babel* wird entsprechende Option übergeben
`nofoldingmark` | keine Falzmarkierung ausgeben
`justify` | Brieftext im Blocksatz anstatt linksbündig
`fromheadernarrow` | gibt die Absenderinformationen als schmaleren Block aus

## Dokumentaufbau

### Header

```latex
\documentclass[options]{tfbrief}

\usepackage{...}

% Absenderinformationen
\fromname{...}
\fromstreet{...}
\fromcity{...}
...

% Empfängerinformationen
\toname{...}
\tostreet{...}
\tocity{...}
...
```

Absenderattribute beginnen mit `\from`, Empfängerattribute mit `\to`. Es muss mindestens jeweils ein Name angegeben werden, folgende Eigenschaften sind möglich:

&nbsp; | Absender | Empfänger
--- | --- | ---
Name | fromname, fromnameshort¹, fromdegreepre², fromdegreepost², fromtitle² | toname
Adresse | fromstreet, fromstreetshort¹, fromcity, fromcityshort¹, fromcitycode, fromcitycc³, fromcountry | tostreet, tocity, tocitycode, tocitycc³, tocountry
Kommunikation | fromphone, frommobile, fromemail, fromwww, fromfax | tofax, toemail
Bezugszeile | ourref | yourref

¹ erscheint im Sichtfenster

² erscheint nicht im Sichtfenster

³ Zusatz vor der Postleitzahl, kein Länderkürzel (wird nicht mehr verwendet)

### Betreff

```latex
\subject{...}
```

### Anrede und Schlussformel

Individualisierbar, Standard "Sehr geehrte Damen und Herren" und "Mit freundlichen Grüßen".

```latex
\greeting{}
\leave{}
```
### Brieftext

```latex
\begin{document}
\begin{letter}

Dies ist der Text zwischen Anrede und abschließender Grußformel.

\end{letter}
\end{document}
```

### Weitere Optionen

#### Logo

Ein Logo kann optional oben im Absenderblock eingebunden werden:

```latex
\usepackage{graphicx}
\logo{\includegraphics[width=\textwidth]{logo.JPG}} % einbinden auf gesamter Breite des Blocks
```

#### Footer

In der Footer-Umgebung kann beliebiger Inhalt  angezeigt werden, der auf der ersten Seite des Dokuments als Fußzeile dargestellt wird:

```latex
\footer{
Text der Fußzeile
}
```

#### Anlagen

Eine Liste von Dokumenten im Anhang kann mit der *attachment*-Umgebung angegeben werden:

```latex
\begin{attachment}
  \item Dok1
  \item Dok2
\end{attachment}
```

## Beispiele

* [letter.tex](letter.tex), [PDF](letter.pdf)
* [letter_simple.tex](letter_simple.tex), [PDF](letter_simple.pdf)

