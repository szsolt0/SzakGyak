# Tesztelési Követelmények

## Funkcionális Tesztek

### Atomikus Mentés

**Cél:** Ez a teszt ellenőrzi, hogy a fájlok mentése atomikusan
történik-e: a rendszer először egy ideiglenes fájlba (`.tmp`) írja az adatokat,
majd egy átnevezéssel (**rename**(2)) cseréli le a végleges fájlt.

**Tesztelési lépések:**
Linux alatt az aláppi paranccsal tesztelhető:

```bash
strace -p $game_pid -e trace=openat,rename,renameat,write
```

Az alábbi példa a jelenlegi prototípusból származik, amikor a játék elmenti a
`settings.ini` fájlt:

```
openat(AT_FDCWD, "/home/laptopgamer/.local/share/godot/app_userdata/SzakGyak/settings.ini.tmp", O_WRONLY|O_CREAT|O_TRUNC, 0666) = 31
write(31, "[volume]\n\nmaster=0\nsfx=30\nmusic="..., 139) = 139
rename("/home/laptopgamer/.local/share/godot/app_userdata/SzakGyak/settings.ini.tmp", "/home/laptopgamer/.local/share/godot/app_userdata/SzakGyak/settings.ini") = 0
```

**Elvárt eredmény:**
A lényeg, hogy a **rename**(2) rendszerhívás végzi a fájl cseréjét, mivel ez
garantálja az atomikus frissítést: a végleges fájl csak teljes, sértetlen
tartalommal kerül a helyére.

Ha a Godot Linuxon ezt a módszert használja, akkor nagy valószínűséggel macOS-en
és Windows-on is hasonlóan működik, mivel mindkét rendszer biztosít hasonló,
atomikus fájlcsere-funkciót.

### Config fájl kezelése és mentése

Biztosítani, hogy a konfigurációs fájl (`settings.ini`) helyesen töltődik be,
módosul, és atomikusan mentődik, így a beállítások megőrződnek és nem sérülnek.

**Cél:** Biztosítani, hogy a konfigurációs fájl helyesen töltődik be, módosul,
és elmentődik, így a beállítások megőrződnek és nem sérülnek.

**Tesztelési lépések:**

1. Betöltés ellenőrzése:
    - Indítsd el a játékot, és ellenőrizd, hogy a `settings.ini` fájlban tárolt
      beállítások helyesen töltődnek be
    - Teszteld, hogy ha a fájl nem létezik, a játék létrehozza az
      alapértelmezett beállításokat.
2. Módosítás és mentés:
    - Végezz módosításokat a beállításokban a játék felületén
    - Mentsd el a beállításokat.
    - Ellenőrizd, hogy a mentett `settings.ini` tartalma megfelel a módosításoknak
      (tartalom, formátum, karakterkódolás).
3. Hibakezelés:
    - Teszteld, hogy sérült vagy hiányzó `settings.ini` esetén a játék helyesen
      reagál

**Elvárt eredmény:**

- A `settings.ini` beállítások helyesen töltődnek be és módosulnak.
- Hibás vagy hiányzó fájl esetén a játék stabilan működik,
  és helyes alapbeállításokat használ.

### Fordítások kezelése és működése

**Cél:** Ellenőrizni, hogy a játék helyesen kezeli a fordításokat, megfelelően
betölti a translations mappában lévő nyelvi fájlokat, és a szövegek helyesen
jelennek meg a támogatott nyelveken.

Tesztelési lépések:

1. Fordítási fájlok jelenléte:
    - Ellenőrizd, hogy a translations mappában megtalálhatók az adott nyelvi
      almappák (`en_US`, `hu_HU`, etc.).
    - Biztosítsd, hogy ezek az almappák tartalmazzák a megfelelő fordítási
      fájlokat (`.csv` forrás és Godot által generált `.translation`).
2. Nyelv betöltése:
    - Indítsd el a játékot egy nyelven (pl. angol), ellenőrizd, hogy a megjelenő
      szövegek angolul jelennek meg.
    - Váltsd át a játék nyelvét magyarra a beállításokban.
    - Ellenőrizd, hogy a szövegek magyar fordításban jelennek meg.
