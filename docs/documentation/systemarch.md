
# Rendszertervezés – *Túlélés a Szocializmusban*

## 1. Bevezetés

Ez a dokumentum a "Túlélés a Szocializmusban" című túlélő-szimulációs játék rendszertervezését tartalmazza. A cél, hogy bemutassa a játék technikai architektúráját, moduláris felépítését, adatkezelési folyamatait, komponenseit és azok kapcsolatait.

## 2. Áttekintés

- **Játékmotor**: Godot Engine (verzió: 4.x)
- **Célplatform**: PC (Windows/Linux)
- **Grafikai stílus**: 2D (többségében), 3D low-poly az autószerelő minijátékhoz
- **Fejlesztői eszközök**: Blender, GitHub, GIMP/Krita, VS Code
- **Adatformátumok**: JSON, CSV (események, munkák, párbeszédek), PNG/JPG (grafikák), WAV/OGG (hang)

## 3. Rendszerarchitektúra

### 3.1 Moduláris Felépítés

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

## 4. Főbb Modulok

### 4.1 Játékmenet Vezérlő

- Nap-idő rendszer (reggel 8 – este 8 óra ciklus)
- Döntési pontok kezelése
- Napi események triggerelése
- Mentési/pályaállapot kezelése

### 4.2 Karakterstátusz Rendszer

- Játékos adatok:
  - Éhség (0–100)
  - Stressz (0–100)
  - Alkoholfüggőség (0–100)
  - Reputáció (pozitív/negatív skála)
- Hatások különböző tevékenységekből és eseményekből
- Állapotváltozás logikája

### 4.3 Munkahelyek

- **Autószerelő (3D)**: 
  - Jármű azonosítás, alkatrészcserék minijáték formában
  - 3D interakciók (alkatrészkijelölés, csavarozás, időalapú hibák)
- **Bolti eladó (2D)**: 
  - Vásárlók kiszolgálása, készletkezelés, döntések (visszaadás, ellopás stb.)

### 4.4 Eseményrendszer

- Véletlenszerű és scriptelt események
- JSON/CSV alapú eseménytáblázat
- Eseménytípusok:
  - Morális döntések
  - Hatósági ellenőrzés
  - Betegségek
  - Sztrájkok, leállások

### 4.5 Családrendszer

- Minden családtaghoz külön éhség- és egészségérték tartozik
- Reakciók eseményekre (pl. gyerek megbetegedése)
- Cél: a család életben tartása

## 5. Adatmodellek

### 5.1 Játékos.json

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

### 5.2 Esemény.csv

```csv
id,típus,leírás,opció1,opció2,következmény1,következmény2
E001,Hatósági ellenőrzés,"Megérkezik az ÁVÓ...","Kifizeted a bírságot","Tagadsz", "-100 pénz", "Reputáció -30"
```

## 6. Felhasználói Interfész (UI)

### 6.1 Képernyők

- Főmenü
- Munkaválasztó térkép
- Munkafelület (autószerelő / bolti eladó)
- Karakterstátusz panel
- Családstátusz panel
- Döntési esemény képernyő
- Játék vége képernyő (pontszám, statisztika, befejezés típusa)

### 6.2 UI Funkciók

- Egérrel történő navigáció
- Tooltip rendszer (státuszleírások)
- Felugró eseménydobozok, gombos választási lehetőségekkel

## 7. Mentési és Betöltési Rendszer

- Mentés struktúrája: JSON fájl a globális játékállapotról
- Kézi mentés és visszatöltés támogatása
- Slot-alapú mentés (3 különböző mentési lehetőség)

## 8. Funkcionális Követelmények

| Azonosító | Leírás |
|-----------|--------|
| F01       | A játékos kiválaszthatja napi munkáját |
| F02       | A státuszértékek folyamatosan változnak |
| F03       | Események jelennek meg, amik döntést követelnek |
| F04       | A család éhségértékeit is kezelni kell |
| F05       | A játék többféle befejezéssel zárulhat |
| F06       | A döntések hatással vannak a karakterre és világra |

## 9. Nem-funkcionális Követelmények

| Azonosító | Leírás |
|-----------|--------|
| NF01      | A játék 30 FPS mellett is zökkenőmentesen fusson |
| NF02      | Kis memóriahasználat és alacsony gépigény |
| NF03      | Könnyen lokalizálható szövegfájlok |
| NF04      | A rendszer modulárisan bővíthető legyen új munkákkal és eseményekkel |

## 10. Tesztelési Stratégia

- **Egységtesztek**: státuszfrissítések, eseménylogika
- **Integrációs tesztek**: UI és játékállapot szinkronizáció
- **Felhasználói tesztelés**: különböző végkimenetelek próbája
- **Teljesítményteszt**: régebbi gépeken való futás

## 11. Verziókövetés és Fejlesztési Módszertan

- **GitHub**: privát repó, főág és fejlesztői ágak
- **Branch Policy**: feature branch-ek, pull request, review kötelező
- **Issue Tracking**: GitHub Issues / Projects
- **Dokumentáció**: Markdown formátumban, repóban tárolva

## 12. Biztonság és Mentési Mechanizmusok

- Mentés titkosítás nem szükséges, de backup javasolt
- Hibakezelés: exception-logging, fallback értékek
- Hiba esetén automatikus visszatérés az utolsó stabil mentéshez

## 13. Jövőbeli Bővítések

- Harmadik munkalehetőség (irodai adminisztrátor)
- Statisztikai és naplózási rendszer
- Steam integráció (achievementek)
- Android/iOS port
- Multiplayer támogatás (későbbi verzióban)

## 14. Zárszó

A "Túlélés a Szocializmusban" nem csupán egy játék, hanem társadalmi és etikai reflexió is. A rendszerterv célja, hogy egy jól strukturált, modulárisan bővíthető és hosszú távon fenntartható alapot biztosítson ehhez a különleges játéktípushoz.

