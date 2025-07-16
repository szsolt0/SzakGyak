# Software Requirements Specification

## Bevezetés

Ez a dokumentum a "Túlélés a Szocializmusban" című játék szoftverkövetelményeit
írja le. A projekt célja egy olyan történetközpontú túlélőjáték megvalósítása,
amely valósághűen ábrázolja a szocialista korszak mindennapi kihívásait,
morális dilemmáit és túlélési stratégiáit.

A dokumentum elsődleges célja, hogy meghatározza a játék működésével,
megjelenésével, használhatóságával és technikai jellemzőivel kapcsolatos
követelményeket. A specifikáció támpontot ad a fejlesztéshez, teszteléshez,
valamint későbbi karbantartáshoz és bővítéshez.

## Áttekintés

A játékban a játékos egy átlagos állampolgár szerepébe bújik a szocializmus
idején. A cél a túlélés biztosítása különféle munkalehetőségek, véletlenszerű
események, és a családtagokról való gondoskodás közepette. A rendszer követi a
klasszikus túlélőmechanikák alapjait, de hangsúlyt helyez a morális döntésekre,
a hosszú távú következményekre és a történetmesélésre.

A játék Godot játékmotorral készül, nyílt forráskódú eszközökkel és saját
fejlesztésű vagy szabadon felhasználható tartalmakkal. Az SRS dokumentum a
követelmények részletes bontását tartalmazza a funkcionalitás, használhatóság,
teljesítmény és egyéb szempontok szerint.

## A Rendszer Funkciói

### Napi Ciklus (Main Loop)

A játék eseményei napokra bontott ciklusban zajlanak, amely a játékmenet
szerkezetének gerincét adja. Minden nap során különböző tevékenységek történnek,
ideértve munkavégzést, erőforrások beosztását, és a történet előrehaladását
befolyásoló döntéseket. A napi ciklus struktúrája adja a játék ritmusát, és
lehetőséget biztosít arra, hogy a játékos megtapasztalja a szocialista korszak
mindennapi kihívásait.

A napi események részletes működését a [Játékmenet](To be replaced with link) és
a [Játékmechanika](To be replaced with link) szekciók ismertetik.

### Autószerelő Minijáték

A játékos a történet során lehetőséget kap arra, hogy járműszerelőként
dolgozzon. A feladat célja különböző típusú gépjárművek meghibásodásainak
azonosítása és javítása. A játékos szabadon dönthet arról, melyik járművet
vállalja el, azonban nincs külső ellenőrzés a munkavégzés során.

Amennyiben a kijelölt javítási határidő (jellemzően néhány játéknap) lejár, és
a munka nem készül el, az ügyfél visszaveszi a járművét, és a játékos nem kap
fizetést. A játékos dönthet úgy is, hogy önként adja vissza a járművet, ha nem
tudja azt megjavítani, ekkor sincs pénzjutalom.

Előfordulhat, hogy bizonyos szerszámok kezdetben nem állnak rendelkezésre, így
egyes javítások nem hajthatók végre. Hibás (szándékos vagy véletlen) leadás
esetén nem garantált az azonnali visszajelzés: az ügyfél vagy észreveszi a
hibát, vagy nem. Amennyiben igen, a játékosnak vissza kell fizetnie a
munkadíjat, és jelentést is tehetnek róla a szocialista hatóságoknak.

Tartósan gyenge teljesítmény vagy súlyos hibák (pl. balesethez vezető hibás
javítás) akár az állás elvesztéséhez vagy a történet szerint munkatáborba
("gulágra") való küldéshez is vezethetnek.

Erről részletesebben a [Játékmechanika](To be replaced with link) és a
[Játékmenet](To be replaced with link) szekciókban olvashatunk.

### Bolt Minijáték

A bolt minijátékban a játékos bolti eladó szerepét tölti be. A játékmenet során
különböző vevők érkeznek, akiket ki kell szolgálni meghatározott időkereteken
belül. A pénztárgép manuális működésű, az árakat a játékosnak kell fejben
kiszámolnia vagy a bolt kézikönyve alapján meghatároznia.

A termékek között találhatók darabra, illetve súlyra értékesítettek. Az árakat
össze kell adni, illetve többszörözni, ha az adott termékből többet vesznek. A
játékmenet előrehaladtával a kiszolgálás egyre összetettebbé és gyorsabbá
válik, ezzel is növelve a kihívást.

A játékos saját pénzéből vásárolhat egyszerű számológépet, amely segítséget
nyújt a számításokhoz. Ez a funkció elsősorban azoknak szól, akik a játékot
"vanilla" (külső eszköz nélküli) formában kívánják játszani.