3. Teljesség és konzisztencia:
    - Ellenőrizd, hogy nincs hiányzó vagy hiányosan fordított szöveg (pl. nem
      jelenik meg kulcsszó vagy angol szöveg marad magyar nyelven).
    - Biztosítsd, hogy a formázások (pl. sortörések, speciális karakterek)
      helyesen jelennek meg mindkét nyelven.
4. Új nyelv hozzáadása:
    - Teszteld, hogy újabb nyelvi almappa hozzáadása esetén (pl. `de_DE`) a
      játék felismeri és betölti a fordítást, ha a fájlok megfelelőek.
5. Hibakezelés:
    - Teszteld, hogy hiányzó fordítás esetén a játék nem omlik össze, hanem a
      kulcs nevét adja vissza. (pl. `BTN_PLAY`, `BTN_QUIT`)

**Elvárt eredmény:**

- A fordítások helyesen töltődnek be és jelennek meg.
- A nyelvváltás zökkenőmentes és minden szöveg fordított.
- A hiányzó vagy hibás fordítások nem okoznak játékhibát.

## Alapjáték Mechanikák

### Játékos állapotváltozások tesztelése

**Cél:** Annak ellenőrzése, hogy a játékos fő mutatói (éhség, stressz, alkohol,
reputáció) megfelelően változnak a játékmenet során, a beállított logika
szerint.

**Tesztelési lépések:**

1. Indítsd el a játékot új mentéssel, minden mutató alapértéken.
2. Éhség tesztelése:
    - Ne végezz étkezési cselekményt a játékban.
    - Idő gyorsítása (ha van ilyen funkció) vagy várakozás természetes módon.
    - Figyeld, hogy az éhség értéke folyamatosan nő
3. Stressz tesztelése:
    - Végezz olyan cselekményeket, amelyek növelik a stresszt (pl. kudarc
      munkahelyen, negatív esemény bekövetkezése).
    - Ellenőrizd, hogy a stressz értéke a megadott mértékben nő.
4. Alkoholszint tesztelése:
    - Fogyassz alkoholt a játékban.
    - Ellenőrizd, hogy az alkoholszint növekedjen.
    - Várakozz, és figyeld, hogy az alkoholszint idővel csökken.
5. Reputáció tesztelése:
    - Hajts végre pozitív és negatív hatású cselekményeket (pl. segítés
      szomszédnak vs. lopás).
    - Ellenőrizd, hogy a reputáció a megfelelő irányban változik.

**Elvárt eredmény:**

- Éhség: az érték folyamatosan változik az idő múlásával, és étkezés után
  visszaáll az előírt mértékre.
- Stressz: növekszik negatív események hatására, csökken pihenés vagy pozitív
  események után.
- Alkohol: fogyasztáskor azonnal nő, majd az idő előrehaladtával folyamatosan
  csökken.
- Reputáció: a játékos döntései közvetlen hatással vannak rá.

### Családtagok éhség- és halálmechanikájának ellenőrzése

**Cél:** Annak ellenőrzése, hogy a családtagok éhségmutatója helyesen változik,
és hogy a halálmechanika a tervezett feltételek szerint aktiválódik.

Tesztelési lépések:

1. Indítsd el a játékot új mentéssel, minden családtag éhségértékét
   alaphelyzetbe állítva.
2. Éhség növekedésének tesztelése:
    - Ne etesd a családtagokat egy teljes játéknapig.
    - Jegyezd fel minden időegységben (pl. óránként vagy naponta) az éhség
      értékét.
    - Ellenőrizd, hogy az éhségmutató folyamatosan nő a beállított szabályok
      szerint.
3. Éhség csökkenésének tesztelése:
    - Etesd meg a családtagot a megfelelő étellel.
    - Ellenőrizd, hogy az éhségérték azonnal csökken a specifikált mértékben.
