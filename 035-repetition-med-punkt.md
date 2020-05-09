# Repetation med `.`

- `.` (punkt) repeterar senaste kommandot. En av de bästa funktionerna i vim.
- `.` repeterar senaste inserten

Exempel

- `x` tar bort ett tecken
- `>G` indenterar resten av filen

> Sträva efter repeterbara kommandon

Exempel: lägg till kommatecken på varje rad

- Alternativ 1
  - `$a;` hoppa till sista tecknet (`$`), appenda, skriv ;
  - `<ESC>` gå till _normal mode_
  - `j$.` gå ner en rad, sista tecknet, repetera insert
- Alternativ 2
  - `A;` appenda i slutet av raden, skriv ;
  - `<ESC>` gå till _normal mode_
  - `j.` gå ner en rad, repetera insert

```js
var foo = 1
var bar = 'a'
var foobar = foo + bar
```

Exempel: Lägg in mellanrum runt +. Tänk repeterbart.

- `f+`                    gå till nästa + på raden
- `s`, `␣+␣`, `<ESC>`     ta bort tecknet under pekaren, gå till insert, skriv
                          tecken, gå till normal mode
- `;`                     gå till nästa sökmatch
- `.`                     repetera insert

```js
var foo = 'method('+arg1+','+arg2+')';
```

## Repetition med siffror

En siffra framför ett kommando repeterar det _n_ gånger

- `5dd` tar bort 5 rader
- `10.` gör om senaste kommandot 10 gånger
- `10j` går ner 10 rader

## Repeterbarhet

    Ponera att vi vill ta bort ett ord från den här texten och att vi står på
    sista tecknet i någon av raderna.

1. `dbx`, `d`elete, `b`ackwards  
    Men sista tecknet lämnas, så vi måste ta bort det med `x`
2. `bdw`, `b`eginning of word (move to), `d`elete until end of `w`ord
3. `daw`, `d`elete `a` `w`ord (med whitespace)

Hur repeterbara är alternativen

1. `.` repeterar `x`
2. `.` repeterar `dw`
3. `.` repeterar `daw`
