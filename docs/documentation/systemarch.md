
# Rendszertervezés

## Bevezetés

Ez a dokumentum a "Túlélés a Szocializmusban" című túlélő-szimulációs játék rendszertervezését tartalmazza. A cél, hogy bemutassa a játék technikai architektúráját, moduláris felépítését, adatkezelési folyamatait, komponenseit és azok kapcsolatait.

## Áttekintés

- **Játékmotor**: Godot Engine (verzió: 4.x)
- **Célplatform**: PC (Windows/Linux)
- **Grafikai stílus**: 2D (többségében), 3D low-poly az autószerelő minijátékhoz
- **Fejlesztői eszközök**: Blender, GitHub, GIMP/Krita, VS Code
- **Adatformátumok**: JSON, CSV (események, munkák, párbeszédek), PNG/JPG (grafikák), WAV/OGG (hang)

## Rendszerarchitektúra

### Moduláris Felépítés

```
+----------------------+
|   Főmenü / UI        |
+----------------------+
          |
          v
+----------------------+
|   Játékmenet Engine  |
| - Időkezelés         |
| - Eseményrendszer    |
| - Döntéslogika       |
+----------------------+
          |
          v
+----------------------+       +----------------------+
|   Munkamodulok       | <-->  |   Karakterstátusz     |
| - Autószerelő (3D)   |       | - Éhség, stressz       |
| - Bolti eladó (2D)   |       | - Reputáció, függőség  |
+----------------------+       +----------------------+
          |
          v
+----------------------+
|   Családrendszer     |
| - Éhség, események    |
| - Szükségletek        |
+----------------------+
```

## Főbb Modulok

### Játékmenet Vezérlő

- Nap-idő rendszer (reggel 8 – este 8 óra ciklus)
- Döntési pontok kezelése
- Napi események triggerelése
- Mentési/pályaállapot kezelése

### Karakterstátusz Rendszer

- Játékos adatok:
  - Éhség (0–100)
  - Stressz (0–100)
  - Alkoholfüggőség (0–100)
  - Reputáció (pozitív/negatív skála)
- Hatások különböző tevékenységekből és eseményekből
- Állapotváltozás logikája

### Munkahelyek

- **Autószerelő (3D)**: 
  - Jármű azonosítás, alkatrészcserék minijáték formában
  - 3D interakciók (alkatrészkijelölés, csavarozás, időalapú hibák)
- **Bolti eladó (2D)**: 
  - Vásárlók kiszolgálása, készletkezelés, döntések (visszaadás, ellopás stb.)

### Eseményrendszer

- Véletlenszerű és scriptelt események
- JSON/CSV alapú eseménytáblázat
- Eseménytípusok:
  - Morális döntések
  - Hatósági ellenőrzés
  - Betegségek
  - Sztrájkok, leállások

### Családrendszer

- Minden családtaghoz külön éhség- és egészségérték tartozik
- Reakciók eseményekre (pl. gyerek megbetegedése)
- Cél: a család életben tartása

## Adatmodellek

### Játékos.json

```json
{
  "ehseg": 40,
  "stressz": 60,
  "reputacio": -10,
  "alkohol": 30,
  "penz": 1250,
  "csalad": {
    "gyerek1": { "ehseg": 50, "egeszseg": 80 },
    "hazastars": { "ehseg": 60, "egeszseg": 90 }
  }
}
```

### Esemény.csv

```csv
id,típus,leírás,opció1,opció2,következmény1,következmény2
E001,Hatósági ellenőrzés,"Megérkezik az ÁVÓ...","Kifizeted a bírságot","Tagadsz", "-100 pénz", "Reputáció -30"
```

### Adatmodellek véglegesítése és funkcionális modell 

