# Förflyttningar

- Gå mellan tecken eller rader (ref: ADM-3A)
  `← h`, `↓ j`, `↑ k`, `→ l`

Finns ännu bättre

- `f{char}` / `t{char}`       Nästa tecken (inkl./exkl.)
- `F{char}` / `T{char}`       Föregående tecken (inkl./exkl.)
- `$`, `g_`                   Sista tecknet i raden (icke-blanka)
- `0`, `^`                    Första tecknet i raden (icke-blanka)

- `/pattern<CR>`              Skanna dokumentet
  - `n`, `N`                  nästa/föregående match
- `gg`                        Första raden i filen
- `G`                         Sista raden i filen

# word vs WORD
word är sepererade av whitespace och/eller punkt, medans WORD är enbart mellan whitespace.

- `w`, `W`                    Hoppa till nästa word/WORD
- `e`, `E`                    Hoppa till slutet av word/WORD
- `b`, `B`                    Backa till förgående word/WORD
- `(`, `)`                    nästa/förgående mening
- `{`, `}`                    nästa/förgående paragraf

- `%`                         Hoppa matchande (/{/[
