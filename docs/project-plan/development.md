# Fejlesztési Terv – Részletes Projektütemezés

A játékfejlesztés egy **8 hetes projekt** keretében valósul meg, amely során a csapat meghatározott feladatokat és célokat teljesít hétről hétre. A projektmenedzsment Scrum-szerű, heti háromszori egyeztetésen alapul. A cél egy **játszható, kiadásra kész játék** fejlesztése, amely reflektál a szocializmus alatti munkavállalói dilemmákra.

## 1–2. hét: **Koncepcióalkotás és Tervezés**

### Cél:

A játék alapötletének konkretizálása, mechanikák definiálása, fejlesztési alapok lefektetése.

### Konkrét tevékenységek:

- **Játékkoncepció véglegesítése**:

  - A történeti háttér, játékos célok és játékmenet fő struktúrájának meghatározása.
  - Alap játéktörténet átbeszélése: a játékos és családja túlélése a szocializmusban.

- **Mechanikák és mutatók kidolgozása**:

  - Éhség, stressz, reputáció, alkoholszint mint játékmechanikai változók definiálása.
  - Morális döntések rendszerének vázolása.

- **Projektterv összeállítása**:

  - Projektstruktúrák, sprintciklusok kialakítása.
  - Work-log sablon létrehozása, csapattagok aktivitásának nyomon követésére.
  - Játékkomponensek és eszközkategóriák (grafika, UI, mechanikák, dokumentáció) strukturált szétválasztása.

- **Csapatmunka és szerepkiosztás**:

  - Projektmenedzser kiválasztása.
  - Munkafolyamatok (grafika, fejlesztés, dokumentáció) átbeszélése.
  - Eszközök egyeztetése: Git/GitHub, Godot Engine, MkDocs.

- **Technikai beállítások és tréningek**:

  - Main GitHub repository létrehozása.
  - MkDocs dokumentációs keretrendszer telepítése és konfigurálása.
  - Forkolás, pull requestek és merge működésének gyakorlása.
  - Weboldalszerkesztés MkDocs alatt: kezdőoldal szerkesztése, nav-struktúra kiépítése.

- **Egyeztetés a gyakorlatvezetővel**:
  - Projektterv és koncepció átbeszélése.
  - Technikai megvalósítási lehetőségek és kihívások megbeszélése.

### Kiosztandó feladatok:

- Projektmenedzser: munkafolyamat koordinálása, határidők nyilvántartása.
- Dokumentációfelelős(ök): projektterv, vízió, SRS, work-log kidolgozása.
- Technikai felelős: repositoryk létrehozása, Git/Godot struktúra inicializálása.
- Webfelelős: MkDocs betanulása, weboldal felépítése és tesztelése.
- Konzultációs felelős: egyeztetés szervezése és dokumentálása a gyakorlatvezetővel.

### Elvárt eredmények a 2. hét végére:

- Projektterv és vízió dokumentum elkészítése.
- GitHub repository és forkolt tárolók létrehozása.
- MkDocs oldal alapszintű működése.
- Csapaton belüli szerepkörök tisztázása.
- Webes dokumentációs szerkezet alapjainak kiépítése.
- Eredmények bemutatása a gyakorlatvezetőnek.

## 3–4. hét: **Grafikai Elemek és Logikai Modell**

### Cél:

A játék vizuális stílusának kialakítása, az analízis modell alapjainak lefektetése, valamint a játékmenet logikai struktúrájának és kezelőfelületének megtervezése.

### Konkrét tevékenységek:

- **Analízis modell megalapozása**:

  - Megbeszélés az analízis modellbe kerülő elemekről (use case diagram, osztálydiagram, állapotdiagram).
  - Alap játékmeneti ciklus és események rendszerezése (pl. reggel → munka → este → pihenés).
  - A játéklogika és történet szorosabb integrációja: játékos feladatai, célok, morális döntések helye és szerepe.

- **Grafikai koncepciók kidolgozása**:

  - Minden csapattag prezentálta saját elképzelését a játék kinézetéről.
  - A látványvilág közös kialakítása megbeszélés és konszenzus alapján.
  - Stílusirányzat kiválasztása: **2D pixel art**, tompított, szocialista korszakra jellemző színpalettával.