4. Halálfeltétel tesztelése:
    - Hagyd, hogy a családtag éhsége elérje a maximális értéket.
    - Ellenőrizd, hogy a halálmechanika aktiválódik, és a családtag állapota
      "halott"-ra vált.
5. Halál hatásának tesztelése a játékmenetre:
    - Figyeld meg, hogy a családtag halála befolyásolja-e a játékos mutatóit
      (pl. stressz növekedése, reputáció változása).
    - Ellenőrizd, hogy a halott családtaggal már nem lehet interakcióba lépni
      (pl. etetés, beszélgetés).

**Elvárt eredmény:**

- Az éhség értéke idővel folyamatosan nő, ha nem történik etetés.
- Etetés hatására az éhség azonnal csökken a tervezett mértékben.
- Ha az éhség eléri a halálküszöböt, a családtag állapota „halott”-ra vált.
- A halál közvetlen hatással van a játékos állapotára és a játékmenetre, a
  tervezett logika szerint.

### Morális döntések megfelelő működése és következmények nyomon követése

**Cél:** Annak ellenőrzése, hogy a játékbeli morális döntések megfelelően
aktiválódnak, a játékos döntése rögzül, és a későbbi játékmenetben a tervezett
következmények jelentkeznek.

**Tesztelési lépések:**

1. Kezdőállapot rögzítése:
    - Indítsd el a játékot új mentéssel.
    - Győződj meg róla, hogy a releváns mutatók (pl. reputáció, stressz, pénz,
      családtagok állapota) ismert kezdőértéken vannak.
2. Morális döntés kiváltása:
    - Lépj be egy olyan eseménybe, amely morális döntést kínál (pl. lopás
      lehetősége, besúgás, családtag éheztetése más cél érdekében).
3. Első opció tesztelése (pl. erkölcsös választás):
    - Válaszd a pozitív, erkölcsös döntést.
    - Jegyezd fel az azonnali változásokat a mutatókban.
    - Játssz tovább addig, amíg a döntés hosszú távú következményei meg nem
      jelennek.
4. Második opció tesztelése (pl. erkölcstelen választás):
    - Ugyanebből a kiindulási állapotból ismételd meg a döntést, de válaszd a
      negatív, erkölcstelen opciót.
    - Jegyezd fel az azonnali változásokat.
    - Figyeld meg, hogy a hosszú távú következmények (pl. reputáció romlása,
      rendőrségi nyomozás, családi kapcsolatok romlása) megjelennek-e.

## Munkavégzési szegmensek működése

### Autószerelés

**Cél:** Annak ellenőrzése, hogy az autószerelés folyamatában az alkatrészek
fogyása, az idő előrehaladása és a munkafolyamat logikája megfelelően működik.

**Tesztelési lépések:**

1. Indítsd el a játékot egy olyan mentéssel, ahol elérhető az autószerelési
   munkalehetőség.
2. Ellenőrizd az aktuális alkatrészkészletet és a rendelkezésre álló időkeretet.
3. Indíts el egy javítási folyamatot.
4. Figyeld meg, hogy az alkatrész a megfelelő mennyiségben fogy-e.
5. Ellenőrizd, hogy a játékidő megfelelő mértékben halad-e előre a munka során.
6. Fejezd be a munkát, majd hasonlítsd össze az eredményt a várttal (bevétel,
   készletcsökkenés, időmúlás).

**Elvárt eredmény:**

- Az alkatrészek pontosan annyival csökkennek, amennyit a feladat előír.
- Az idő múlása konzisztens a feladat időigényével.
- A munka bevétele és kimenetele megfelel a specifikációnak.

### Bolti eladás

**Cél:** Annak ellenőrzése, hogy a boltban a vásárlók viselkedése, a
készletkezelés és a pénzmozgások helyesen működnek.

**Tesztelési lépések:**

- Indítsd el a bolti munkarészt ismert kezdő készlet- és pénzállapottal.
- Kövesd nyomon a vásárlók érkezését és termékválasztását.
- Adj el terméket a vásárlónak.
- Ellenőrizd, hogy a készlet csökkenése pontos, és a pénzösszeg megfelelően
  növekszik.
