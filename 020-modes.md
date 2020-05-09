# Lägen (modes)

Vim opererar i olika lägen, extremt kraftfullt när man vant sig. Ofta spenderar
man mer tid att förflytta sig eller redigera i dokument än att skriva löptext.

- Normal mode
- Insert mode
- Visual mode
- Command-line mode

> Gör korta ändringar (inserts) och gå tillbaka till normalläget.
>
> `u` ångrar senaste insert
> `.` repeterar senaste insert/kommandot

## Normal mode

- Läget vim startar i
- `<ESC>` tar dig tillbaka
- Nästan alla kommandon är i normalläget

## Insert mode

- Skriv text, kan byta dit på många olika sätt

- `i`, `I`     insert, innan tecknet/i början av raden
- `a`, `A`     append, efter tecknet/i slutet av raden
- `o`/`O`      lägg till en ny rad under/över och byt till insert
- `s`/`S`      ta bort tecknet/raden och gå till insert

- Piltangenterna skapar nya _undo chunks_ i insert mode, `u`/`<C-R>` ångrar/gör
  om senaste

## Visual mode

- Markera text och gör saker med den
  - `v`        character visual mode
               kan kombineras med förflyttningar: `vtg`
  - `V`        line visual mode
  - `<C-v>`    block mode
  - `gV`       återvälj senaste markering
  - `o`        gå till andra änden av markering

Kan redigera flera rader samtidigt med markering och `I`/`A`


## Command-line mode

- `:`
- `:w`                      spara filen
- `:e filnamn`              redigera _filnamn_
- `:%!python3 -m json.tool` ta hela filinnehållet (`%`), kör ett kommando (`!`)
                            och lägg tillbaka resultatet

Kan skriva ex-kommandon, starta terminalkommandot, et c.