Erről részletesebben a [Játékmechanika](To be replaced with link) és a
[Játékmenet](To be replaced with link) szekciókban olvashatunk.

### Beállítási Rendszer

A felhasználók a különböző beállításokat módosíthatják közvetlenül a játék
menüjéből, illetve manuálisan a `settings.ini` fájl szerkesztésével. A menüben
végrehajtott módosítások mindig felülírják a `settings.ini` tartalmát
mentéskor. A beállítások mentése **atomikusan** történik, így egy esetleges
összeomlás esetén (a fájlrendszer sérülését nem számítva) a fájl mindig vagy a
korábbi, vagy a legutolsó érvényes állapotban marad. Sosem kerül félkész vagy
sérült állapotba.

Ha a `settings.ini` fájl nem létezik, a rendszer automatikusan létrehozza azt
alapértelmezett beállításokkal.

Az alábbi értékek adhatók meg a beállítási fájlban:

| Név                | Típus                   | Leírás                             | Default  |
|--------------------|-------------------------|------------------------------------|----------|
| `[volume]`         |                         | Hangerő szabályok                  |          |
| `master`           | int [0, 100]            | Master hangerő                     | `40`     |
| `effect`           | int [0, 100]            | Effektusok hangereje               | `100`    |
| `music`            | int [0, 100]            | Háttérzene hangereje               | `100`    |
| `ui`               | int [0, 100]            | UI-ban való cselekvések hangereje  | `100`    |
| `[video]`          |                         | Grafikával kapcsolatos beállítások |          |
| `quality`          | `low`, `medium`, `high` | Grafika minőség                    | `medium` |
| `animations`       | bool                    | UI animációk                       | `yes`    |
| `font`             | `pixel`, `readable`     | Betűtípus                          | `pixel`  |
| `[main]`           |                         | Egyébb                             |          |
| `lang`             | string                  | Játék nyelve                       | `ask`    |
| `content-warn-ack` | bool                    | Tartalom figyelmeztetés elfogadva  | `no`     |

A `content-warn-ack` beállítás különleges szerepet tölt be: ennek elfogadása
kötelező a játék elindításához. Amennyiben nincs elfogadva (alapértelmezetten
`no`), a játék indításakor megjelenik egy tartalomra vonatkozó figyelmeztetés,
amelyet a játékosnak el kell fogadnia a folytatáshoz. Elfogadás után ez a
figyelmeztetés a továbbiakban már nem jelenik meg.

Ha egy beállítás hiányzik a fájlból, akkor automatikusan az alapértelmezett
érték kerül alkalmazásra.

A beállítások grafikus változatáról az [Interfészek](To be replaced with link)
szekciókban olvashatunk. A `lang` változóban használt konvencióról pedig a
[Alkalmazott szabványok](To be replaced with link) ad részletes leírást.

### Mentési Rendszer

A játék "végtelen" (ameddig a tárhely engedi) mentés létrehozására ad
lehetőséget. A mentések a `saves` jegyzékbe kerülnek. A mentési file neve
megegyezik a mentés nevével, kivéve hogy a whitespace karakterek `-` karakterre
lesznek cserélve, és a `.save` a végéhez lesz fűzve.

A mentések a fentebb írt módon **atomikusan** történnek. Illetve automatikusak
is.

## Használhatóság (Usability)

- A játék kezelése intuitív, különösen azok számára, akik korábban játszottak
  már point-and-click stílusú játékokkal.

- Gyengénlátók támogatása: A `readable` betűtípus-választás lehetőséget nyújt
  azoknak a játékosoknak, akik számára a pixeles megjelenítés nehezen olvasható.

- Színvakok támogatása: A játékban a színalapú jelzéseket kiegészítő elemek is
  segítik az értelmezést (pl. ikonok, szimbólumok), így minden információ
  többcsatornásan is elérhető.

- "Potato PC" kompatibilitás: A játék alacsony rendszerkövetelményeinek
  köszönhetően régebbi vagy gyengébb teljesítményű gépeken is megfelelően fut.

- Multiplatform támogatás: A játék natívan elérhető Linux és Windows
  rendszerekre. macOS-re való portolása is könnyen megvalósítható, azonban a
  fejlesztői csapatban jelenleg nincs Apple géppel rendelkező tag.

- Érzékeny tartalomra való figyelmeztetés: A játék egyes elemei érzelmileg
  megterhelők lehetnek azok számára, akik személyesen vagy közvetetten
  érintettek voltak a szocialista rendszerben. A játék ezért a kezdés előtt
  figyelmeztetést jelenít meg, amelyet a játékosnak el kell fogadnia.