- Figyeld meg, hogy a vásárlók logikája (pl. várakozás, elhagyás,
  impulzusvásárlás) a specifikáció szerint működik-e.

**Elvárt eredmény:**

- A készlet pontosan a vásárolt termék mennyiségével csökken.
- A bevétel pontosan a termék árának megfelelően növekszik.
- A vásárlói viselkedés megfelel az előre megadott logikai szabályoknak.

### Irodai részleg

**Cél:** Annak ellenőrzése, hogy az irodai feladatok helyesen működnek, az
interakciók rögzülnek, és a feladatok teljesítése után a jutalmak és
következmények megfelelőek.

**Tesztelési lépések:**

- Lépj be az irodai részlegbe.
- Végezz el egy adminisztratív feladatot (pl. papírok kitöltése, adatbevitel).
- Ellenőrizd, hogy a feladat befejezése után a jutalom (pl. pénz, reputáció)
  pontosan jóváírásra kerül.
- Figyeld meg, hogy a feladat közbeni döntések (ha vannak) rögzülnek-e és
  befolyásolják-e a későbbi játékmenetet.

**Elvárt eredmény:**

- A feladat sikeres teljesítése után a jutalmak és következmények a specifikáció
  szerint jelentkeznek.
- A feladat során hozott döntések maradandó hatással bírnak.

## Interakciók és Események

### Véletlenszerű események aktiválása és változatai

**Cél:** Biztosítani, hogy a játékban megjelenő véletlenszerű események mind
aktiválódnak, és a különböző változataik helyesen jelennek meg, működnek.

Tesztelési lépések:

1. Előkészítés:
    - Indíts el egy új játékot vagy tölts be egy olyan mentést, ahol a
      véletlenszerű események aktiválódásának feltételei adottak (pl. idő
      eltelt, adott állapotok).
2. Automatizált eseménygenerálás:
    - Használj egy teszt scriptet vagy játékmódot, amely többször (pl.
      1000-szer) lefuttatja az eseménygenerálást.
    - Minden alkalommal naplózd az aktivált esemény azonosítóját és a
      változatot.
3. Változatok lefedettségének ellenőrzése:
    - Ellenőrizd, hogy az összes definiált esemény és az összes ismert variáció
      legalább egyszer aktiválódott-e a futtatások során.
4. Funkcionális helyesség:
    - Véletlenszerűen válassz ki néhány eseményt és variációt.
    - Játsszd le manuálisan vagy automatikusan az eseményt, ellenőrizve, hogy az
      esemény ténylegesen a specifikációnak megfelelő hatást váltja ki (pl.
      mutatók változása, játékállapot módosulása).
5. Edge esetek vizsgálata:
    - Teszteld, hogy a véletlenszerű események nem lépnek fel olyan körülmények
      között, amelyek nem megengedettek (pl. nem aktiválódnak, ha a játékos
      állapota nem felel meg).

**Elvárt eredmény:**

- Az összes véletlenszerű esemény és variáció legalább egyszer előfordul a
tesztek alatt.
- Az események hatásai megfelelnek a játéktervezői szándéknak és
specifikációnak.
- Nem történik nem kívánt esemény aktiválás nem megfelelő körülmények között.

### Lopási mechanika működése

**Cél:** Tesztelni, hogy a lopási mechanika működése helyes, beleértve az első
és második lebukás következményeit, illetve hogy ezek a játékállapotra és a
karakterre gyakorolt hatások megfelelnek a specifikációnak.

**Tesztelési lépések:**

1. Indítsd el a játékot egy olyan helyzetből, ahol lopás lehetséges.
2. Végezzen el egy lopási kísérletet, amely sikeres vagy lebukással járhat
   (szimuláld mindkét esetet).
3. Ha az első lopás lebukással jár:
    - Ellenőrizd, hogy a játék megfelelően kezeli az első lebukás
      következményeit (pl. reputáció csökkenése, büntetés, figyelmeztetés).