Az alábbi adatmodellek a játék legfontosabb logikai egységeit és állapotait reprezentálják. Ezek JSON-struktúraként vagy osztályszinten is implementálhatók a Godot játékmotorban (GDScript / C#).

```json
{
  "name": "string",
  "hunger": 0.0,
  "stress": 0.0,
  "reputation": 0.0,
  "alcohol_addiction": 0.0,
  "money": 0,
  "inventory": [],
  "job": "string",
  "family": {
    "members": 3,
    "hunger_levels": [0.2, 0.3, 0.1]
  },
  "day": 1
}
```

```json
{
  "job_id": "string",
  "name": "Autószerelő",
  "mechanics": "3D minijáték",
  "reward": 150,
  "stress_gain": 0.2,
  "reputation_effect": 0.05,
  "corruption_opportunity": true
}
```

```json
{
  "event_id": "string",
  "description": "Hatósági ellenőrzés",
  "type": "morális / gazdasági / egészségi",
  "consequences": {
    "reputation": -0.1,
    "money": -50,
    "stress": +0.3
  }
}
```

```json
{
  "item_id": "string",
  "name": "Konzerv",
  "type": "food",
  "hunger_restore": 0.3,
  "value": 50,
  "tradable": true
}
```

 A játék fő funkcióit az alábbi modulokra lehet bontani: Statuszkezelő modul – A játékos és családtagjai állapotát (éhség, stressz, addikció) kezeli és frissíti napi szinten. Eseménymotor – Véletlenszerű és szkriptelt események kezelése a nap végén, különféle következményekkel. Munkarendszer – Foglalkozások logikája, teljesítmény, stressz, pénzkereset és korrupciós lehetőségek számítása...

Felhasználói folyamatok (User Flows): a játékos belép a főmenübe, új játékot indít vagy mentést tölt be. Napi szinten tevékenységeket választ: munka, család, bolt, piálás stb. A nap végén történik az állapotfrissítés, eseménygenerálás és statisztikák frissítése. A játék különböző módokon érhet véget: börtön, halál, külföldre szökés, teljes rendszer túlélése stb.


## Felhasználói Interfész (UI)

### Képernyők

- Főmenü
- Munkaválasztó térkép
- Munkafelület (autószerelő / bolti eladó)
- Karakterstátusz panel
- Családstátusz panel
- Döntési esemény képernyő
- Játék vége képernyő (pontszám, statisztika, befejezés típusa)

### UI Funkciók

- Egérrel történő navigáció
- Tooltip rendszer (státuszleírások)
- Felugró eseménydobozok, gombos választási lehetőségekkel

## Mentési és Betöltési Rendszer

- Mentés struktúrája: JSON fájl a globális játékállapotról
- Kézi mentés és visszatöltés támogatása
- Slot-alapú mentés (3 különböző mentési lehetőség)

## Funkcionális Követelmények

| Azonosító | Leírás |
|-----------|--------|
| F01       | A játékos kiválaszthatja napi munkáját |
| F02       | A státuszértékek folyamatosan változnak |
| F03       | Események jelennek meg, amik döntést követelnek |
| F04       | A család éhségértékeit is kezelni kell |
| F05       | A játék többféle befejezéssel zárulhat |
| F06       | A döntések hatással vannak a karakterre és világra |

## Nem-funkcionális Követelmények

| Azonosító | Leírás |
|-----------|--------|
| NF01      | A játék 30 FPS mellett is zökkenőmentesen fusson |
| NF02      | Kis memóriahasználat és alacsony gépigény |
| NF03      | Könnyen lokalizálható szövegfájlok |
| NF04      | A rendszer modulárisan bővíthető legyen új munkákkal és eseményekkel |

## Tesztelési Stratégia

- **Egységtesztek**: státuszfrissítések, eseménylogika
- **Integrációs tesztek**: UI és játékállapot szinkronizáció
- **Felhasználói tesztelés**: különböző végkimenetelek próbája
- **Teljesítményteszt**: régebbi gépeken való futás

## Verziókövetés és Fejlesztési Módszertan

- **GitHub**: privát repó, főág és fejlesztői ágak
- **Branch Policy**: feature branch-ek, pull request, review kötelező
- **Issue Tracking**: GitHub Issues / Projects
- **Dokumentáció**: Markdown formátumban, repóban tárolva

## Biztonság és Mentési Mechanizmusok

- Mentés titkosítás nem szükséges, de backup javasolt
- Hibakezelés: exception-logging, fallback értékek
- Hiba esetén automatikus visszatérés az utolsó stabil mentéshez

## Jövőbeli Bővítések

- Harmadik munkalehetőség (irodai adminisztrátor)
- Statisztikai és naplózási rendszer
- Steam integráció (achievementek)
- Android/iOS port
- Multiplayer támogatás (későbbi verzióban)

## Zárszó

A "Túlélés a Szocializmusban" nem csupán egy játék, hanem társadalmi és etikai reflexió is. A rendszerterv célja, hogy egy jól strukturált, modulárisan bővíthető és hosszú távon fenntartható alapot biztosítson ehhez a különleges játéktípushoz.