- **Felhasználói felület (HUD) és menürendszer tervezése**:

  - Játék közbeni HUD elemek megbeszélése és listázása:
    - Status HUD (éhség, stressz, reputáció, alkoholszint).
    - Family HUD (családtagok állapota).
    - Time és pénzegység (gold) kijelzés.
  - Main Menu struktúrájának megbeszélése: új játék, folytatás, kilépés.

- **Grafikai elemek elkészítése**:
  - HUD és Main Menu grafikai elemeinek megalkotása.
  - Három helyszínhez tartozó alap assetek elkészítése:
    - **Shop** (bolt).
    - **Carshop** (autószerelő műhely).
    - **Office** (iroda).
  - Egységes vizuális nyelv kialakítása a helyszínek között.

### Kiosztandó feladatok:

- **Analízis felelős(ök)**:
  - Use case, osztálydiagram és állapotgép kidolgozása.
- **Grafikusok**:
  - HUD és helyszínek látványvilágának kidolgozása.
- **UI/UX felelős**:
  - Menürendszer és HUD felhasználói útvonalainak és elrendezésének tervezése.
- **Történetfelelős**:
  - A játéktörténet és játékmeneti döntési pontok részletezése.

### Elvárt eredmények a 4. hét végére:

- A játék látványvilágának alapjainak rögzítése és elfogadása.
- Legalább három helyszínhez tartozó grafikai assetek elkészítése.
- HUD és Main Menu fő grafikai elemeinek elkészítése.
- Analízis modell kezdeti verziója (use case, osztálydiagram, állapotgép).
- A játékmenet logikájának alapvető struktúrája és dokumentálása.
- Továbblépés előkészítése a rendszertervezés irányába (5–6. hét).

## 5–6. hét: **Rendszertervezés és Játszható Prototípus**

### Cél:

A játék technikai működésének implementálása és játszható verzió bemutatása.

### Konkrét tevékenységek:

- **Rendszerterv véglegesítése**:
  - Modulstruktúra (UI, játékmenet, események, döntések, mentés).
  - Adatkezelés és állapotkövetés módja (pl. JSON alapú mentés).
- **Godot rendszer implementáció**:
  - Scene tree struktúra kialakítása.
  - Script-ek leosztása: statussáv frissítések, navigáció, eseménykezelés.
- **Funkciók implementálása**:
  - Munkarendszer: választható állások, fizetés, következmények.
  - Döntési pontok, morális választások (pl. kenőpénz elfogadása).
  - Életciklus: reggel indulás → munka → este haza → napi visszajelzés.
- **UI logika és képernyőváltások** (navigációs nyilak, hotspot interakció).
- **Prototípus tesztelése**:
  - Belső, csapatszintű tesztelés: működik-e a napi ciklus?
  - Feedback gyűjtés és korrekció.

## 7–8. hét: **Finomhangolás és Kiadásra Kész Verzió**

### Cél:

A játék véglegesítése, tesztelése, és publikálásra alkalmas állapotba hozása.

### Konkrét tevékenységek:

- **Funkciók bővítése és finomhangolása**:
  - Munkák közti egyensúly: pénz/stressz kockázatok igazítása.
  - Döntések következményeinek kódolása (pl. állami munka → reputáció növelés).
- **Véletlenszerű eseményrendszer implementálása**:
  - Pl. NAV-ellenőrzés, gyerekszületés, beteg családtag.
- **Tesztelés**:
  - Manuális és strukturált tesztelés (felhasználói tesztelők is bevonva).
  - Hibajegyzék vezetése, bugfixek végrehajtása.
- **UI optimalizálás és polish**:
  - Animációk, átmenetek, hanghatások.
  - Napló, statisztikák, pontozás megjelenítése.
- **Játék végi állapotok programozása**:
  - Lehetséges befejezések: éhenhalás, kiégés, rendszerváltás, emigráció stb.
- **Végleges build összeállítása és prezentálása a gyakorlatvezetőnek.**
  - Dokumentációk leadása: végső SRS, fejlesztési napló, felhasználói útmutató.

### Megjegyzés a projektmenedzsmenthez:

Minden hét végén **belső review** zajlik, ahol a csapat értékeli az aktuális állapotot, rögzíti a problémákat, és kijelöli a következő sprint feladatait. A projekt során Jira-táblát vagy Exceles nyilvántartást is alkalmazunk a státuszok követésére.