4. Végezzen el egy második lopási kísérletet, és ha ez is lebukással jár:
    - Ellenőrizd a második lebukás súlyosabb következményeit (pl. jogi eljárás,
      családtagok reakciója, játékállapot módosulása).
5. Ellenőrizd a játékos állapotváltozóit, a játék világának reakcióit mindkét
   eset után.
6. Figyeld meg, hogy a lopási mechanika nem engedélyezi a lopást indokolatlan
   helyzetben (pl. ha a játékos már túl sokszor bukott le).

**Elvárt eredmény:**

- Az első lebukás következményei az előírtak szerint jelentkeznek, és a játék
  állapota megfelelően frissül.
- A második lebukás súlyosabb, hosszabb távú következményekkel jár.
- A lopás lehetősége és kimenetele logikusan, a játékszabályok szerint történik.
- Nem fordul elő inkonzisztens vagy váratlan viselkedés a lopási mechanika
  során.

### Alkoholhasználat hatása a mutatókra

**Cél:** Biztosítani, hogy az alkohol fogyasztása a játékban helyesen módosítja
a játékos és családtagok mutatóit (pl. stressz, éhség, reputáció, reakcióidő),
és hogy ezek a változások idővel megfelelően visszaállnak vagy tovább hatnak.

Tesztelési lépések:

1. Előkészítés:
    - Indíts el egy játékot olyan állapotból, ahol a játékos és családtagok
      mutatói normál értékeken vannak.
2. Alkohol fogyasztása:
    - Fogyassz alkoholt a játékban a megfelelő mennyiségben
3. Mutatók változásának ellenőrzése:
    - Közvetlenül az alkohol fogyasztása után mérd meg a releváns mutatókat (pl.
      stressz csökken vagy nő, reakcióidő romlik, éhség szintje változik,
      reputáció módosul).
      Rögzítsd az értékeket, hogy össze tudd hasonlítani a várható és a
      tényleges hatást.
4. Időbeli hatás vizsgálata:
    - Játssz tovább, figyeld meg, hogyan változnak a mutatók idővel (pl. az
      alkohol hatásának csökkenése, hosszú távú következmények).
    - Ellenőrizd, hogy az alkohol hatása nem marad fenn örökre, illetve hogy az
      esetleges negatív következmények megfelelően érvényesülnek (pl. reggeli
      másnaposság).
5. Különböző helyzetek tesztelése:
    - Teszteld, hogy az alkohol hatása eltérő-e különböző karaktereken (pl.
      játékos vs családtagok).
    - Vizsgáld, hogy az alkoholhasználat nem okoz hibás viselkedést, vagy nem
      vezet játék összeomláshoz, hibákhoz.

**Elvárt eredmény:**

- Az alkohol fogyasztása után a mutatók az előírt módon változnak.
- A hatások idővel csökkennek, nem maradnak fenn tartósan.
- Az eltérő adagok különböző hatásokat eredményeznek.
- Nincs nem kívánt viselkedés vagy játékhiba az alkoholhasználat miatt.

<!-- ==== OLD VERSION ===== -->

<!--### Alapjáték Mechanikák

-   Játékos állapotváltozások tesztelése (éhség, stressz, alkohol,
    reputáció)

-   Családtagok éhség- és halálmechanikájának ellenőrzése

-   Morális döntések megfelelő működése és következmények nyomon
    követése

-   Munkavégzési szegmensek működése:

    -   Autószerelés (alkatrészhasználat, időkezelés)

    -   Bolti eladás (vásárlók logikája, pénztranzakciók)

    -   Irodai részleg (adminisztratív interakciók, ha van
        implementálva)

### Interakciók és Események

-   Véletlenszerű események aktiválása és változatai

-   Lopási mechanika működése (első és második lebukás következményei)

-   Alkoholhasználat hatása a mutatókra

-   Játékbeli döntések hatásának vizsgálata a hosszú távú túlélésre-->
