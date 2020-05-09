# Vad är Vim

    2016 - Vim version 8
    2014 - Neovim, fork som fokuserar på "extensibility and usability"
    1991 - Vim : Vi IMproved
    1976 - Vi : visual, grafiskt interface för ex
    197? - ex > en > em > ed

- Textredigerare, open source.
- Femte mest populära IDE:n 2019 (Stack overflow)
- De facto standard i Linux/Unix, finns överallt
- Mycket konfigurerbart med många tillägg
- Kommandot `vi` är oftast `vim`

## "The Vim way"

Vim är baserat på olika lägen (moder) och sekvenser av kommandon.

    På ett piano kan man spela både ackord och kombinera flera noter till
    melodier. De flesta program har kortkommandon där man trycker ner ett antal
    tangenter (ackord). Vim har sådana "ackord" men de flesta kommandon görs
    genom att trycka ner en sekvens av tangenter, en melodi eller mening.

Alternativ militärt: lystringsord och verkställighetsord

- Notation för melodier
  - `x`      tryck ner `x`
  - `dw`     tryck `d` sedan `w`
- Notation för ackord
  - `<C-p>`  tryck samtidigt `Ctrl` och `p`
  - `g<C-]>` tryck `g`, sedan `Ctrl` och `]`

## Hur avslutar man Vim

- I normal-läge
  - `:q`     _quit_, avslutar/stänger aktuell fil
  - `:qa`    _quit all_, avslutar alla öppna filer
  - `:wq`    _write quit_, sparar och avslutar
  - `:q!`    avslutar utan att spara

- Eller varför inte
  - `:x`     _exit_, avslutar, sparar bara om ändringar skett
  - `ZZ`     samma som `:x`
  - `ZQ`     samma som `:q!`
