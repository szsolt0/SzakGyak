# Analízis Modell

## Bevezetés

A „Piotr naplója – Egy család a holnap küszöbén” című játékterv egy narratív-központú, morális döntésekre és túlélési stratégiákra építő szimuláció, amely egy fiktív szocialista ország gazdasági összeomlásának időszakában játszódik. A játék középpontjában Piotr, a családfő áll, aki napról napra küzd meg a rendszerszintű hiány, a társadalmi nyomás és a személyes morális dilemmák között, miközben próbálja életben tartani a családját.

Az analízis modell célja a probléma tér struktúrájának feltárása: azaz azoknak a fogalmaknak, entitásoknak és viszonyoknak az azonosítása, amelyek a játék világának alapvető összetevői. Ennek megfelelően a következő szakaszban egy kezdeti osztálydiagram készül, amely a játék világának fő komponenseit, azok tulajdonságait és kapcsolatait mutatja be.

## Kezdeti osztálydiagram

Játékos

- A játék fő karaktere, akinek tulajdonságai közé tartozik az éhségszint, stressz, alkoholállapot, reputáció és munkabeosztás. A játékos állapotai befolyásolják a túlélést és a döntéseket.

Családtag

- A családtagoknak kizárólag éhségszintjük van, ami meghatározza életminőségüket és túlélési esélyeiket.

Munkahely

- Különböző típusú munkahelyek (pl. autószerelő, bolt, iroda), amelyekhez a játékos tartozhat és amelyek meghatározzák a napi tevékenységeket és jövedelmet.

Műszak

- A nap egy adott időszaka, amelyhez a munkavégzés vagy egyéb tevékenység kapcsolódik.

Tárgy

- A játékban használható, gyűjthető vagy kereskedhető eszközök és árucikkek.

Esemény

- A játék során bekövetkező döntési helyzetek, amelyek változást hoznak a történetben vagy a karakter állapotában.

MorálisDöntés

- Olyan választási lehetőségek, amelyek többféle következménnyel járhatnak és alakítják a történet menetét.

FeketepiacKapcsolat

- A nem hivatalos árubeszerzési és kereskedelmi lehetőségek rendszere.

NapiNapló

- Az egyes napok eseményeit, kiadásait és a család állapotát összefoglaló napló.

JátékÁllapot

- Globális mutatók, például reputáció, idő előrehaladása és túlélési esélyek, amelyek a játék egészére hatnak.

### Osztálydiagram

![A játék osztálydiagramja](classdiagram.png)

### Osztályok Felsorolása

Main menu

- Az Main menu osztály a játék főmenüjét kezeli, ahol a játékos elindíthat új játékot, folytathat egy mentést, vagy módosíthatja a beállításokat. Tartalmazza a menüpontok listáját és a kiválasztott elemet. Metódusai felelősek a menü megjelenítéséért, a navigációért és a választás feldolgozásáért.

New game

- A New game osztály az új játék elindításáért felel, új játékállapotot hoz létre az alapértelmezett beállításokkal. Attribútumaiban tárolja az induló karaktereket, helyszíneket és kezdeti játékparamétereket. Metódusai az új játék inicializálását és a játékos számára elérhető első lépések beállítását végzik.

Continue

- A Continue osztály lehetővé teszi a korábbi játékállapot betöltését. Attribútumai a mentett állományok listája és a kiválasztott mentés. Metódusai a mentett állapot beolvasását és a játék folytatását biztosítják a kiválasztott ponttól.

Settings

- A Settings osztály a játék beállításainak kezelését látja el, beleértve az irányítást, hang- és képi beállításokat. Attribútumaiban tárolja az egyes opciók értékeit, mint a vezérlés, audio és video paraméterek. Metódusai az egyes beállítások módosításáért, mentéséért és visszaállításáért felelnek.

Controls

- A Controls osztály az irányítás testreszabásáért felelős. Attribútumai a billentyűkiosztás vagy kontroller gombok hozzárendelései lehetnek. Metódusai a bemeneti eszközök lekérdezését és az egyéni konfigurációk alkalmazását végzik.

Audio

- Az Audio osztály kezeli a hangbeállításokat, például a hangerőszinteket, hangszínszabályzókat, illetve az effekteket. Attribútumai a különféle hangerőértékeket és beállításokat tárolják. Metódusai a hang lejátszásáért, módosításáért és elnémításáért felelősek.

Video

- A Video osztály a megjelenítés beállításait kezeli, mint például a felbontás, grafikai minőség, képernyő mód. Attribútumai tárolják a jelenlegi grafikai konfigurációt. Metódusai az opciók módosítását és a változtatások alkalmazását végzik.

Interactions

- Az Interactions osztály a játékos és a világ közötti interakciókat kezeli, például NPC-kkel vagy tárgyakkal való kölcsönhatásokat. Attribútumaiban az aktuális interakció állapota és a résztvevő entitások szerepelnek. Metódusai az interakciók indításáért, folytatásáért és lezárásáért felelnek.

Family members

- A Family members osztály a játékbeli családtagokat reprezentálja. Attribútumai tartalmazzák a családtagok nevét, szerepét és kapcsolatait a játékos karakterrel. Metódusai a családi események kezeléséért és a tagok állapotának frissítéséért felelősek.

Player

- A Player osztály a játékos karakterét reprezentálja, tartalmazva az állapotokat (például egészség, pozíció) és az inventárt. Attribútumai tárolják a karakter tulajdonságait és aktuális helyzetét. Metódusai az irányítást, mozgást, interakciókat és a karakter speciális képességeit kezelik.

