# id Software — XII. Боковые ветви: id Mobile, QuakeCon, Frankfurt, RAGE 2 и Raven

> Часть большой базы по истории id Software. Пункты **75–79**. Содержательный текст исходного документа сохранён без сокращений.

[← XI. Наследие и выводы](11-legacy-summary.md) · [Общее оглавление](index.md)

### Содержание { #contents }

- [75. id Mobile / Fountainhead Entertainment — маленькая альтернативная id внутри эпохи AAA](#p075)
- [76. QuakeCon как институт id Software](#p076)
- [77. id Software Frankfurt и распределённая engine-команда](#p077)
- [78. RAGE 2 и судьба франшизы RAGE](#p078)
- [79. Heretic + Hexen 2025 — современное замыкание истории id/Raven](#p079)

---

## 75. id Mobile / Fountainhead Entertainment — маленькая альтернативная id внутри эпохи AAA { #p075 }

Эту ветку легко принять за сноску: Doom RPG на телефонах, Orcs & Elves, Wolfenstein RPG, несколько iPhone-проектов.

Но исторически она намного интереснее.

Потому что ровно в тот момент, когда основная id движется сюда:

```
DOOM 3
↓
огромные production cycles
↓
id Tech 5
↓
RAGE
↓
100+ человек
↓
AAA
↓
несколько лет
на одну game
```

рядом возникает почти анти-id нового времени:

```
5–6 человек
↓
несколько месяцев
↓
простая technology
↓
одна ясная mechanic
↓
SHIP
↓
сразу следующая idea
```

То есть id Mobile неожиданно возвращает компанию почти к ритму Commander Keen / Wolfenstein-era.

### Katherine Anna Kang и Fountainhead

Kang работала в id как Director of Business Development, а в 2000 году основала собственную Fountainhead Entertainment.

Fountainhead изначально не была mobile department id. Это отдельная маленькая multimedia/game studio, заметная в том числе ранними machinima-проектами и продвижением machinima как отдельной формы.

То есть mobile-линия появляется позже из partnership, а не из внутреннего приказа:

```
СОЗДАТЬ
id MOBILE
```

### Carmack получает телефон и ведёт себя максимально Carmack

Он долго вообще не был большим любителем мобильных телефонов.

После того как начинает реально пользоваться устройством, смотрит hardware capabilities, покупает mobile games и приходит к типичному выводу:

```
ЖЕЛЕЗО
МОЖЕТ
БОЛЬШЕ

ПОЧЕМУ
GAMES
ТАКИЕ
СЛАБЫЕ?
```

И предлагает Fountainhead попробовать сделать собственную.

### Но не порт Doom FPS

Самая важная design мысль:

```
INPUT
=
ГЛАВНОЕ
ОГРАНИЧЕНИЕ
PHONE
```

Маленький экран и слабый CPU — знакомые Carmack проблемы.

Но телефонная клавиатура ужасна для normal real-time FPS control.

Поэтому вместо:

```
DOOM
BUT WORSE
```

получается:

```
DOOM
+
THE BARD'S TALE
```

First-person view остаётся.

Но movement становится grid/step-based, combat — turn-based.

```
Нажал action
↓
world отвечает
↓
следующее решение
```

Ограничение input превращается в design language.

### Doom RPG показывает, что Doom identity шире механики FPS

Нет classic strafe-run/projectile-dodge loop.

Но есть:

- Mars;

- demons;

- UAC;

- BFG;

- shotgun;

- Doom humor/attitude.

То есть уже в 2005 id проверяет вопрос:

```
НАСКОЛЬКО
ДАЛЕКО
МОЖНО
УВЕСТИ
DOOM
ОТ FPS
И
ОСТАВИТЬ
DOOM?
```

Ответ: довольно далеко.

### Engine рождается почти по-старому

Carmack за короткий срок пишет основу mobile engine, Fountainhead за несколько месяцев собирает игру.

Цикл порядка полугода — почти шок для человека, который к этому моменту привык к многолетнему Doom 3-scale production.

И именно short cycle очень цепляет Carmack.

```
IDEA
↓
BUILD
↓
SHIP
↓
REACTION
↓
NEXT
```

Это старая id, которой уже почти нет внутри main AAA studio.

### Маленький budget снова позволяет рисковать

Большой AAA project:

```
НЕУДАЧНАЯ
IDEA
=
ОЧЕНЬ
ДОРОГАЯ
ОШИБКА
```

Mobile:

```
SMALL TEAM
+
6 MONTHS
+
LOW COST
=
МОЖНО
ЭКСПЕРИМЕНТИРОВАТЬ
```

Отсюда Orcs & Elves — оригинальный fantasy IP вместо очередного использования Doom/Quake/Wolfenstein.

### Carmack + Kang — интересная design-пара

Carmack instinct:

```
CUT
REMOVE
SIMPLIFY
```

Kang чаще защищает маленькие characterful interactions, юмор, companions и детали.

Истории с огнетушителем или собакой хорошо показывают конфликт:

```
CARMACK:
ЗАЧЕМ?

KANG:
ДАВАЙ
СДЕЛАЕМ
И ПОСМОТРИМ
```

Prototype выигрывает спор.

Это очень id-style:

```
BUILD
ИМЕЕТ
ПРАВО
ПОБЕДИТЬ
ДАЖЕ
ПРИНЦИП
CARMACK
```

### Orcs & Elves

Fantasy RPG на той же broad turn-based first-person grammar.

Не попытка засунуть огромную party-RPG в Nokia, а design, который уважает device:

```
ONE CHARACTER
CLEAR INPUT
GRID MOVEMENT
TURN-BASED COMBAT
RPG FLAVOR
```

Новый IP должен быть хорош сам по себе — Doom brand его уже не спасает.

### Успех создаёт pipeline

```
2005
Doom RPG
↓
2006
Orcs & Elves
↓
2007
Orcs & Elves II
+
Nintendo DS
```

Fountainhead перестаёт выглядеть как experiment одного weekend engine.

### 2007 — формальное создание id Mobile

15 ноября 2007 Fountainhead фактически встраивается в id. Пять сотрудников переходят в id Mobile, Katherine Anna Kang становится президентом подразделения.

Зачем это делать?

#### Контракты

Three-way arrangement `id + Fountainhead + publisher` иногда оформляется почти дольше, чем сама маленькая игра.

#### Деньги / infrastructure

id может стабильнее финансировать team.

#### Hiring

Уговорить сильного developer в 2007 делать J2ME game трудно.

Фраза:

```
РАБОТАТЬ
В id Software
```

помогает сильнее, чем название маленькой Fountainhead.

### id Mobile задумывается не как porting department

Планы включают:

- cell phones;

- Nintendo DS;

- PSP;

- known id IP;

- новые IP.

То есть это маленькая experimental studio внутри id.

### Wolfenstein RPG

Опять не тупой port Wolfenstein 3D, а переработка IP под turn-based mobile RPG grammar.

Ещё один proof:

```
IP
МОЖЕТ
ЖИТЬ
ВНЕ
ORIGINAL
MECHANICAL
FORM
```

### Doom II RPG

Формула расширяется: больше systems, characters, campaign complexity.

id Mobile уже выглядит как настоящий production unit.

### Потом iPhone меняет всё

Старый J2ME/BREW-world:

```
СОТНИ
РАЗНЫХ
ТЕЛЕФОНОВ

РАЗНЫЕ
SCREENS
MEMORY
INPUT
CARRIERS
```

iPhone:

```
STANDARDIZED
HIGH-END
DEVICE
+
APP STORE
```

Для Carmack это новая интересная platform frontier.

### Classic ports и новые iPhone-games

Появляются/планируются:

- Wolfenstein 3D Classic;

- Doom Classic;

- Wolfenstein RPG;

- Doom II RPG;

- Doom Resurrection;

- RAGE: Mutant Bash TV.

### Doom Resurrection

Основную разработку делает Escalation Studios, но это та же mobile initiative.

И снова platform-first design:

```
НЕ
FULL DOOM 3
НА TOUCHSCREEN

А
RAIL SHOOTER
С AIMING,
КОТОРОЕ
РАБОТАЕТ
НА DEVICE
```

Не борись с input — перепиши game под него.

### RAGE: Mutant Bash TV

2010.

Мобильная tech/showcase-версия RAGE появляется ещё до большой RAGE 2011.

Почти старый QTest instinct через App Store:

```
НОВАЯ
TECH?
↓
ДАЙТЕ
ЛЮДЯМ
ПОЩУПАТЬ
```

### Почему id Mobile не становится огромной веткой

Здесь не надо придумывать один красивый cause.

Сходятся несколько факторов:

- mobile economics быстро движется к F2P/live-ops;

- iPhone делает отдельную «low-end mobile discipline» менее самостоятельной;

- id уже внутри ZeniMax;

- Carmack всё сильнее переключается на VR;

- company priorities уходят в Doom 4.

И важная поправка: в 2012 Carmack на QuakeCon прямо сообщает, что mobile initiative id закрывается, а людей перебрасывают на Doom 4. То есть отдельная дата/решение всё-таки есть.

### Главный смысл id Mobile

Она показывает альтернативную дорогу для поздней id.

Main studio:

```
AAA SCALE
+
NEW ENGINE
+
MULTI-YEAR
PRODUCTION
```

Mobile:

```
SMALL TEAM
+
HARD CONSTRAINT
+
CLEAR MECHANIC
+
FAST ITERATION
+
SHIP QUICKLY
```

И второе удивительно сильно напоминает id начала 1990-х.

id Mobile — маленькое доказательство, что старая формула компании всё ещё работала, если снова создать для неё подходящий масштаб.

[↑ К содержанию](#contents)

---
## 76. QuakeCon как институт id Software { #p076 }

QuakeCon важна уже тем, что её изначально придумала **не id**.

Первая QuakeCon выросла из IRC-community вокруг Quake.

Люди из `#quake` решили:

```
МЫ
ПОСТОЯННО
ИГРАЕМ
ВМЕСТЕ
↓
ДАВАЙТЕ
ВСТРЕТИМСЯ
ВЖИВУЮ
```

Организаторы ранней встречи — фанаты, а не marketing department.

### 1996 — первая QuakeCon

Garland, Texas, вскоре после выхода Quake.

Несколько десятков людей привозят:

- свои PC;

- CRT;

- keyboards/mice;

- network gear.

И играют в Quake/Doom.

### id вообще не организует первый event

Команда узнаёт о LAN nearby и приезжает сюрпризом.

Carmack садится с людьми и просто разговаривает про Quake/technology.

Из этого неформального разговора позже вырастает ежегодная Carmack keynote.

### Core QuakeCon — BYOC

Bring Your Own Computer.

Не просто convention, где смотришь trailers.

```
БЕРЁШЬ
СВОЙ PC
↓
ТАЩИШЬ
ЕГО
В TEXAS
↓
СТАВИШЬ
РЯДОМ
С ТЫСЯЧАМИ
ДРУГИХ
↓
ИГРАЕШЬ
НЕСКОЛЬКО
ДНЕЙ
```

Это физическое воплощение PC-culture id.

### Hardware тоже часть hobby

Custom rigs, overclock, cooling, absurd cases, monitors, периферия.

Старая Carmack-lineage:

```
ЖЕЛЕЗО
=
ЧАСТЬ
ИГРОВОЙ
КУЛЬТУРЫ
```

становится физически видна в одном hall.

### Community traditions

Dirty keyboard contests, ночной BYOC, internal jokes, культ energy drinks, «Peace, Love and Rockets» и куча локальных ритуалов.

Корпоративно бессмысленно.

Культурно — именно из этого получается community identity.

### Volunteers

QuakeCon десятилетиями держится не только на id/Bethesda/sponsors, но и на огромной volunteer infrastructure:

- network;

- power;

- registration;

- setup;

- security;

- troubleshooting;

- teardown.

То есть fan ownership feeling сохраняется даже после превращения event в крупную convention.

### Competitive Quake

QuakeCon не изобрела esports.

Но очень быстро становится одним из устойчивых ежегодных храмов arena FPS competition.

Quake → QuakeWorld → Quake II → Quake III → Doom 3 → Quake 4 → Quake Live → Quake Champions.

При этом tournament scene существует рядом с обычным BYOC, а не заменяет его.

Это здоровая двойственность:

```
TOP PROS
НА СЦЕНЕ

+

КАКОЙ-ТО
МУЖИК
ИГРАЕТ
CIVILIZATION
В 4 УТРА
```

### QuakeCon постепенно становится больше самой Quake

Даже когда flagship id становится Doom 3, RAGE или modern Doom, event всё равно называется QuakeCon.

Потому что QuakeCon уже означает:

```
LAN
PC GAMING
id
COMMUNITY
TECHNOLOGY
TEXAS
```

а не только конкретную franchise.

### Carmack keynote — физический наследник `.plan`

1996:

```
Carmack
на крыльце
↓
несколько десятков
людей
```

2000-е:

```
Carmack
на сцене
↓
тысячи
↓
несколько часов
tech monologue
```

Он говорит про graphics APIs, GPUs, Linux, mobile, consoles, programming, rockets, VR, ошибки id.

Это почти публичный доступ к голове lead engineer.

### 2012 — кульминация

Keynote растягивается примерно на три с половиной часа.

Там одновременно:

- разбор провального PC launch RAGE;

- mobile closure;

- Windows 8;

- VR;

- engineering philosophy.

То есть QuakeCon служит не просто marketing stage, а местом, где company иногда публично признаёт ошибки.

### VR lineage

Именно на QuakeCon Carmack много говорит о HMD/latency/VR в момент, когда это ещё не mainstream product id.

Через год он уйдёт в Oculus.

Поэтому QuakeCon хранит публичный документ рождения новой Carmack-era уже вне id.

### Собственная медийная сцена id

К 2007 id понимает: зачем пытаться перекричать весь E3, если у нас есть собственная аудитория?

На QuakeCon 2007 показывают/объявляют RAGE, id Tech 5, Quake Zero/Live и другие проекты.

Event становится почти `id Direct` задолго до эпохи Direct-презентаций.

### ZeniMax расширяет content, но не убивает core

После 2009 QuakeCon включает Skyrim/Bethesda/Arkane/other portfolio content.

Теоретически можно было переименовать в BethesdaCon.

Но название и BYOC core сохраняются.

Это потому, что cultural capital QuakeCon уже существует отдельно от commercial importance Quake franchise.

### 2014 — новая Doom показывается именно здесь

После old Doom 4 reset и ухода Carmack первое большое public gameplay reveal новой Doom идёт на QuakeCon, причём закрыто от streaming/cameras.

Символически:

```
DOOM
ВОЗВРАЩАЕТСЯ
↓
СНАЧАЛА
ПОКАЗЫВАЕМ
CORE COMMUNITY
```

QuakeCon участвует в восстановлении identity самой id.

### Pandemic stress-test

2020 physical QuakeCon невозможна.

Появляется QuakeCon at Home — streams, online tournaments, charity, virtual community activity.

2020–2022 digital-only сохраняют calendar identity event.

Но в 2023 official messaging подчёркивает return of BYOC.

То есть organizers понимают:

```
STREAM
≠
QUAKECON
```

Physical community — core.

### QuakeCon как charity/community organization

Со временем появляются blood drives, charity fundraising, animal rescue, Extra Life и другие initiatives.

Тусовка «постреляем друг в друга в Quake» взрослеет в настоящую community infrastructure.

### 2026 — идеальное историческое замыкание

30 лет QuakeCon.

35 лет id.

И на event снова собираются все четыре founders:

```
John Carmack
John Romero
Tom Hall
Adrian Carmack
```

Люди, которые давно разошлись, встречаются на convention, которое возникло из игры их компании.

Появляется founders panel, classic Quake activity, Doom II deathmatch с Romero, Quake competitions и новый official Quake content.

### Почему это институт, а не просто event

Event:

```
PRODUCT
↓
MARKETING EVENT
↓
PRODUCT УМЕР
↓
EVENT УМЕР
```

QuakeCon:

```
ЛЮДИ
↓
ТРАДИЦИЯ
↓
НОВЫЕ ЛЮДИ
↓
ФОРМА
МЕНЯЕТСЯ
↓
CORE
ОСТАЁТСЯ
```

Она пережила:

- Quake как flagship;

- original team;

- Carmack;

- independent id;

- ZeniMax;

- Microsoft;

- пандемию.

### Ирония с E3

Hollenshead ещё в 2007 говорил, что QuakeCon даёт id более сфокусированное внимание, чем огромный noisy E3.

E3 в итоге исчезает как annual institution.

QuakeCon живёт.

Почему?

Потому что E3 в основе — marketing infrastructure.

QuakeCon — community ritual.

YouTube trailer может заменить press conference.

Он не заменяет четыре дня LAN с людьми, которых ты видишь раз в год.

### Главный итог

Doom/Quake — произведения id Software.

QuakeCon — произведение community, которое id сумела не задушить и постепенно превратить вместе с фанатами в долговечный институт.

Это, возможно, самая непрерывная связь old id с её PC-community.

[↑ К содержанию](#contents)

---
## 77. id Software Frankfurt и распределённая engine-команда { #p077 }

Когда мы говорили про post-Carmack id, схема была:

```
CARMACK
↓
id Tech
```

потом:

```
CARMACK OUT
↓
Duffy / Sousa / Khan / Gneiting / Geffroy / engine team
```

Это правильно, но неполно.

Современный idTech перестаёт быть не только движком одного человека, но и technology одной физической studio в Texas.

### 2015 — id Software Frankfurt

ZeniMax открывает Frankfurt branch именно как **technology development studio** и extension основной id Software.

Не localization office.

Не separate game studio.

Не porting department.

Mission:

```
idTech
FOR DOOM
+
OTHER ZENIMAX TITLES
```

### Почему Frankfurt

У ZeniMax уже есть там publishing presence.

Но есть и очевидный кадровый контекст: Frankfurt — дом Crytek и сильной high-end engine culture.

### Tiago Sousa — важная хронологическая связь

В 2014, ещё до открытия Frankfurt office, id нанимает Tiago Sousa из Crytek как Lead Rendering Programmer и перевозит его в Richardson.

То есть нельзя писать:

```
Sousa
создал
Frankfurt office
```

Но timeline очень показательный:

```
2014
id забирает
elite CryEngine engineer
из Frankfurt
↓
2015
id открывает
свой technology center
во Frankfurt
```

### Смена hiring philosophy

Старая id:

```
ХОЧЕШЬ
РАБОТАТЬ
С CARMACK?
↓
ПРИЕЗЖАЙ
В TEXAS
```

Modern high-end engine talent слишком редкий, чтобы ограничивать hiring одним городом.

Frankfurt позволяет:

```
ENGINE TALENT
НЕ ОБЯЗАН
ПЕРЕЕЗЖАТЬ
В TEXAS
```

### ZeniMax ownership даёт global hiring infrastructure

Продажа 2009 означает не только capital.

Она даёт corporate footprint, внутри которого id может стать multi-location engineering organization.

### Frankfurt — engine office

Его public hiring/history ориентированы на engine programmers и technology roles.

У него нет отдельного «id Frankfurt presents... franchise».

Его продукт — infrastructure.

И именно поэтому вклад легко не заметить.

Когда infrastructure работает хорошо, player просто говорит:

```
DOOM
ИДЁТ
ОХУЕННО
```

### Почему это важно после Carmack

Succession можно решить двумя способами.

```
НАЙТИ
CARMACK 2
```

или:

```
ПОСТРОИТЬ
ENGINE ORGANIZATION
```

id делает второе.

Knowledge распределяется между rendering, systems, tools, performance, platform и другими specialists.

Frankfurt делает распределённость буквально видимой на карте.

### Doom 2016 — ранний proof

Frankfurt открывается в 2015, когда id Tech 6 уже глубоко разрабатывается.

Нельзя приписывать office весь Doom 2016 engine.

Но именно в этот период temporary post-Carmack survival превращается в permanent engineering structure.

### Office остаётся надолго

К 2026 официальный id всё ещё существует минимум в Richardson и Frankfurt, а Frankfurt продолжает позиционироваться как technology/idTech extension.

То есть это не one-project satellite.

### MachineGames превращает систему ещё в более распределённую

Сначала схема:

```
id
→ engine provider

MachineGames
→ engine user
```

Со временем MachineGames глубоко модифицирует lineage под собственные games и становится contributor/technology partner.

К 2020-м relation уже двусторонняя.

### 2026 — Hugo Martin прямо говорит о distributed idTech

После крупных layoffs возникает страх:

```
idTech
УМЕР?
```

Ответ leadership:

```
idTech
VERY MUCH
ALIVE
```

и важный аргумент:

```
engineers
есть
во Frankfurt
и
в MachineGames
```

То есть headcount Richardson ≠ total idTech capability.

### Современная схема

```
                  id TECH
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
   id TEXAS     id FRANKFURT   MACHINEGAMES
```

Это уже внутренний technology network.

### MachineGames branch / Motor

MachineGames настолько глубоко адаптирует lineage под свои projects, что появляется собственная engine identity/branch Motor для Indiana Jones lineage.

То есть sibling studio уже не просто потребитель.

Она развивает technology под иной creative problem.

### Плюсы distributed model

- меньше bus factor одного человека;

- шире talent pool;

- разные games дают разные engine requirements;

- knowledge существует в нескольких locations;

- organization устойчивее к departure одного engineer/office.

### Минусы

Knowledge fragmentation.

Старая model:

```
КТО
ЗНАЕТ
SYSTEM?
↓
СПРОСИ
JOHN
```

Modern:

```
часть
во Frankfurt
часть
в Texas
часть
в Sweden
часть писал
человек,
который ушёл
```

Теперь documentation, code review, ownership boundaries, CI, version control discipline и remote collaboration — не bureaucracy luxury, а условие существования engine.

### Import чужих engineering schools

Modern idTech уже не чистая Carmack school.

Она впитывает:

```
CARMACK LEGACY
+
CRYTEK EXPERIENCE
+
SNOWDROP / OTHER ENGINE EXPERIENCE
+
MACHINEGAMES PRODUCTION
+
NEW ENGINEERS
```

Живая culture не консервирует старый style — она умеет поглощать сильные внешние идеи.

### Связь с middleware problem

idTech не продаётся наружу как Unreal.

Но внутри ZeniMax несколько teams всё равно создают middleware-like requirement:

- reusable systems;

- tools;

- support;

- shared fixes;

- stable collaboration.

То есть id не стала Epic, но внутри собственного ecosystem ей всё равно приходится осваивать часть middleware discipline.

### Главный итог

После Carmack id не просто наняла других программистов.

Она перестроила engineering:

```
PERSON-CENTERED
↓
TEAM-CENTERED
↓
MULTI-OFFICE
↓
MULTI-STUDIO
```

Frankfurt — момент, когда эта трансформация становится физически видимой.

[↑ К содержанию](#contents)

---
## 78. RAGE 2 и судьба франшизы RAGE { #p078 }

RAGE 2 важна не как «ещё один sequel», а как момент, когда id наконец признаёт:

### другую часть собственной игры другая studio умеет делать лучше.

### Главный lesson первой RAGE

Первая игра хотела:

```
FPS
+
OPEN WORLD
+
CARS
+
RACING
+
HUBS
+
QUESTS
```

Но id Tech 5 не была настоящей open-world technology.

```
WASTELAND
↓
LOAD
↓
FPS LEVEL
↓
LOAD
↓
WASTELAND
```

Willits позднее формулирует brutally:

> не делайте open-world game без open-world technology.

### RAGE 2 должна сделать ту игру, которую обещала первая

Seamless world:

```
DRIVE
↓
SEE ACTIVITY
↓
STOP
↓
SHOOT
↓
DRIVE
```

Без отдельного loading transition между «world» и «FPS level».

### Почему Avalanche

Avalanche Studios — Just Cause, Mad Max, open-world systems, vehicles, streaming, physics.

То есть компания буквально специализируется на том, где первая RAGE была слабее.

Разделение competence почти идеальное:

```
id
→ gunplay / feel / shooter knowledge

Avalanche
→ open world / vehicles / systems / Apex Engine
```

### Production реально в основном Avalanche

Main development идёт в Stockholm.

id участвует в creative/shooter side, регулярно играет, тюнингует weapons, enemy reactions, animation timing, movement feel.

Willits описывает это как передачу magic sauce — не одной DLL, а tacit knowledge через playtest/feedback.

### Самый важный технический факт: RAGE 2 не использует id Tech

Она работает на Apex Engine Avalanche.

И это огромный ideological shift.

RAGE 1:

```
id Tech 5
↓
GAME
```

RAGE 2:

```
GAME NEEDS
OPEN WORLD
↓
Apex
ПОДХОДИТ
ЛУЧШЕ
↓
ИСПОЛЬЗУЕМ
ЧУЖОЙ ENGINE
```

Для старой Carmack-id почти ересь.

Для game-first id — правильное решение.

### Это доказывает: id-feel не сидит внутри idTech

No id Tech.

Main production outside Texas.

Но shooting всё равно reviewers описывают как сильнейшую часть game.

Значит часть identity передаётся через criteria/tuning, а не только source code.

### RAGE 2 резко меняет визуальную identity

Первая RAGE — brown/grey/dust/rust.

RAGE 2 — neon, hot pink, purple, green, post-post-apocalypse.

Идея: civilization не только выживает после конца света, но уже начинает расти обратно.

Это попытка отделиться от generic wasteland aesthetic Fallout/Borderlands/Mad Max-era.

### Walker и power fantasy

Вместо почти silent Nicholas Raine — более выраженный protagonist Walker.

Плюс Nanotrite abilities:

- Shatter;

- Slam;

- Vortex;

- Dash;

- Rush;

- Grav-Jump;

- Overdrive.

Combat теперь напоминает:

```
DOOM 2016
+
SUPERPOWERS
+
AVALANCHE PHYSICS
```

Enemy bodies становятся почти частью sandbox.

### И вот partnership реально работает в combat

id gun feel + Avalanche physics дают сильную action system.

Но дальше возникает неприятный вопрос:

### зачем RAGE вообще нужен open world?

### Техническая проблема RAGE 1 решена

Теперь world настоящий и seamless.

Но design problem остаётся:

```
ЛУЧШАЯ
ЧАСТЬ GAME
=
COMBAT

А МЕЖДУ
COMBAT
=
TRAVEL / MAP / ACTIVITIES
```

Если open-world layer не так хорош, он снижает density.

### Activity structure

Bandit dens, Authority points, Arks, convoys, exploration locations.

Функционально:

```
ICON
↓
ПРИЕХАЛ
↓
УБИЛ
↓
ЗАЧИСТИЛ
↓
REWARD
```

К 2019 эта grammar уже очень знакомая рынку.

### Reviews очень стабильно формулируют раскол

```
SHOOTING
=
ОТЛИЧНО

WORLD / STORY
=
ГОРАЗДО
СЛАБЕЕ
```

И это пугающе похоже на диагноз первой RAGE — хотя сменились engine, studio и structure.

Значит проблема глубже конкретного implementation.

### Cars снова не равны gunplay

Avalanche умеет vehicles намного лучше old id.

Но в RAGE 2 всё равно часто лучший момент машины — когда player из неё выходит и начинается shooting.

Если franchise fantasy предполагает vehicular open-world FPS, это structural warning.

### Почему RAGE так и не получает identity силы Doom/Quake/Wolfenstein

Doom вызывает мгновенно:

```
demons
shotgun
hell
Slayer
aggression
```

Wolfenstein:

```
BJ
Nazis
alternate history
```

Quake хотя бы вызывает rocket/rail/movement/gothic/Strogg contradictions.

RAGE?

Wingstick? Mutants? Authority? Wasteland? Cars? Nanotrites?

Все элементы нормальные, но нет одного cultural anchor той же силы.

### Первая RAGE имела technical identity сильнее franchise identity

```
RAGE?
→ та game с MegaTexture
```

Это плохой фундамент для sequel через десять лет.

### RAGE 2 пытается создать fantasy «wasteland superhero»

Но mechanical core опасно близко к modern Doom:

```
GUNS
MOVEMENT
ABILITIES
FAST AGGRESSIVE COMBAT
```

А Doom позволяет этим strengths работать чище — без обязательного open-world overhead.

### Post-launch support

RAGE 2 не бросают сразу.

Rise of the Ghosts добавляет region, faction, weapon, Void ability, vehicle и story.

TerrorMania вообще уходит в альтернативную Deadlands/skeleton/sword absurdity.

Это показывает плюсы IP:

```
В RAGE
МОЖНО
ВПИХНУТЬ
ПОЧТИ
ЧТО УГОДНО
```

Но это одновременно weakness:

```
ЕСЛИ
МОЖНО
ВСЁ

ТО
ЧТО
ОБЯЗАТЕЛЬНО
ДОЛЖНО
БЫТЬ
RAGE?
```

### Willits хотел RAGE 3

После release он публично говорил, что с удовольствием сделал бы RAGE 3 как можно скорее.

Но через несколько месяцев сам уходит из id.

Carmack давно gone.

Два главных historical champions franchise больше не внутри studio.

### Нет permanent creative home

Doom → id.

Wolfenstein → MachineGames.

RAGE:

```
RAGE 1
→ id

RAGE 2
→ Avalanche + id

RAGE 3
→ ?
```

Avalanche не становится постоянной RAGE studio.

Это очень слабая institutional position.

### Коммерчески

Точных public lifetime sales недостаточно, чтобы честно писать «провал».

Но нет признаков breakout hit уровня, который автоматически требует третью часть.

Критически — decent/mixed-to-good, но не Doom 2016-type event.

### 2026

RAGE 3 не анонсирована.

Franchise официально не объявлена мёртвой, но фактически dormant.

### Главный исторический смысл RAGE 2

Она стала уроком организации, а не новым великим столпом.

```
OWN TECH
НЕ РЕЛИГИЯ
```

```
EXTERNAL EXPERTISE
МОЖЕТ
БЫТЬ
ЛУЧШЕ
```

```
id-FEEL
МОЖНО
ПЕРЕДАТЬ
ДРУГОЙ TEAM
```

```
TECHNOLOGY PROBLEM
И
DESIGN PROBLEM
НЕ ОДНО
И ТО ЖЕ
```

Первая RAGE научила: great technology не создаёт automatically great open world.

Вторая: great open-world technology тоже не делает world автоматически интересным.

[↑ К содержанию](#contents)

---
## 79. Heretic + Hexen 2025 — современное замыкание истории id/Raven { #p079 }

Вот здесь получается почти идеальная историческая петля.

1994:

```
id Software
↓
Doom technology
+
production/publishing relationship
↓
Raven Software
↓
HERETIC
```

1995:

```
Raven + id
↓
HEXEN
```

Потом компании расходятся корпоративно на десятилетия.

```
Raven
→ Activision
```

```
id
→ ZeniMax / Bethesda
```

А затем Microsoft собирает обе линии под одним ultimate owner.

### Почему Heretic/Hexen вообще часть истории id

Это Raven games, а не тайно ещё две id games.

Но они выросли на Doom technology и в тесной producer/publisher/technical relationship с id.

Raven берёт Doom language и спрашивает:

```
А ЧТО
ЕСЛИ
НА ЭТОМ
СДЕЛАТЬ
DARK FANTASY?
```

Heretic добавляет fantasy weapons, inventory, vertical aiming и другой atmosphere.

Hexen идёт дальше: classes, hubs, puzzles, backtracking, более RPG-like structure.

Это ранний proof:

```
DOOM ENGINE
НЕ ОБЯЗАН
ПРОИЗВОДИТЬ
DOOM
```

### Raven уходит под Activision

В 1997 Raven становится wholly owned Activision studio.

Но связь с id technology не исчезает: Hexen II, Soldier of Fortune, Jedi Knight II/Jedi Academy, Quake 4 и другие projects продолжают technical lineage.

### id уходит под ZeniMax

2009.

Теперь старые partners находятся под разными огромными publishers.

### Права становятся сложной мозаикой

К 2025 legal footer новой collection выглядит почти как корпоративная археология:

- Heretic/Hexen trademarks — Activision;

- copyrights original Raven games — Raven;

- modern compilation copyright — ZeniMax;

- developers — id Software + Nightdive;

- publisher — Bethesda.

То есть одна коробка содержит 30 лет ownership history.

### Microsoft замыкает линии

2021:

```
ZeniMax
→ Microsoft
```

2023:

```
Activision Blizzard
→ Microsoft
```

Впервые за десятилетия id и Raven снова находятся внутри одной ultimate corporate family.

Важно не перегнуть: modern Raven не co-develops new remaster. Actual development — id + Nightdive. Но rights alignment становится существенно проще внутри одной Microsoft umbrella.

### 7 августа 2025 — QuakeCon shadow drop

Выходит **Heretic + Hexen**.

Не trailer «через два года».

```
AVAILABLE TODAY
```

Идеально вписывается в новую Nightdive/Bethesda QuakeCon tradition classic-FPS restorations.

### Что входит

- Heretic: Shadow of the Serpent Riders;

- Hexen: Beyond Heretic;

- Hexen: Deathkings of the Dark Citadel;

- новый Heretic episode Faith Renewed;

- новый Hexen episode Vestiges of Grandeur.

Суммарно огромный набор campaign/deathmatch maps.

### Hexen II не входит

Это важно зафиксировать.

Old Heretic + Hexen Collection когда-то включала Hexen II, но новый enhanced product — нет.

Логичный inference: Heretic/Hexen — Doom-engine lineage, Hexen II — Quake-engine game и требует отдельной restoration work.

Но это inference, а не официально подтверждённая причина.

### Preservation philosophy

Не DOSBox-wrapper.

Modern product пытается балансировать:

```
ЧТО
СОХРАНИТЬ

И

ЧТО
УЛУЧШИТЬ
```

### Hexen wayfinding

Оригинальные hubs/puzzles — одновременно сильная identity и источник фрустрации.

Modern edition добавляет optional guidance/waypoint-like assistance на automap.

Важно:

```
НЕ
УБРАЛИ
НЕЛИНЕЙНОСТЬ

А
ДАЛИ
OPTIONAL
ПОМОЩЬ
```

### Hexen Chronicle / class switching

Оригинал предлагает Fighter/Cleric/Mage, но обычный run показывает один class.

Modern system позволяет переключаться и увидеть разные playstyles внутри одного прохождения.

Это серьёзное изменение, но оно делает original class-system **видимее** большинству players.

### Enhanced и original behaviours существуют рядом

Можно вернуть classic-style behaviour через options.

Правильная preservation philosophy:

```
MODERNIZE
BY DEFAULT
↓
PRESERVE
AS OPTION
```

### Новые episodes продолжают старый язык

Faith Renewed lead'ит Samuel `Kaiser` Villarreal — тот же preservation lineage, который мы уже видели вокруг Doom 64/Nightdive.

Vestiges of Grandeur продолжает Hexen hub/puzzle grammar, а не превращает её в обычный linear shooter pack.

### Community снова входит в official production

В новых episodes участвуют люди из modding/community scene.

То есть снова:

```
FAN
↓
MODDER
↓
PRESERVATION SPECIALIST
↓
OFFICIAL CONTENT
```

### Raven Vault

Внутри release появляется архив concept art, unused sprites и production materials.

Но команда идёт дальше: часть unused Raven art 1990-х превращается в новых official enemies.

Это буквально:

```
UNUSED ART
1990s
↓
2025
NEW PLAYABLE
CONTENT
```

Очень красивая форма «сотрудничества через время» с original Raven artists.

### Mod support

Heretic/Hexen живут десятилетиями через Doom-family source-port/mod culture.

Modern edition получает integrated community mod support/browser.

И это логично ещё и технически: современная DOOM + DOOM II infrastructure уже умеет многое из нужного.

Получается technology tree, который спустя 30 лет снова сходится:

```
Doom engine
↓
Heretic / Hexen
↓
community lineage
↓
modern Doom infrastructure
↓
modern Heretic + Hexen
```

### Multiplayer

Modern cross-platform co-op/deathmatch, local split-screen, high-resolution/high-refresh support.

Game 1994–95 получает infrastructure, которая была бы фантастикой для original Raven.

### Soundtrack

Andrew Hulshult делает modern enhanced soundtrack, но original music сохраняется selectable.

Опять:

```
NEW INTERPRETATION
+
ORIGINAL
```

а не replacement history.

### Почему это хороший эпилог id/Raven

В одном release сходятся почти все наши themes:

```
ENGINE LICENSING
```

```
id как publisher/producer
```

```
Raven external creativity
```

```
MODDING
```

```
OPEN-SOURCE / SOURCE-PORT CULTURE
```

```
NIGHTDIVE PRESERVATION
```

```
QUAKECON
```

```
MICROSOFT OWNERSHIP
```

```
COMMUNITY → PROFESSIONALS
```

### Вся петля

```
1993
DOOM ENGINE
↓
1994
Raven + id
→ HERETIC
↓
1995
→ HEXEN
↓
1997
Raven → Activision
↓
id и Raven
расходятся
↓
2009
id → ZeniMax
↓
2021
ZeniMax → Microsoft
↓
2023
Activision → Microsoft
↓
2025
id + Nightdive
возвращают
HERETIC + HEXEN
↓
новые episodes
+
Raven Vault
+
unused art → new monsters
+
mod support
+
modern multiplayer
```

### Главный итог

Heretic + Hexen 2025 — не просто хороший remaster старых FPS.

Это аккуратное замыкание одной из самых старых внешних ветвей истории id.

Raven когда-то взяла technology id и спросила:

```
А ЧТО
ЕЩЁ
МОЖНО
НА НЕЙ
СДЕЛАТЬ?
```

Через тридцать лет Nightdive, id и community смотрят на старую Raven-work и задают почти тот же вопрос.

И modern preservation philosophy оказывается очень здоровой:

### не замораживать старую game в музее; сохранить её, сделать доступной, вернуть historical context, дать community продолжать и очень осторожно дописать несколько новых страниц.

[↑ К содержанию](#contents)


---

[← XI. Наследие и выводы](11-legacy-summary.md) · [Общее оглавление](index.md)
