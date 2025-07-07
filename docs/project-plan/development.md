# Fejlesztési Terv

A játékfejlesztés 8 hetes időtartamra lett tervezve, amely során minden hétnek
meghatározott célja és fókusza van. A csapat összehangolt munkával, heti három
egyeztetéssel és folyamatos együttműködéssel halad előre a játék végleges formájáig.

## Koncepcióalkotás és tervezés

(1--2. hét)

Fő cél: A játék világának és mechanikáinak alapozása, valamint a fejlesztéshez szükséges dokumentációk elkészítése.

- A játék részletes koncepciójának kidolgozása: világ, hangulat, fő mechanikák.
- Játékrendszer tervezése: mutatók (éhség, stressz, reputáció), morális döntések struktúrája.
- Három munkatípus (állami, maszek, informális) funkcionális felépítésének meghatározása.
- Alap felhasználói felület és képernyőváltás logikájának vázolása.
- Github repository, mkdocs és Godot projekt inicializálása.
- Csapat szerepköreinek és feladatainak felosztása.
- Projektterv, vízió és SRS (Software Requirements Specification) dokumentum összeállítása, véglegesítése a csapattagokkal és a gyakorlatvezetővel.

## Grafikai elemek és textúrák fejlesztése

(3--4. hét)

Fő cél: A rendszer logikai modelljének és a játék vizuális világának létrehozása.

- Analízis modell elkészítése: rendszer szintű logikai struktúra, folyamatmodellek.
- Godot projekt mappaszerkezetének kialakítása.
- Grafikai elemek megtervezése és felosztása a csapattagok között:
  - Munkakörnyezetek (autószerelő műhely, bolt, iroda) hátterei és tárgyi elemei.
  - Családi ház, UI-elemek (mutatósávok, karakterikonok, eseményszövegek).
- Egységes 2D-s stílus kialakítása, szocialista korszakhoz illeszkedő látványvilág.
- Kezdeti animációk, alap textúrák és interakciós vizuális visszajelzések készítése.
- Analízis modell és grafikai anyagok véglegesítése, bemutatása a gyakorlatvezetőnek.

## Rendszertervezés és prototípus

(5--6. hét)

Fő cél: A játékmenet technikai alapjainak megvalósítása és az első játszható verzió elkészítése.

- Rendszerterv elemeinek felosztása a csapattagok között.
- Godot scriptjeinek és node-oknak a megtervezése, leosztása.
- A játékmenet fő logikáinak implementálása:
  - Mutatók frissülése, munkavégzés, események.
  - Képernyőváltási rendszer (navigáció jobbra–balra, fel–le).
  - Morális döntési rendszer működő verziója.
  - Alap játékkör: munkavégzés – pihenés – új nap.
- Script-részek integrálása és összehangolása.
- Alap visszajelzések (éhség, pénzmozgás, eseménymegjelenítés).
- prototípus létrehozása és alap tesztelése.
- Rendszerterv véglegesítése, bemutatása a gyakorlatvezetőnek.

## Véglegesítés és kiadásra kész verzió

(7--8. hét)

Fő cél: A játék végleges funkcióinak kialakítása, tesztelése és kiadásra kész verzió elkészítése.

- Tesztelési terv felosztása, egyes elemek külön megvalósítása csapattagok által.
- Játékmechanikák finomhangolása, munkák közötti egyensúly beállítása.
- UI-átalakítás, optimalizálás, bugfixek belső tesztelések alapján.
- Véletlenszerű események bővítése, morális döntések következményeinek implementálása.
- Naplózási és pontozási rendszer beépítése.
- Játék végi állapotok programozása (éhenhalás, rendszerváltás).
- Végső build létrehozása és bemutatása a gyakorlatvezetőnek.