Car NPC

- A Car NPC egy autóval rendelkező nem-játékos karakter, amely az autós közlekedést vagy egyéb, autóval kapcsolatos viselkedést modellez. Attribútumaiban szerepelhet az autó típusa, sebessége és helyzete. Metódusai a mozgás, navigáció és a játékossal való interakciók kezelését végzik.

Shop NPC

- A Shop NPC a boltos karaktert reprezentálja, aki árusít vagy vásárol a játékban. Attribútumai között szerepel az árukészlet és árak. Metódusai kezelik a kereskedelmi tranzakciókat, az áruk kínálatát és az árak módosítását.

Desktop NPC

- A Desktop NPC olyan nem-játékos karakter, aki asztalnál dolgozik vagy a számítógépnél van. Attribútumai tartalmazhatják az aktuális tevékenységet és az interakciós lehetőségeket. Metódusai információszolgáltatást vagy feladatok kiosztását végezhetik.

Office

- Az Office osztály egy irodai helyszínt modellez, ahol különböző tevékenységek zajlanak. Attribútumai lehetnek a bútorok, felszerelések és az ott dolgozó karakterek. Metódusai kezelik az iroda használatát és az eseményeket, amelyek ott történnek.

IDs

- Az IDs osztály azonosító kártyákat vagy dokumentumokat képvisel, melyek hozzáférést vagy személyazonosságot igazolnak. Attribútumai tartalmazzák az azonosító adatokat. Metódusai az azonosítás és hozzáférés ellenőrzését végzik.

Papers

- A Papers osztály különféle dokumentumokat vagy papírokat foglal magában. Attribútumai a papírok tartalmát és státuszát tartalmazzák. Metódusai az olvasás, kezelés és eseményekhez kötött használatuk kezelését végzik.

Shop

- A Shop osztály egy bolt helyszínét reprezentálja, ahol kereskedelem zajlik. Attribútumaiban tárolja a készletet, az árakat és a vásárlókat. Metódusai a termékek kezelését, vásárlást és eladást biztosítják.

Cash register

- A Cash register osztály a pénztárgépet képviseli, amely a fizetések lebonyolítását végzi. Attribútuma a tárolt pénzösszeg és a tranzakciók listája. Metódusai a fizetések rögzítéséért és az összeg kezeléséért felelősek.

Repair shop

- A Repair shop egy javítóműhelyt modellez, ahol tárgyak vagy eszközök javítása zajlik. Attribútumai között szerepelnek a szerszámok, javítandó tárgyak és a munkafolyamat állapota. Metódusai a javítási folyamatok indítását, nyomon követését és befejezését végzik.

Tools

- A Tools osztály a játékban található eszközöket képviseli, melyek különféle feladatokra használhatók. Attribútumaik lehetnek az eszköz típusa, állapota és használati ideje. Metódusaik az eszközök használatát és karbantartását kezelik.

Gulag

- A Gulag egy fogolytábort reprezentál a játékban, ahol foglyokat tartanak fogva és események zajlanak. Attribútumaiban a foglyok, őrök és biztonsági elemek szerepelnek. Metódusai a fogvatartás, események és menekülési lehetőségek kezelését végzik.

CharacterHUD

- A CharacterHUD a játékos karakterének állapotát jeleníti meg a képernyőn, például élet- és energiaértékeket. Attribútumai az aktuális állapotadatokat tartalmazzák. Metódusai az állapot frissítését és megjelenítését végzik valós időben.

Pause menus

- A Pause menus osztály a játék szüneteltetési menüit kezeli, amelyek megállítják a játékot és különböző opciókat kínálnak. Attribútumai a menüpontokat és azok állapotát tartalmazzák. Metódusai a menü megjelenítéséért, navigációjáért és bezárásáért felelnek.

FamilyHUD

- A FamilyHUD a családtagok állapotának kijelzését végzi, segítve a játékost a családi kapcsolatok nyomon követésében. Attribútumaiban a családtagok állapotai és információi tárolódnak. Metódusai az adatok frissítését és megjelenítését végzik.

Wealth

- A Wealth osztály a játékos vagy család anyagi helyzetét kezeli és jeleníti meg. Attribútuma a pénzösszeg és esetleges vagyoni elemek. Metódusai a gazdasági változások nyomon követését és frissítését biztosítják.

### Alrendszerek

#### Menürendszer (UI menük)

Ez az alrendszer kezeli a játék fő- és beállítási menüit, a szünet menüt és a beállításokat.

- Main menu
- New game
- Continue
- Settings
- Controls
- Audio
- Video
- Pause menus

#### Interakciók és karakterek

Ebben az alrendszerben vannak a játékos és NPC-k, valamint az egymással való interakciók.

- Interactions
- Family members
- Player
- Car NPC
- Shop NPC
- Desktop NPC

#### Környezet és helyszínek

Ez az alrendszer az egyes helyszíneket és környezeti elemeket kezeli.

- Office
- Shop
- Repair shop
- Gulag

#### Objektumok és eszközök

Itt vannak az olyan tárgyak és eszközök, amik a játékban előfordulnak.

- IDs
- Papers
- Tools
- Cash register

#### Játékfelület (HUD)

Ez az alrendszer a játékos és család állapotának, vagyoni helyzetének kijelzéséért felel.

- CharacterHUD
- FamilyHUD
- Wealth

## Alrendszerek


