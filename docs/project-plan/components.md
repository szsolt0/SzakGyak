# Komponensek

## Játékmenethez kapcsolódó komponensek

-   **Főjáték ciklus** -- A játékmenet napokra bontva zajlik, minden nap
    munkavégzéssel, eseményekkel és esti pihenéssel telik.

-   **Időkezelő rendszer** -- A játéknap 8:00--20:00 között telik, amely
    meghatározza a tevékenységekre fordítható időt, majd az este
    pihenéssel zárul.

-   **Helyszínváltó navigáció** -- A játékos a képernyő 4 irányába
    kattintva válthat a különböző helyszínek -- munkák, otthon,
    környezet -- között.

-   **Eseménykezelő rendszer** -- Véletlenszerű vagy scriptezett
    események jelennek meg, amelyek döntéshelyzeteket, jutalmakat vagy
    következményeket hoznak.

-   **Mutatórendszer (HUD)** -- A képernyő felső részén jelennek meg a
    játékos állapotát mutató sávok: éhség, stressz, reputáció és
    alkoholfüggőség.

-   **Családi menedzsment** -- A nehézségi szinttől függően eltartott
    családtagokról kell gondoskodni, akiket csak az éhség-szintjükön
    keresztül kell figyelni.

-   **Lopásmechanika** -- A játékos bármikor dönthet a lopás mellett, de
    lebukás esetén börtön, majd végső esetben Gulág vár rá --
    visszafordíthatatlan következményekkel.

## Munkarendszer komponensei

-   **Autószerelő műhely (3D)** -- A játékos egy interaktív műhelyben
    autókat javít, szerszámokat kezel, és többnapos munkafolyamatokat
    végez.

-   **Bolti munka (2D)** -- Egy üzletben dolgozva vásárlók kiszolgálása,
    pénzkezelés és gyors reagálás szükséges -- a hibák
    reputációcsökkenést okoznak.

-   **Irodai munka (2D)** -- Iratok rendszerezése,
    dokumentum-ellenőrzés, adminisztratív feladatok teszik próbára a
    figyelmet és gyorsaságot.

-   **Munkaváltás lehetősége** -- A játékos szabadon válthat a három
    munkatípus között, figyelembe véve a bevételt, kockázatot és
    időigényt.

## Gazdasági és kereskedelmi komponensek

-   **Pénzrendszer** -- A megszerzett fizetés felhasználható alapvető
    szükségletekre, eszközökre vagy állapotjavító termékekre.

-   **Kajajegy és cserekereskedelem** -- A pénzhiányos időszakot hűen
    modellezve a játék támogatja az alternatív fizetőeszközök
    használatát.

-   **Kiadáskezelő modul** -- A kiadásaink közvetlen hatással vannak a
    mutatóinkra, túlélésünkre, vagy akár a családtagok sorsára.

## Morális döntési rendszer

-   **Eseményalapú döntések** -- A játékos folyamatosan erkölcsi
    dilemmákba kerül, amelyek hosszú távon is befolyásolják a játékot.

-   **Lopás és lebukás következményei** -- A döntés szabadsága mellett a
    lebukás kockázata is súlyos: első esetben börtön, másodszor Gulág.

-   **Családi tragédiák hatása** -- A családtagok halála ugyan nem vet
    véget a játéknak, de negatívan befolyásolja az alkohol- és
    stresszszinteket.

## Felhasználói felület és grafikai komponensek

-   **Főképernyő (alap layout)** -- A játék alapképernyője, ahonnan
    minden más rész elérhető, a játék struktúráját képezi.

-   **Helyszínspecifikus háttérképek** -- Minden munkának és az otthoni
    térnek saját, hangulathű grafikája van, a korszak stílusában.

-   **Mutatók megjelenítése (felső HUD)** -- A játékos állapotjelzőit --
    éhség, stressz, reputáció, alkohol -- jól látható módon jeleníti
    meg.

-   **Családtag kijelző (alsó képernyőrész)** -- A házban tartózkodó
    eltartottak képei és éhségsávjai jelennek meg az alsó sávon.

-   **Szöveges eseménymegjelenítő** -- Az aktuális eseményeket,
    döntéseket és következményeket szövegesen írjuk ki a játékos
    számára.

## Tesztelési és naplózási komponensek

- **Naplózási rendszer** -- A játékos fejlődését naplófájlban vagy a
  menüben nyomon lehet követni, statisztikák és pontszámok formájában.

- **Állapotnyilvántartás** -- Minden döntés, mutatóváltozás és esemény
  hatása rögzítésre kerül, ez segíti a visszakövetést és értékelést.

- **Tesztelési modulok** -- Automatikus és manuális tesztek futtatása
  a karakterinterakciók, ütközések, döntési következmények és
  teljesítmény értékelésére.
