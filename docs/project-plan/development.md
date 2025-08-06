# Fejlesztési Terv

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

A játék technikai működésének implementálása, az alap játékrendszer megalkotása, és egy kezdetleges, tesztelhető demo verzió elkészítése.

### Konkrét tevékenységek:

- **Rendszerterv véglegesítése és dokumentálása**:

  - A rendszerterv dokumentációjának elkezdése, részletes átbeszélése és lezárása.
  - Moduláris rendszer kialakítása: UI, eseménykezelés, játékmenet, mentés/betöltés.
  - Adatkezelési stratégia rögzítése: JSON-alapú mentési rendszer.

- **Godot mappa- és projektstruktúra kialakítása**:

  - Egységes mappastruktúra megbeszélése és kialakítása a Godot projekten belül.
  - `tscn` világok koncepciójának kidolgozása: minden csapattag egy-egy játéktérért felel.
  - Külön világok (pl. shop, office, carshop) létrehozása külön `.tscn` fájlokként.

- **Script rendszer tervezése és megvalósítása**:

  - Scriptelési elvek és konvenciók átbeszélése, közös struktúra kialakítása.
  - Feladatmegosztás a csapattagok között: különböző funkciók (HUD frissítés, navigáció, események kezelése) szétosztása.
  - Scriptek fejlesztésének megkezdése és integrációja az egyes játékrészekbe.

- **Grafikai munka előrehaladása**:

  - A grafikai elemek kb. 80%-os elkészítettsége: háttérképek, tárgyak, UI elemek, karakterek.
  - Már létező grafikai assetek integrálása a Godot jelenetekbe.

- **Játszható demo prototípus elkészítése**:
  - A létrehozott `tscn` világok és scriptek összehangolása.
  - Interaktív ciklus kialakítása: reggel → munkahely → este → visszajelzés.
  - Belső, csapatszintű prototípus-tesztelés.
  - Hibák azonosítása, első visszajelzések alapján korrekciók.

### Kiosztandó feladatok:

- **Godot technikai felelős**:
  - Mappastruktúra és projekt setup koordinálása.
- **Scriptfelelős(ök)**:
  - Script struktúra kialakítása, scriptek leosztása és integrálás.
- **Grafikusok**:
  - Hátralévő assetek elkészítése és jelenetekbe illesztése.
- **Dokumentációfelelős**:
  - Rendszerterv dokumentáció megírása és karbantartása.

### Elvárt eredmények a 6. hét végére:

- Rendszerterv végleges és dokumentált formában elérhető.
- Egységes Godot mappa- és projektstruktúra.
- Script rendszer működő elemei: alap játékmeneti logika megvalósítva.
- Játszható prototípus létrehozása a külön játéktér- és scriptmodulok integrálásával.
- Grafikai elemek többségének elkészítése és beépítése.
- Belső tesztelés és első hibajegyzék összeállítása.

## 7–8. hét: **Finomhangolás és Kiadásra Kész Verzió**

### Cél:

A játék véglegesítése, teljes funkcionalitás megvalósítása, tesztelése és kiadásra alkalmas állapotba hozása.

### Konkrét tevékenységek:

- **Funkciók bővítése és finomhangolása**:

  - A konzultációkon korábban kijelölt összes játékfunkció megvalósítása.
  - Munkarendszer kiegyensúlyozása: fizetés, stressz, morális döntések hatásainak finomhangolása.
  - Változók és rendszerek véglegesítése: reputáció, éhség, alkohol, család.

- **Scriptek és jelenetek (tscn) javítása és kiegészítése**:

  - Hibás vagy nem működő szkriptek javítása.
  - Kiszámíthatatlan viselkedések és edge-case hibák kezelése.
  - Különböző jelenetek (világok) és logikák végleges összekapcsolása.

- **Véletlenszerű eseményrendszer implementálása**:

  - További események beépítése (pl. NAV-ellenőrzés, gyerekszületés, betegség).
  - Események hatásának szimulációja és tesztelése.

- **Tesztelés**:

  - Tesztelési terv összeállítása.
  - Belső csapattagok és külső (felhasználói) tesztelők bevonása.
  - Manuális hibakeresés, buglista vezetése, prioritás szerinti javítás.
  - Játék gépigényének felmérése különböző rendszereken.

- **UI és grafikai polish**:

  - Animációk, vizuális átmenetek, hanghatások integrálása.
  - Napló és statisztikai visszajelzések pontos megjelenítése.
  - Teljes textúrakészlet lezárása, stílusbeli egységesség biztosítása.
  - Kisebb textúrák finomhangolása, újraírás, ahol szükséges.

- **Játék végi állapotok beépítése**:

  - Többféle lehetséges befejezés: éhenhalás, emigráció, kiégés, rendszerváltás.
  - Befejezésekhez tartozó logika és animációk implementálása.

- **Végső dokumentáció és build**:
  - Végső SRS, fejlesztési napló és felhasználói útmutató elkészítése.
  - Kész játék exportálása és végleges build létrehozása.
  - Prezentáció a gyakorlatvezető felé: játék bemutatása, dokumentációk leadása.

### Kiosztandó feladatok:

- **Tesztelési felelős**:
  - Teszttervek készítése, hibák összegyűjtése és priorizálása.
- **Technikai felelős**:
  - Script- és jelenetlogika véglegesítése, hibák javítása.
- **Grafikai felelős(ök)**:
  - Textúrák lezárása, polish, UI finomhangolás.
- **Dokumentációfelelős**:
  - Végső dokumentumok megszerkesztése és formázása.
- **Konzultációs felelős**:
  - Konzultációkon vállalt célok teljesülésének ellenőrzése.

### Elvárt eredmények a 8. hét végére:

- Végleges, játszható és stabil játékverzió elkészítése.
- A játékban megtervezett összes funkció működik.
- Teljes grafikai stílus és UI megvalósítása.
- Befejezett és ellenőrzött dokumentációcsomag.
- Sikeres prezentáció és játék kiadása.

### Megjegyzés a projektmenedzsmenthez:

Minden hét végén **belső review** zajlik, ahol a csapat értékeli az aktuális állapotot, rögzíti a problémákat, és kijelöli a következő sprint feladatait. A projekt során Exceles nyilvántartást is alkalmazunk a státuszok követésére, ahol a munkakiosztás látható, illetve minden csapattag saját feladatainak vázolása repository commit-tal együtt.
