# Sök och ersätt

## Sök

- /search        sök nedåt efter regex
- ?search        sök uppåt efter regex

# Sök special karaktärer
- .             Matchar vilken karaktär som helst
- ^             Matchar början av en rad
- $             Matchar slutet av en rad
- \s            Matchar whitespace
- \S            Matchar ICKE-whitespace
- \d            Matchar numerisk karaktär
- \D            Matchar icke numerisk karaktär

## new line \r och inte \n

## :[range]s/search/replace/

- Ersätt alla förekomster och inte enbart första? lägg till ett g i slutet!

- Hela filen? ange % som range.
  :%s/search/replace/g
- Alla förekomster inom ett rad span?
 :8,10 s/search/replace/g

- Sök efter ord markerat ord g\* (frammåt) g# (bakåt)

- Fråga innan ersättning sker?
 :%s/search/replace/gc
