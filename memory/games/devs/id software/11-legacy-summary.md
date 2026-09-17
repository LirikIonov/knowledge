# id Software — XI. Наследие id: open source, modding и исторические выводы

> Часть большой базы по истории id Software. Пункты **67–74**. Содержательный текст исходного документа сохранён без сокращений.

[← X. Перерождение Doom](10-doom-rebirth-modern-id.md) · [Общее оглавление](index.md) · [XII. Боковые ветви →](12-side-branches.md)

### Содержание { #contents }

- [67. id Software и open source — самое недооценённое наследие Carmack-era](#p067)
- [68. id Software и modding community](#p068)
- [69. Почему id Tech не стала Unreal Engine](#p069)
- [70. Все поколения id Software](#p070)
- [71. Кто реально сделал id Software](#p071)
- [72. Что id Software исторически делала лучше всех — и где систематически была слабой](#p072)
- [73. Мифы об id Software](#p073)
- [74. Главная историческая дуга id Software](#p074)

---

## 67. id Software и open source — самое недооценённое наследие Carmack-era { #p067 }

Простой пересказ:

> Carmack любил open source и поэтому выкладывал старые engines.

Правда, но масштаба не передаёт.

id десятилетиями делала почти противоестественную для коммерческой AAA-компании вещь:

```
ПОТРАТИЛИ
ГОДЫ
НА ENGINE
↓
ПРОДАЛИ
GAME
↓
ПРОДАВАЛИ
LICENSES
↓
ENGINE
УСТАРЕЛ
↓
ВОТ SOURCE
```

В публичный доступ уходят lineage Wolfenstein 3D, Doom, Quake, Quake II, Quake III, Doom 3/id Tech 4.

### Source code ≠ бесплатная игра

Ключевое разделение:

```
ENGINE SOURCE
=
open / GPL
```

```
ART
LEVELS
MUSIC
SOUNDS
GAME DATA
=
copyrighted
```

Можно сделать standalone game на открытом engine со своими assets.

Но оригинальные commercial data всё ещё нужно легально иметь.

Очень элегантная конструкция:

```
TECHNOLOGY
→ public knowledge

CONTENT
→ commercial IP
```

### Wolfenstein 3D — начало традиции

1995 source release ещё не современный GPL-style open source: license была ограничительной/non-commercial.

Но сама идея уже радикальна:

```
ВОТ
SOURCE
НАШЕЙ
RECENT COMMERCIAL GAME
```

### Doom 1997

23 декабря 1997 Carmack публикует Doom source.

Первоначально Linux version и не GPL.

Почему не полный DOS release?

Потому что proprietary DMX sound library не принадлежит id целиком.

Вот первый большой lesson:

```
ТЫ
НЕ МОЖЕШЬ
ОТКРЫТЬ
ТО,
ЧЕМ
НЕ ВЛАДЕЕШЬ
```

Это потом будет влиять на architectural choices Carmack.

### Doom переходит под GPL

В 1999 Doom relicensed под GNU GPL.

Теперь модель становится copyleft:

```
ВЗЯЛ
SOURCE
↓
ИЗМЕНИЛ
↓
РАСПРОСТРАНЯЕШЬ
DERIVED BINARY
↓
SOURCE CHANGES
ТОЖЕ
ДОЛЖНЫ
ОСТАТЬСЯ
ДОСТУПНЫ
```

Это уже не «посмотрите мой код».

Это попытка создать живую публичную lineage.

### Почему GPL, а не просто public domain

Carmack видел, как закрытые mod forks исчезают вместе с разработчиками/дисками.

GPL защищает community от ситуации:

```
OPEN SOURCE
↓
кто-то
улучшил
↓
закрыл
↓
source
потерялся
```

То есть license — ещё и preservation mechanism.

### Quake 1999

Открываются WinQuake, GLQuake, QuakeWorld, GLQuakeWorld.

Community получает actual shipping implementation одной из самых влиятельных graphics/network architectures десятилетия.

### Quake II 2001

Опять GPL.

Carmack отдельно подчёркивает: commercial use возможен при соблюдении GPL.

Хочешь закрытый commercial fork — можно отдельно договариваться с copyright owner о proprietary license.

Получается dual model:

```
OPEN PROJECT
→ GPL

CLOSED COMMERCIAL
→ отдельная licence
```

### Cheats argument

Открытый multiplayer source очевидно помогает читерам.

Carmack отвечает очень характерно: absolute cheat-proof client всё равно фундаментально невозможен, если code исполняется на машине потенциально hostile user.

Не надо платить вечной закрытостью за иллюзию полной security.

### Quake III 2005

Открывается уже огромная часть development stack:

- renderer;

- game code;

- OS layer;

- bot tools;

- QVM toolchain;

- q3map;

- Q3Radiant.

Теперь public получает не только runtime, но значительную часть того, **как game производилась**.

### ioquake3

Из GPL-релиза вырастает долгоживущая free-software lineage:

- bug fixes;

- новые OS;

- 64-bit;

- audio improvements;

- networking;

- build systems;

- standalone games.

Компания перестаёт поддерживать engine — community не обязана прекращать.

### Doom source ports

Это вообще отдельная цивилизация.

После source release Doom постепенно становится независима от исходного DOS machine.

Community переписывает platform layers, renderers, input, networking, scripting, limits.

Отсюда культурное:

```
DOOM
RUNS
ON EVERYTHING
```

имеет технический фундамент, а не только мем.

### Doom 3 / id Tech 4 — 2011

22 ноября 2011 id открывает Doom 3 source под GPLv3.

Перед release всплывает patent issue с shadow technique.

Carmack не говорит «ну ладно, отменяем».

Он переписывает проблемную implementation, чтобы source можно было legal-safe выпустить.

Это очень сильное доказательство личной conviction.

### И всё это происходит уже после продажи ZeniMax

То есть формула:

```
ZeniMax
купила id
↓
open source
сразу умер
```

неверна.

После acquisition выходят RTCW/Enemy Territory source и Doom 3 GPL.

Пока Carmack внутри и продавливает policy — ZeniMax её допускает.

### Почему Carmack это делал

Не одна причина.

#### Обучение

Молодой developer может открыть **реальный shipping engine**, а не tutorial sample.

#### Preservation

OS меняется — community портирует.

Compiler меняется — community чинит.

Company исчезла — code всё ещё живёт.

#### Инженерная честность

Старая технология, которая больше не является competitive secret, может стать knowledge.

#### Community maintenance

id больше не финансирует engine, но community продолжает fixes/ports.

#### Foundation для новых games

GPL-engine + свои assets \= standalone product.

### Source releases как исторический архив graphics programming

Можно буквально читать эволюцию:

```
Wolf3D
→ ray casting

Doom
→ BSP / 2.5D

Quake
→ polygonal 3D / client-server

Quake II
→ mature OpenGL / game modules

Quake III
→ shaders / VM / arena architecture

Doom 3
→ unified dynamic lighting / modern C++
```

Редчайший публичный geological record коммерческого realtime 3D.

### id Tech 5 должна была продолжить традицию

Carmack в 2007 прямо говорил: id Tech 5 eventually тоже должна стать open source. Он называл это «law of the land» внутри id и personal conviction.

Более того, architectural decisions старались принимать так, чтобы proprietary dependencies не сделали будущий source release невозможным.

Но этого не произошло.

### Граница эпох

```
id Tech 1
open

id Tech 2
open

id Tech 3
open

id Tech 4
open

────────────

id Tech 5
closed

id Tech 6
closed

id Tech 7
closed

id Tech 8
closed
```

Очень символично:

```
2011
последний major GPL release
↓
2013
Carmack leaves
↓
дальше
ни одного major idTech
GPL release
```

### Но не надо писать «Bethesda запретила»

Одной официальной причины нет.

Вероятнее всего складываются:

- уход главного internal champion;

- изменение strategic role idTech;

- shared internal branches;

- third-party/console NDA complexity;

- дорогой legal cleanup;

- отсутствие business priority.

Главное различие:

```
CARMACK-era:
FUTURE OPEN SOURCE
=
ARCHITECTURAL CONSTRAINT
СЕГОДНЯ
```

```
MODERN era:
FUTURE OPEN SOURCE
=
НЕ ЗАЯВЛЕННАЯ
DESIGN GOAL
```

Вот реальный культурный разрыв.

### Парадокс modern id

Она значительно лучше занимается preservation **игр**:

- Doom 64;

- Quake;

- Quake II;

- DOOM + DOOM II;

- Heretic/Hexen.

Но хуже занимается preservation **engine source**.

Официальный remaster означает:

```
КОМПАНИЯ
ДАЁТ
ТЕБЕ
СОВРЕМЕННУЮ
ВЕРСИЮ
```

Open source означает:

```
ДАЖЕ
ЕСЛИ
КОМПАНИЯ
ИСЧЕЗНЕТ

COMMUNITY
МОЖЕТ
ПРОДОЛЖАТЬ
```

И это более радикальная свобода.

### Главный итог

id сохранила Carmack-values:

```
PERFORMANCE
LOW LATENCY
OWN ENGINE
LOW-LEVEL CONTROL
SHIP WORKING CODE
```

Но почти не сохранила:

```
OLD ENGINE
SHOULD
EVENTUALLY
BECOME
FREE SOFTWARE
```

Это отличный пример разницы между **company DNA** и **personal Carmack DNA**.

[↑ К содержанию](#contents)

---
## 68. id Software и modding community { #p068 }

id не изобрела модификацию игр.

Но она сделала нечто важнее для modern PC culture:

### превратила moddability из случайной уязвимости программы в сознательное свойство продукта.

### Wolfenstein 3D — lesson

Игроки сами начинают reverse-engineer data, менять maps/sprites.

Carmack видит:

```
ЛЮДИ
ВСЁ РАВНО
БУДУТ
ЛОМАТЬ
GAME
```

И в Doom решает архитектурно облегчить это.

### Doom разделяет engine и data

Условно:

```
DOOM.EXE
=
engine / logic
```

```
DOOM.WAD
=
levels
textures
sprites
sounds
music
data
```

PWAD позволяет распространять только delta/replacement resources, а не всю игру.

Это гениально одновременно технически и коммерчески:

```
MOD
маленький
↓
легко качать
↓
не содержит
всю Doom
↓
base game
всё ещё нужна
```

### Но editor id не выдала как consumer product в день релиза

Community сама строит toolchain:

- Unofficial Doom Specs;

- DEU;

- node builders;

- graphics/audio tools;

- tutorials.

Уже весной 1994 полноценные user maps реально распространяются.

То есть id открывает дверь, а community строит лестницу.

### Doom WAD сначала не даёт менять всё

Можно менять maps/assets, но game logic сильно hard-coded.

Community отвечает DeHackEd и другими hacks.

И следующая id-game уже делает следующий логичный шаг.

### QuakeC — теперь можно менять game logic

Quake даёт специальный C-like language для значительной части game-side logic.

Теперь modder может быть:

```
LEVEL DESIGNER
+
GAMEPLAY PROGRAMMER
+
SYSTEM DESIGNER
```

Вот переход от «новая карта» к «новая game внутри game».

### Team Fortress

Начинается как Quake mod.

Вводит class-based team structure, roles, unique weapons, cooperation.

Дальше creators уходят в Valve.

Появляются Team Fortress Classic и Team Fortress 2.

То есть Quake mod порождает самостоятельную franchise другой компании.

### Threewave CTF

Community превращает capture-the-flag в один из стандартных multiplayer FPS modes.

Позднее автор Zoid работает в id.

Community design становится official design vocabulary.

### Rocket Arena

Берёт Quake и говорит:

```
А ЧТО
ЕСЛИ
УБРАТЬ
RESOURCE PICKUPS

И ДАТЬ
ВСЕМ
WEAPONS
СРАЗУ?
```

То есть mods становятся distributed game-design R&D.

### Machinima

Quake demo recording + controllable actors/camera превращаются в early machinima.

Game становится не только game platform, но programmable realtime 3D culture platform.

### Modding превращается в hiring pipeline

Willits — Doom modder → id.

Zoid — community creator → id.

Другие люди уходят в Valve, Ion Storm, Looking Glass, Ritual и т.д.

Теперь level designer может доказать skill:

```
НЕ CV

А
ГОТОВАЯ MAP
```

### Master Levels и Final Doom

id начинает официально покупать/курировать community content.

Final Doom особенно красивая петля:

```
COMMUNITY
делает megawad
↓
id
превращает
в official retail Doom
```

То есть UGC становится commercial product задолго до современного creator-economy языка.

### Quake II / Quake III институционализируют SDK culture

Game modules, QVM, Radiant, map compilers.

К концу 1990-х id technology почти предполагает:

```
КТО-ТО
ОБЯЗАТЕЛЬНО
БУДЕТ
ЭТО
МЕНЯТЬ
```

### Doom 3 всё ещё глубоко mod-friendly

SDK открывает AI, entities, physics, weapons, animation, scripting, game logic.

The Dark Mod — великолепный пример:

```
DOOM 3
ENGINE
↓
полноценная
STEALTH GAME
```

После open-source id Tech 4 проект становится standalone.

### RAGE показывает новую проблему AAA modding

id выпускает реальные production tools.

Но toolkit — десятки гигабайт и industrial complexity.

Формально openness остаётся.

Практически entry barrier взрывается.

Сравнение:

```
DOOM 1994
map
→ маленький editor
→ WAD
```

```
RAGE
map
→ industrial pipeline
→ huge assets
→ complex tools
```

Проблема не только corporate closure.

### Сама разработка игры стала на порядки сложнее.

### Consoles усложняют всё ещё сильнее

Modern game живёт в мире:

- signed packages;

- certification;

- sandboxing;

- security;

- entitlements;

- online services;

- UGC moderation.

Нельзя просто сказать console player:

```
положи
любой binary
в папку
```

### SnapMap 2016 — другая философия

SnapMap не traditional modding.

Это accessible consumer creation system.

```
Classic Quake modding:
POWER ██████████
ACCESSIBILITY ██
```

```
SnapMap:
POWER ████
ACCESSIBILITY ██████████
```

Rooms/logic/enemies уже готовы. Player собирает LEGO-like structures даже с controller.

Очень удобно.

Но нельзя импортировать полноценный custom art или переписать engine/game code как в QuakeC-era.

Цена accessibility — sandbox.

### Community Eternal снова начинает ломать game сама

Даже без official tools люди reverse-engineer Doom Eternal, меняют encounters, balance, assets и gameplay.

И modern id неожиданно повторяет old Wolfenstein lesson:

```
COMMUNITY
ВСЁ РАВНО
ДЕЛАЕТ
MODS
↓
ДАВАЙТЕ
ДАДИМ
НОРМАЛЬНЫЕ
TOOLS
```

### idStudio для Doom Eternal

В 2024 public beta, в 2025 полноценный official mod support.

И здесь уже важно: это не SnapMap.

idStudio — production-grade editor той же линии, которой реально пользовались разработчики.

Можно менять/создавать:

- materials;

- textures;

- models;

- animations;

- sounds;

- declarations;

- entities;

- map geometry;

- navigation;

- полноценные maps.

То есть deep modding возвращается.

### Но цена современности огромна

Editor \~десятки гигабайт, asset packs тоже огромные, нужны серьёзные RAM/CPU/GPU и понимание production pipeline.

Поэтому:

```
REAL MODDING
ВЕРНУЛОСЬ

НО
OLD-SCHOOL
LOW ENTRY COST
НЕ ВЕРНУЛСЯ
```

### Distribution тоже централизованнее

Bethesda accounts, mod portal, supported versions, EULA.

Техническая power высокая.

Анархическая независимость Quake 1996 — ниже.

### DOOM + DOOM II modern mod browser

Classic Doom получает integrated browser, publishing и modern UX.

При этом PC-local WAD workflow тоже сохраняется.

Это очень правильная комбинация:

```
OLD OPEN FILE CULTURE
+
MODERN DISTRIBUTION
```

### Почему Doom 1993 modding невозможно буквально повторить

Не только из-за корпораций.

Doom попала в уникальный sweet spot:

```
ДОСТАТОЧНО
СЛОЖНАЯ
ЧТОБЫ
СОЗДАВАТЬ
НЕВЕРОЯТНЫЕ
ВЕЩИ

И

ДОСТАТОЧНО
ПРОСТАЯ
ЧТОБЫ
ОДИН
ЧЕЛОВЕК
МОГ
ПОНЯТЬ
ПОЧТИ
ВСЮ
SYSTEM
```

Modern AAA level требует специалистов по art, materials, animation, nav, lighting, VFX, sound, streaming, collision и т.д.

Открыть дверь можно.

Но за дверью уже завод, а не мастерская.

### Главный итог

id вернула modding как современную product value.

Но hacker-level свобода old Doom/Quake всё равно выше — особенно потому, что engine source тогда eventually становился public.

```
TOOLKIT
=
разработчик
задаёт границы

SOURCE
=
границу
можно
переписать
```

Именно поэтому classic Doom остаётся почти бесконечно расширяемой.

[↑ К содержанию](#contents)

---
## 69. Почему id Tech не стала Unreal Engine { #p069 }

Очень легко построить неправильный сюжет:

```
id Tech
была лучшая
↓
потом Unreal
стала технически лучше
↓
все ушли туда
```

Нет.

id technology была чудовищно влиятельна и коммерчески успешна. На Quake/Quake II/Quake III lineage выросли Half-Life, Medal of Honor, Call of Duty, Jedi Knight, Alice, Elite Force, Soldier of Fortune и другие.

Проблема другая:

### id продавала великолепный engine. Epic строила middleware company.

### Engine и middleware — не одно и то же

Internal engine может работать так:

```
что-то сломалось
↓
крикнул
через комнату
ДЖОН!
```

Middleware customer находится в другой стране, делает другой genre и должен сам понять:

- install;

- build;

- import assets;

- write gameplay;

- profile;

- port to console;

- upgrade version;

- ship.

То есть продаётся не renderer.

Продаётся **production system**.

### Настоящий middleware состоит из скучной инфраструктуры

Нужны:

- documentation;

- tools;

- sample projects;

- import/export pipeline;

- support;

- training;

- bug database;

- stable APIs;

- console support;

- middleware integrations;

- versioning;

- migration path;

- account management.

И главное — человек, которому licensee может позвонить, когда всё горит.

### Epic очень рано понимает это

Unreal ещё не вышла, а technology уже лицензируют сторонним studios.

Это означает, что engine development с самого начала получает pressure:

```
ДРУГИЕ
ЛЮДИ
ДОЛЖНЫ
ЭТИМ
ПОЛЬЗОВАТЬСЯ
```

Tools становятся commercial product, а не внутренним инструментом.

### Deus Ex — почти идеальный case

Ion Storm Austin рассматривает Quake technology.

Технически впечатляюще.

Но Deus Ex — не просто shooter:

```
FPS
+
RPG
+
STEALTH
+
DIALOGUE
+
SYSTEMIC WORLD
```

Маленькой engineering team пришлось бы серьёзно переделывать shooter-oriented Quake engine.

Unreal предлагает более usable tools и реальную поддержку Epic.

Для studio важнее:

```
TIME TO SHIP
```

чем:

```
КТО
ИМЕЕТ
КРАСИВЕЕ
RENDERER
```

### Carmack и Sweeney задают разные вопросы

Условно:

```
CARMACK:

КАК
СДЕЛАТЬ
ЛУЧШУЮ
TECHNOLOGY
ДЛЯ
НАШЕЙ
СЛЕДУЮЩЕЙ
GAME?
```

```
SWEENEY / EPIC:

КАК
СДЕЛАТЬ
PLATFORM
НА КОТОРОЙ
100 STUDIOS
СМОГУТ
SHIP?
```

Оба требуют великого engineering.

Но культуры разные.

### id engines часто специализированы под конкретный breakthrough

Doom 3:

```
unified lighting
↓
horror / darkness
```

RAGE:

```
virtual texturing
↓
large unique surfaces
```

Doom 2016:

```
60 FPS combat
↓
id Tech 6
```

Это отлично для собственных games.

Universal middleware обязан думать про чужие genres.

### Epic строит platform flywheel

```
MORE LICENSEES
↓
MORE FEEDBACK
↓
BETTER TOOLS
↓
MORE EXPERIENCED DEVELOPERS
↓
MORE THIRD-PARTY INTEGRATIONS
↓
LOWER RISK
FOR NEXT STUDIO
↓
MORE LICENSEES
```

Потом добавляются training, marketplace, plugins, schools, hiring pool.

И после определённой точки рынок выбирает Unreal не только за features, а за ecosystem.

### id сознательно предпочитала boutique licensing

Hollenshead прямо говорил: лучше несколько сильных licensees и prestigious games, чем сотни клиентов, для которых нужно строить огромную support organization.

Это хорошая стратегия для:

```
BOUTIQUE
TECH PROVIDER
```

И плохая, если хочешь стать world standard.

### Middleware — service business

License продал — работа не закончилась.

```
PS3 SDK
обновился
↓
помоги

plugin
сломался
↓
помоги

engine version
новая
↓
migration

crash
у customer
↓
debug
```

Epic согласилась стать такой компанией.

id исторически хотела делать games.

### Tools у id не были плохими

Radiant lineage, Q3Radiant, scripting, SDKs — всё реально сильное.

Но:

```
МОЩНЫЙ
INTERNAL TOOL
≠
ХОРОШО
PRODUCTIZED
EXTERNAL TOOL
```

Вот ключ.

### UE3 — момент, когда гонка почти решена

К середине 2000-х Epic уже имеет огромный licensee ecosystem и partnerships.

id только к id Tech 5 начинает серьёзно усиливать tools programmers, support staff и licensee liaisons.

То есть она наконец диагностирует проблему, но competitor уже десять лет строит business.

### И даже тогда id не хочет масштабироваться как Epic

```
НЕ
100 LICENSEES

А
НЕСКОЛЬКО
СИЛЬНЫХ
PARTNERS
```

Но industry standard требует количества и ecosystem.

### Потом ZeniMax вообще выключает соревнование

2009 acquisition.

2010:

```
id Tech 5
НЕ
ЛИЦЕНЗИРУЕМ
EXTERNALLY
```

Теперь technology — competitive advantage Bethesda/ZeniMax.

После этого вопрос «почему id Tech 6 не победила Unreal» уже неправильный.

Она **не участвует на этом рынке**.

### MachineGames / Arkane / Tango

idTech превращается в internal platform lineage.

Сестринские studios получают technology и адаптируют под свои needs.

У Arkane/Tango появляются глубокие собственные branches/derivatives.

Это снова показывает: technology сильная, но не generic drop-in engine для всего мира.

### Unreal идёт в противоположную сторону

UE4 становится доступной почти всем.

Потом marketplace, plugins, enormous learning ecosystem.

Теперь студент:

```
DOWNLOAD
↓
START
```

idTech:

```
НЕ ПРОДАЁТСЯ
НАРУЖУ
```

Network effect становится вообще несравнимым.

### Hiring effect

Studio выбирает Unreal и получает рынок специалистов, которые уже знают editor/materials/Blueprint/C++ architecture.

Чем больше studios используют Unreal, тем больше людей его знают.

Чем больше людей знают, тем рациональнее следующей studio использовать Unreal.

### Почему modern id не должна пытаться догнать Unreal

Чтобы открыть id Tech 8 внешнему рынку, мало:

```
UPLOAD ENGINE
```

Нужно построить:

- docs;

- devrel;

- support;

- public stable APIs;

- certifications;

- training;

- integrations;

- onboarding;

- customer QA;

- licensing business.

Это огромная новая компания внутри компании.

А напротив уже существует Unreal с тридцатилетним flywheel.

Зачем?

### Что id получила взамен

Она может специализировать engine под свою game.

Не надо поддерживать MMO, racing, film, education, mobile и всё остальное.

Нужно:

```
DOOM
```

И сделать technology ебануто хорошей именно для неё.

Парадоксально, отказ от middleware ambitions помог modern Doom.

### Главный вывод

Epic посмотрела на engine и увидела:

```
PRODUCT / PLATFORM
```

id посмотрела на engine и прежде всего увидела:

```
WEAPON
FOR OUR NEXT GAME
```

Именно поэтому Unreal Engine — мировая платформа, а id Tech — специализированная внутренняя high-performance lineage.

[↑ К содержанию](#contents)

---
## 70. Все поколения id Software { #p070 }

Самый полезный способ смотреть на 35 лет id — не как на одну и ту же компанию, а как на несколько почти разных организаций под одним именем.

### id 1 — Softdisk / Commander Keen, 1990–1991

Главные люди:

```
John Carmack
John Romero
Tom Hall
Adrian Carmack
+
Jay Wilbur
```

Главный вопрос:

```
МОЖЕМ ЛИ
МЫ
СДЕЛАТЬ
PC GAME,
КОТОРАЯ
ВЫГЛЯДИТ
КАК
КОНСОЛЬНАЯ?
```

Carmack решает scrolling problem. Commander Keen доказывает независимую business model через shareware.

Компания ещё почти hacker collective.

Главный продукт — не только Keen, а способ работы:

```
SMALL TEAM
↓
TECH BREAKTHROUGH
↓
FAST GAME
↓
DIRECT MARKET
↓
REPEAT
```

Эпоха заканчивается, когда команда понимает: Softdisk больше не нужен как работодатель.

### id 2 — Wolfenstein / Doom, 1991–1993

Это классическая мифологическая id.

Главная ось:

```
CARMACK
↔
ROMERO
```

Carmack отвечает «что технически возможно?», Romero — «как превратить это в игру?», Hall тянет world/fiction, Adrian — visual identity, Wilbur — business.

Wolfenstein формулирует principle:

```
ЕСЛИ
FEATURE
ТОРМОЗИТ
CORE
→ CUT
```

Doom доводит систему до идеального совпадения technology, game feel, art, sound, distribution, modding, multiplayer.

Именно здесь появляются почти все великие cultural innovations компании.

Эпоха ломается под собственным успехом: маленькая flat team больше не соответствует масштабу ожиданий.

### id 3 — Quake / конфликт Romero-Carmack, 1994–1996

Главная проблема:

```
TECHNOLOGY REVOLUTION
+
GAME DESIGN REVOLUTION
ОДНОВРЕМЕННО
```

Carmack строит full 3D/networking frontier. Design team пытается понять, что такое Quake.

Engine меняется, content устаревает, vision плавает, flat structure не умеет разрешить founder-level conflict.

Quake всё равно становится шедевром и меняет индустрию, но original social structure id практически погибает.

Уход Romero — конец эпохи.

### id 4 — post-Romero Carmack company, 1996–2004

Центр тяжести становится technology roadmap.

```
CARMACK
↓
NEXT ENGINE
↓
TEAM:
КАКУЮ GAME
ДЕЛАЕМ
НА ЭТОМ?
```

Hollenshead профессионализирует business.

Quake II — более production-oriented.

Quake III почти чистая лаборатория movement/weapons/networking.

Engine licensing становится огромной внешней influence.

Doom 3 — вершина technology-first model: rendering thesis буквально рождает horror thesis.

Но здесь уже видно: новая graphics revolution больше не гарантирует новую design revolution.

### id 5 — AAA / RAGE / ZeniMax, 2004–2013

Главный вопрос:

```
КАК
МАЛЕНЬКОЙ
TECH-DRIVEN
id
СТАТЬ
СОВРЕМЕННОЙ
AAA-STUDIO?
```

Team растёт. Adrian уходит. id Tech 5 требует огромной production infrastructure.

RAGE пытается расширить id в driving/hubs/open-world/crafting и показывает предел старой модели.

2009 — ZeniMax: независимость заканчивается, капитал/portfolio infrastructure появляются.

Old Doom 4 — identity crisis: компания смотрит на market language вместо собственного core.

2013 — Hollenshead + Carmack OUT.

Старая post-Romero power structure заканчивается.

### id 6 — post-Carmack reboot, 2013–2020

Главный вопрос:

```
МОЖЕТ ЛИ
id
СУЩЕСТВОВАТЬ
БЕЗ ЛЮДЕЙ,
КОТОРЫЕ
ЕЁ
СОЗДАЛИ?
```

Новый порядок:

```
PLAYER EXPERIENCE
↓
PROTOTYPE
↓
SYSTEMS
↓
TECH
```

Stratton — production/institutional leadership.

Martin — creative.

Willits — continuity.

Engine team — distributed engineering.

Doom 2016 доказывает, что game identity survived.

id Tech 6 доказывает, что engineering survived.

Eternal доказывает, что новая id умеет не только reboot, но и создавать собственную дальнейшую philosophy.

### id 7 — Xbox-era modern id, 2021–

Microsoft владеет ZeniMax.

Но id уже достаточно сильная institution, чтобы owner не был главной creative story.

Dark Ages снова меняет combat thesis.

id Tech 8 строится вокруг game requirements.

MachineGames/Nightdive/external ecosystem расширяют IP stewardship.

Open-source tradition почти исчезает, modding частично возвращается.

2026 layoffs становятся новым stress-test institutional memory.

### Семь поколений одним взглядом

```
id 1
SOFTDISK / KEEN
→ hacker startup
```

```
id 2
WOLF / DOOM
→ tech + game perfect loop
```

```
id 3
QUAKE
→ revolutionary tech + creative conflict
```

```
id 4
POST-ROMERO
→ technology-driven professional studio
```

```
id 5
AAA / RAGE / ZENIMAX
→ scale + identity crisis
```

```
id 6
POST-CARMACK
→ game-first distributed leadership
```

```
id 7
XBOX ERA
→ mature institutional id
```

### Что является дефицитом в каждом поколении

```
id 1
→ деньги / hardware capability

id 2
→ время

id 3
→ согласие

id 4
→ game design сопоставимого масштаба с tech

id 5
→ production capacity + identity

id 6
→ доверие

id 7
→ focus + institutional knowledge
```

### Что проходит через все поколения

- own technology;

- performance as gameplay;

- сильный core;

- prototype > theory;

- отсутствие священного прошлого;

- точный player control.

Что умерло:

- founder ownership;

- shareware economics;

- external engine licensing;

- automatic open-source tradition;

- tiny-team production буквально;

- PC exclusivity;

- Carmack-model `next technology → next game`.

### Главный итог

Современная id не является старой id буквально.

Но существует цепочка передачи criteria:

```
IS IT FAST?
DOES IT FEEL GOOD?
IS THE IDEA CLEAR?
CAN WE REMOVE SOMETHING?
DOES THE PLAYER HAVE CONTROL?
CAN A GREAT PLAYER GET BETTER?
```

И именно поэтому логотип ещё не пустой.

[↑ К содержанию](#contents)

---
## 71. Кто реально сделал id Software { #p071 }

Здесь надо уничтожить две одинаково плохие версии истории:

```
CARMACK
СДЕЛАЛ
ВСЁ
```

и:

```
ВСЕ
БЫЛИ
ОДИНАКОВО
ВАЖНЫ
```

Нет.

Люди были незаменимы **в разных функциях и в разные эпохи**.

### John Carmack — технологический горизонт

Без него id в известной форме почти наверняка не возникает.

Adaptive tile refresh → Keen.

3D experiments → Wolfenstein.

Doom renderer.

Quake architecture.

Doom 3/id Tech 4.

id Tech 5.

Но его суперсила не просто «хорошо программировал».

Он умел:

```
НАЙТИ
ФУНДАМЕНТАЛЬНУЮ
ПРОБЛЕМУ
↓
ОТБРОСИТЬ
ЛИШНЕЕ
↓
НАЙТИ
ПРАКТИЧЕСКИЙ
КОМПРОМИСС
↓
SHIP CODE
```

Он — главный technical founder.

Но renderer сам по себе не Doom.

### John Romero — превращение technology в game

Romero был не «просто level designer».

Он одновременно:

- programmer;

- tools programmer;

- designer;

- level designer;

- playtester;

- public face;

- creative catalyst.

Он писал TEd/TED5, DoomEd, QuakeEd и другие production tools.

То есть даже уровни, которые строил не Romero, частично зависели от его ability сделать rapid iteration возможной.

Его труднее мифологизировать алгоритмом, потому что вклад часто выглядит так:

```
ПЕРЕДВИНУЛ
MONSTER
НА 64 UNITS
↓
КАРТА
СТАЛА
ЛУЧШЕ
```

Но из тысяч таких решений и состоит game feel.

Если Carmack отвечает:

```
ЧТО
МОЖНО?
```

Romero:

```
ЧТО
С ЭТИМ
ПРИКОЛЬНО
ДЕЛАТЬ?
```

И ранняя id настолько сильна именно из-за этой пары.

### Tom Hall — world / game imagination

Очень легко свести его к:

```
написал
Doom Bible
↓
его идеи
выкинули
```

Но он создаёт большую часть Commander Keen identity, characters/world, ранние design concepts, работает над Catacomb lineage.

Он приносит в id вопросы:

```
КТО
ГЕРОЙ?
ГДЕ
ОН?
ПОЧЕМУ
МИР
ТАКОЙ?
ЧТО
МОЖНО
С НИМ
ДЕЛАТЬ?
```

Его конфликт с более system/gameplay-first Carmack/Romero важен ещё и потому, что через него Doom определяет, чем она **не хочет быть**.

### Adrian Carmack — visual soul

Без него можно получить прекрасно работающую Doom, которая не выглядит как Doom.

Он приносит:

- flesh;

- gore;

- bone;

- satanic imagery;

- grotesque body horror;

- heavy-metal-cover energy.

Программист создаёт возможность нарисовать sprite.

Artist создаёт Cyberdemon, который помнят 30 лет.

Adrian ещё и долго остаётся крупным owner, то есть влияет не только art, но и corporate strategy.

### Kevin Cloud — человек-мост

Приходит в 1992 как artist.

Работает через Wolfenstein, Doom, Quake и дальше.

Потом art lead/owner/producer.

Его историческая функция особенно важна как continuity:

```
EARLY id
↓
MATURE id
↓
MODERN id
```

Он не всегда получает headline «изобрёл X», но именно такие люди делают организацию живучей.

### Jay Wilbur — business shield ранней id

Не programmer и не artist.

И поэтому pop-history часто его съедает.

Но кто-то должен вести publishers, distribution, operations, contracts, business.

```
DEVELOPERS
↓
WILBUR
↓
EXTERNAL WORLD
```

Если Carmack/ Romero не тратят половину дня на business bullshit, это не значит, что bullshit не существует. Значит, рядом есть человек, который его забрал.

### Bobby Prince — audio/game feel

Shotgun feel — это не только damage table.

```
INPUT
+
ANIMATION
+
RECOIL
+
ENEMY REACTION
+
SOUND
```

Убери iconic sound — оружие уже слабее.

Музыка тоже связывает Doom с metal/violent energy.

### Dave Taylor — shipping glue

Сам Taylor иронично называл себя spackle coder.

Automap, status bar, sound integration, transitions, cheat codes, network chat, ports и куча glue.

Great renderer без этого не превращается в shipping game.

### Sandy Petersen — production speed и design variety

После Hall нужен огромный объём maps.

Petersen умеет строить очень быстро и приносит другую design voice: более странную, злую, асимметричную.

Он делает огромную долю Doom/Doom II content и позже влияет на Quake weirdness.

### American McGee — доказательство передачи craft

Он не founder.

Он приходит в уже легендарную id и становится Doom II/Quake designer.

Это важно организационно:

```
ID DESIGN DNA
МОЖНО
ПЕРЕДАТЬ
НЕ-FOUNDER'У
```

Без этого studio умирает вместе с первой командой.

### Michael Abrash — усиливает Quake engineering до технической команды

Carmack в молодости читает Abrash.

Потом нанимает его.

Abrash приносит high-end low-level optimization, graphics knowledge и культуру технического объяснения.

Он ещё один proof:

```
QUAKE
ENGINEERING
УЖЕ
НЕ
ONE-MAN SHOW
```

### John Cash — networking

Quake исторически велика не только full 3D, но и networked world.

Cash нанимают именно за networking expertise.

Client/server, Internet play, QuakeWorld lineage — это часть социальной революции Quake, и его вклад в эту сторону часто вспоминают намного меньше Carmack.

### Paul Steed — переход к 3D content production

Doom sprites → Quake polygonal characters.

Новая technology требует нового типа artist/animator.

Steed — часть этого перехода.

### Todd Hollenshead — business longevity mature id

После Quake компания должна пережить founders.

Hollenshead строит professional business structure: finance, publishers, licensing, corporate negotiation.

Один из крупнейших его strategic acts — ZeniMax sale.

Он помогает построить структуру, которая затем позволяет id пережить RAGE/Doom4/Carmack departure.

### Tim Willits — continuity

Quake-era designer → Doom 3 lead/design → co-owner → RAGE creative → studio director.

Главное — мост через несколько поколений.

Не «новый Carmack», а institutional memory.

### Robert Duffy — engineering continuity

После Carmack technology не начинается с нуля, потому что внутри уже есть многолетние veterans.

Duffy — один из ключевых примеров.

### Marty Stratton — post-Carmack organizational resurrection

Его вклад не «лично придумал Glory Kill».

Его функция:

```
СОБРАТЬ
ОГРОМНУЮ
TEAM
ВОКРУГ
ПРАВИЛЬНОГО
ВОПРОСА
```

После Doom 4:

```
ЧТО
ТАКОЕ
DOOM?
```

Stratton-era hierarchy:

```
GAME
ЦЕНТР

TECH
SERVES
GAME
```

Это огромный managerial shift.

### Hugo Martin — modern Doom creative voice

Он приносит cinematic/visual literacy, но подчиняет её player action.

2016 → Eternal → Dark Ages показывают, что он не хранитель brand bible, а человек, который постоянно пытается переопределять Doom без уничтожения её identity.

### Tiago Sousa и modern engine team

Sousa приходит из Crytek и доказывает: elite engineering id можно усиливать людьми извне без потери identity.

Но главное — он не «новый Carmack».

Современный idTech строят Duffy, Sousa, Khan, Gneiting, Geffroy и множество других engineers.

Это уже:

```
SPECIALIZED
HIGH-END
ENGINEERING TEAM
```

а не один technical monarch.

### Если спросить «кто самый важный?»

Самый фундаментальный technical founder — Carmack.

Самый фундаментальный game/tools человек original id — Romero.

Главный early world/concept voice — Hall.

Главный classic visual DNA — Adrian.

Главный continuity-человек между founders и mature id — Cloud.

Главный business builder mature independent id — Hollenshead, с Wilbur как ранним функциональным предшественником.

Главный transition bridge Quake-era → modern id — Willits.

Главный лидер post-Carmack resurrection — Stratton.

Главный modern Doom creative voice — Martin.

А главное engineering achievement post-Carmack era принадлежит уже **не одному человеку**.

### Самая точная формулировка

```
CARMACK
СОЗДАЛ
ТЕХНОЛОГИЧЕСКИЙ
ПОЗВОНОЧНИК id
```

```
ROMERO
СОЗДАЛ
ЗНАЧИТЕЛЬНУЮ
ЧАСТЬ
ЕЁ ИГРОВОЙ
НЕРВНОЙ СИСТЕМЫ
```

```
ОСТАЛЬНЫЕ
ДАЛИ
ТЕЛО
ЛИЦО
ГОЛОС
БИЗНЕС
И СПОСОБНОСТЬ
ПЕРЕЖИТЬ
СОЗДАТЕЛЕЙ
```

И именно последний пункт в итоге оказался самым удивительным.

[↑ К содержанию](#contents)

---
## 72. Что id Software исторически делала лучше всех — и где систематически была слабой { #p072 }

После всей истории компании можно поставить диагноз самой id.

Не «была ли id великой?» — очевидно была.

Интереснее:

### почему она раз за разом была великой в одних вещах и раз за разом вляпывалась в очень похожие проблемы в других?

Потому что сменились founders, managers, owners, team size, technology и business model, а некоторые patterns удивительно стабильны.

Самая грубая формулировка:

### id исторически великолепна, когда ей нужно сделать несколько фундаментальных действий игрока невероятно хорошо.

И заметно менее естественна для задач вроде «огромный мир, десятки систем, много narrative layers и production coordination на годы».

### Сильная сторона №1 — game feel

Это, возможно, самое устойчивое преимущество id.

Не просто graphics.

Не gore.

Не Doom как IP.

А:

```
КАК
GAME
ОЩУЩАЕТСЯ
ПОД РУКАМИ
```

Хороший shotgun — это не damage number.

Это:

```
INPUT LATENCY
+
MUZZLE FLASH
+
SOUND
+
RECOIL
+
ANIMATION
+
ENEMY REACTION
+
DAMAGE
+
RANGE
+
RECOVERY TIME
```

Каждый компонент может быть нормальным, а вместе — хуйня.

Или наоборот — всё складывается в физическое удовольствие.

id десятилетиями особенно хорошо умеет второй вариант.

### Отсюда performance для id — часть design

60 FPS historically означает не красивую цифру benchmark, а:

```
INPUT
↓
MOTION
↓
FEEDBACK
↓
CONTROL
```

Поэтому modern post-Carmack id так же болезненно держится за high framerate, как старая Carmack-id.

### Сильная сторона №2 — technology, которая открывает новое поведение

Лучшие breakthroughs id важны не только количеством polygons.

Keen scrolling → новый тип PC action.

Wolfenstein renderer → быстрый first-person action.

Doom architecture/networking → более сложное space + deathmatch.

Quake full 3D/client-server → vertical movement, online worlds, modding.

То есть technology создаёт **new verbs**, а не только screenshots.

### Сильная сторона №3 — радикальная концентрация на core

Когда id в лучшей форме, она задаёт:

```
ЧТО
ЗДЕСЬ
САМОЕ
ИНТЕРЕСНОЕ?
```

и выкидывает остальное.

Wolfenstein убирает лишнюю simulation/stealth complexity.

Quake III почти выбрасывает campaign и оставляет movement, weapons, maps, item control.

Doom 2016 снова делает тот же mental move после RAGE/Doom4 crisis.

Важно: simple у id не равно shallow.

```
МАЛО
ФУНДАМЕНТАЛЬНЫХ
ПРАВИЛ
```

может дать огромный decision space.

### Сильная сторона №4 — высокая плотность решений

Лучшие id-games постоянно делают:

```
INPUT
↓
REACTION
↓
DECISION
↓
NEW STATE
```

Doom:

- кого убить;

- куда двигаться;

- какое оружие;

- брать ли health;

- можно ли проскочить между projectiles.

Quake III:

- где opponent;

- когда item respawn;

- какой route;

- какое оружие;

- где перехватить.

Eternal доводит это почти до overload.

### Сильная сторона №5 — mastery живёт в игроке

Не только:

```
+25% DAMAGE
потому что
LEVEL 37
```

А:

```
Я
НАУЧИЛСЯ
ЛУЧШЕ
ДВИГАТЬСЯ
ЦЕЛИТЬСЯ
ЧИТАТЬ SPACE
ВЫБИРАТЬ TOOLS
```

Quake III — pure form.

Eternal — single-player version той же ценности.

### Сильная сторона №6 — tools и rapid iteration

Старая id — огромная петля:

```
IDEA
↓
IMPLEMENT
↓
PLAY
↓
THIS SUCKS
↓
CHANGE
↓
PLAY
```

Romero tools исторически важны именно потому, что сокращали расстояние между idea и playable result.

Modern Willits-era management пытается масштабировать тот же принцип через feature ownership и fast playable prototypes.

### Сильная сторона №7 — сильные specialists с autonomy

Carmack → tech.

Romero → gameplay/tools.

Adrian → art.

Petersen → levels.

Abrash → optimization.

Cash → networking.

Модель:

```
ВОТ
ТВОЯ
ТЕРРИТОРИЯ
↓
СДЕЛАЙ
ОХУЕННО
```

Даёт очень сильный характер продукта.

### Сильная сторона №8 — готовность выбрасывать работу

Quake меняет direction.

Darkness превращается в RAGE.

Старый Doom 4 отправляется в мусор.

Modern Doom потом тоже ломает собственные successful formulas.

Sunk cost для id исторически не всегда священен.

Это дорого, но творчески очень ценно.

### Сильная сторона №9 — id создаёт новый язык, а не только игры

Doom → deathmatch, WAD culture, shareware explosion.

Quake → client/server, clans, QuakeC, CTF culture, machinima, competitive FPS lineage.

То есть великие id games часто являются platforms for behaviour.

### Сильная сторона №10 — community не только consumer

Player → modder → level designer → professional developer.

Willits и Zoid — прямые примеры.

Community historically работает как audience, R&D, content factory и hiring pool.

### Сильная сторона №11 — техническая смелость

True 3D, Internet play, dynamic lighting, virtual texturing, Vulkan, RTGI, path tracing.

Причём важный id-standard:

```
НЕ
TECH DEMO
↓
SHIP IT
```

### Теперь слабые стороны

Почти каждая слабость — shadow side сильной стороны.

### Слабость №1 — management at scale исторически не natural competence

Flat structure прекрасно работает при 6–10 людях.

При 50–100:

```
КТО
ПРИНИМАЕТ
РЕШЕНИЕ?

КТО
ВЛАДЕЕТ
SCHEDULE?

КТО
СИНХРОНИЗИРУЕТ
DEPARTMENTS?
```

Quake — первый огромный crash этой модели.

### Слабость №2 — production planning / When It's Done

Романтика:

```
НЕ SHIP
ГОВНО
РАДИ DEADLINE
```

Обратная сторона:

```
ГОДЫ
БЕЗ
DISCIPLINE
```

Carmack позднее сам признавал всё растущие интервалы между релизами одной из ошибок trajectory id.

Время — не бесплатный ресурс: salary, opportunity cost, changing market, staff turnover, tech debt.

### Слабость №3 — technology-first может стать ловушкой

Пока frontier автоматически создаёт new gameplay — отлично.

Позже:

```
NEW RENDERER
≠
NEW GREAT GAME
```

RAGE — главный пример.

### Слабость №4 — R&D может стать самоцелью

Carmack для себя может прожить год внутри difficult technical problem и быть счастлив.

Game studio получает деньги за games.

Quake engine rewrites, Doom 3 rendering obsession, RAGE virtual texturing показывают tension:

```
RESEARCH LAB
+
GAME STUDIO
```

### Слабость №5 — большие narrative/systemic worlds менее natural, чем action

id элитна в вопросе:

```
КАК
ДОЛЖЕН
ОЩУЩАТЬСЯ
SHOTGUN?
```

Менее естественный home field:

```
50 NPC
10 factions
quests
economy
world state
dialogue
open-world simulation
```

RAGE демонстрирует это особенно хорошо.

### Слабость №6 — story часто вторична к mechanics

Это плюс для Doom.

Но если проект сам выбирает narrative-heavy form, появляется conflict.

Old Doom 4 уходит слишком далеко в story/world spectacle и теряет player fantasy.

Modern Doom находит баланс:

```
STORY
ЕСТЬ
↓
PLAYER ACTION
ПЕРВИЧНА
```

### Слабость №7 — слишком сильная зависимость от конкретных людей

Ранняя id:

```
Carmack
= tech roadmap

Romero
= gameplay/tools

Adrian
= art

Wilbur
= business
```

Эффективность огромная.

Bus factor — ужасный.

Каждый departure меняет компанию.

Post-Carmack id велика именно потому, что наконец решает эту проблему через distributed leadership.

### Слабость №8 — middleware support

id умеет сделать великий engine.

Исторически хуже умеет сделать так, чтобы чужая studio без боли на нём ship'нула game.

Engineering excellence ≠ middleware excellence.

### Слабость №9 — набор локально отличных systems может не стать цельной game

RAGE:

```
SHOOTING good
CARS good
ART good
ANIMATION good
```

Но:

```
WHY
IS THIS
ONE GAME?
```

Old Doom 4 — аналогично: departments работают, а central identity нет.

### Слабость №10 — иногда id путала «новое» с «больше»

Старая id innovates через:

```
NEW RULE
```

AAA-era иногда через:

```
MORE WORLD
MORE SYSTEMS
MORE STORY
MORE CONTENT
```

RAGE снова отличный пример.

Doom 2016 исправляет это фокусом.

### Слабость №11 — identity crisis, когда id слишком долго смотрит на рынок

Великая id:

```
РЫНОК:
ВОТ ЧТО МЫ ДЕЛАЕМ
↓
id:
ПОХУЙ
ВОТ НАША ШТУКА
```

Кризисная id:

```
РЫНОК:
ВОТ ЧТО УСПЕШНО
↓
id:
А МОЖЕТ
НАМ ТОЖЕ?
```

Old Doom 4 — чистейший пример.

### Слабость №12 — одна studio не может обслуживать столько IP

Doom, Quake, Wolfenstein, RAGE, engine.

Исторически id слишком долго пыталась быть bottleneck.

ZeniMax ecosystem решает через MachineGames, Nightdive, Avalanche и других partners.

### Слабость №13 — стабильность скучна, но необходима

id любит:

```
NEW
FASTER
DIFFERENT
REWRITE
```

Production любит:

```
STABLE
DOCUMENTED
PREDICTABLE
```

Этот конфликт виден и в middleware-history, и в internal production.

### Слабость №14 — heroic crunch как замена процессу

Старая culture часто предполагала:

```
В КОНЦЕ
СИЛЬНЫЕ ЛЮДИ
ВЫТАЩАТ
```

Иногда вытаскивали.

Но аварийный режим — не production system.

### Почти каждый минус — гипертрофированный плюс

```
SMALL AUTONOMOUS TEAM
+
→ скорость / ownership
-
→ плохо масштабируется
```

```
STRONG PERSONALITIES
+
→ авторские решения
-
→ conflict / bus factor
```

```
TECH-FIRST
+
→ индустриальные breakthroughs
-
→ game может стать приложением к tech demo
```

```
WHEN IT'S DONE
+
→ quality protection
-
→ schedule discipline collapses
```

```
GAMEPLAY FIRST
+
→ плотность / feel
-
→ world/story layers могут быть слабее
```

### Самая точная профессиональная формулировка

### id — exceptional specialist studio, которая иногда ошибочно пыталась вести себя как универсальная AAA-компания.

Когда:

```
ВОТ
НАША
СИЛЬНАЯ
ИДЕЯ
↓
ДОВЕДЁМ
ДО АБСОЛЮТА
```

получается Doom.

Когда:

```
МЫ
ДОЛЖНЫ
УМЕТЬ
ВСЁ
```

начинаются RAGE/Doom4-type проблемы.

### Modern id сильнее старой не потому, что потеряла старые черты

Она научилась управлять их обратной стороной:

- strong people + distributed leadership;

- own engine + game-first hierarchy;

- iteration + production structure;

- strong core + Bethesda/Microsoft infrastructure;

- external specialists вместо необходимости самой быть лучшей во всём.

И это, пожалуй, главный признак зрелости компании.

[↑ К содержанию](#contents)

---
## 73. Мифы об id Software { #p073 }

id настолько мифологизирована, что историю легко превратить в набор красивых, но кривых формул.

### Миф 1. «John Carmack сделал Doom»

Вердикт: сильное искажение.

Правильнее:

```
БЕЗ CARMACK
DOOM
ПОЧТИ НАВЕРНЯКА
НЕ БЫЛО БЫ
```

Но это не равно:

```
CARMACK
СДЕЛАЛ
DOOM
```

Carmack — engine/architecture/performance.

Romero — tools/game-facing code/design/levels/feel.

Adrian/Cloud — visual identity/art production.

Petersen — огромное количество maps.

Prince — audio/music.

Taylor — glue/ports/systems.

Wilbur — business.

```
CARMACK
СДЕЛАЛ
DOOM
ТЕХНИЧЕСКИ
ВОЗМОЖНОЙ

КОМАНДА
СДЕЛАЛА
DOOM
DOOM'ОМ
```

### Миф 2. «Romero после Doom ничего не делал»

Ложь, выросшая из реального конфликта.

Carmack действительно был зол на work style Romero в Quake-era.

Но даже Carmack позднее признавал: Romero реально работал, делал отличные levels, занимался external teams и оставил огромный отпечаток на Doom/Quake.

Правильная проблема:

```
ROMERO
И
CARMACK
ПЕРЕСТАЛИ
СОВПАДАТЬ
ПО
VISION
WORK STYLE
AUTHORITY
```

Не «один стал бесполезным».

### Миф 3. «id изобрела FPS»

Буквально неправда.

First-person shooting/network combat существовал задолго до id — Maze War, Spasim и другие ранние experiments.

Но id сделала нечто почти важнее:

### сформировала массовую грамматику action FPS.

Wolfenstein/Doom показали рынку:

```
ВОТ
КАК
ЭТО
ДОЛЖНО
ИГРАТЬСЯ
```

### Миф 4. «Doom изобрела multiplayer FPS и deathmatch»

Networked first-person combat существовал раньше.

Но Doom превратила deathmatch в массовую PC-culture и сам термин закрепила в языке жанра.

```
НЕ ПЕРВАЯ
СЕТЕВАЯ
СТРЕЛЬБА

НО
МАССОВЫЙ
CULTURAL BREAKTHROUGH
```

### Миф 5. «Doom была первой true 3D FPS»

Нет.

Doom world representation имеет ограничения и не является general polygonal 3D world Quake-type.

Но реакционный тезис «Doom вообще не 3D» тоже бессмысленный: для player это полноценное spatial first-person experience.

Quake — более правильная граница `true polygonal 3D` для самой id.

### Миф 6. «Quake с самого начала была задумана именно такой»

Совсем нет.

Original Quake vision имела fantasy/RPG/melee elements, персонажа Quake, hammer/Hellgate Cube lineage и множество идей, которые не пережили production.

Финальная Quake стала shooter значительно ближе к Doom grammar после design chaos и pivot.

То есть masterpiece может быть результатом:

```
ХАОС
+
ОТМЕНЁННЫЕ ИДЕИ
+
TECH BREAKTHROUGH
+
КОМПРОМИСС
```

а не идеального master plan.

### Миф 7. «Carmack один спас Quake от ленивого Romero»

Удобная версия победителя конфликта.

Carmack действительно требовал discipline/ship.

Romero действительно хотел более амбициозный leap и работал не так, как Carmack ожидал от design lead.

Но collapse ранней Quake — collective production problem:

```
ENGINE
МЕНЯЕТСЯ
↓
CONTENT
УСТАРЕВАЕТ
↓
VISION
ПЛЫВЁТ
↓
TEAM
ВЫГОРЕЛА
↓
FLAT STRUCTURE
НЕ РАЗРЕШАЕТ
CONFLICT
```

### Миф 8. «id всегда была компанией Carmack»

Для post-Romero эпохи — очень Carmack-centric.

Для всей истории — нет.

1991 id — founder collective: Carmack, Romero, Hall, Adrian плюс business/operations вокруг них.

Ownership и authority тоже распределены.

А после 2013 id вообще продолжает существовать без Carmack.

### Миф 9. «id Tech всегда была лучшим commercial engine, Epic просто лучше продавала»

Слово «лучший» без задачи бессмысленно.

idTech была очень успешной technology.

Но middleware — это не только renderer/source.

Epic лучше построила:

- support;

- docs;

- tools;

- integrations;

- licensee relationships;

- stable workflows;

- ecosystem.

И с 2010 id вообще выходит из external middleware race.

### Миф 10. «id всегда была маленькой flat studio, пока корпорации всё не испортили»

Flat structure дала ранней id скорость и autonomy.

Она же сделала Quake production чрезвычайно болезненным.

При 6 людях:

```
СПРОСИ
ЧЕРЕЗ КОМНАТУ
```

При 100:

```
КТО
ВЛАДЕЕТ
SCHEDULE?
КТО
ПРИНИМАЕТ
FINAL DECISION?
```

Professional management возник не только как corporate evil, а потому что старая модель не масштабировалась.

### Миф 11. «ZeniMax купила id — настоящая id закончилась»

Корпоративно:

```
НЕЗАВИСИМАЯ id
ЗАКОНЧИЛАСЬ
```

Творчески — слишком просто.

После acquisition появляются Doom 2016/Eternal — игры, которые очень хорошо продолжают performance/control/core-system DNA компании.

То есть ZeniMax убила sovereignty, но не автоматически culture.

### Миф 12. «Современная id — та же команда Doom 1993»

Нет.

Hall, Romero, Adrian, Carmack давно ушли. Modern leadership — другие люди и другие departments.

Но существует цепочка передачи culture.

```
НЕ
ОДНА TEAM

А
ЦЕПОЧКА
ПЕРЕДАЧИ
```

### Миф 13. «Doom 2016 — просто возврат к Doom 1993»

Нет.

Это translation design values на modern language.

Glory Kills, weapon mods, vertical arenas, progression, modern AI — всего этого не было в 1993.

Но emotional function — speed, power, aggression, projectile avoidance, weapon/enemy identity — восстанавливается.

### Миф 14. «Doom 2016 доказала, что old-school FPS просто были лучше»

Сама Doom 2016 — очень современная AAA game:

- upgrades;

- mods;

- checkpoints;

- cinematic animation;

- controller design;

- online systems;

- UGC tool;

- modern art pipeline.

Это не 1993 победил 2016.

Это 2016 грамотно перевёл часть принципов 1993.

### Миф 15. «Carmack ушёл — технологическая id закончилась»

История уже опровергла.

id Tech 6, 7, 8, Vulkan, RTGI, path tracing.

Но часть персональных Carmack-values действительно не пережила его — например systematic eventual open-source release.

### Миф 16. «id всегда была впереди всей индустрии»

Нет.

В 1990-е технологически часто да.

Позже narrative FPS, immersive sim, open-world, middleware, console shooter design развиваются сильнее у других компаний.

RAGE/Doom4 era особенно показывает, что id сама начинает смотреть на рынок.

Doom 2016 выигрывает, когда перестаёт пытаться быть центром **всего** жанра и становится лучшей в своём конкретном языке.

### Миф 17. «Гении без менеджмента и сделали id великой»

Талант не решает автоматически:

```
КТО
ПРИНИМАЕТ
РЕШЕНИЕ?
КТО
ОТВЕЧАЕТ
ЗА SCHEDULE?
КАК
РАЗРЕШИТЬ
CONFLICT?
```

Quake — доказательство.

### Миф 18. «Quake — творческий провал, потому что стала Doom в 3D»

Original design vision действительно не реализовалась полностью.

Но final game создаёт новый spatial/network/modding/competitive язык.

```
НЕ СТАЛА
ТОЙ ИГРОЙ,
КОТОРУЮ
ПЛАНИРОВАЛИ

≠

ПРОВАЛИЛАСЬ
```

### Миф 19. «Doom стала phenomenon просто потому, что Carmack был впереди технологически»

Если бы technology автоматически создавала phenomenon, RAGE повторила бы Doom-level cultural impact.

Doom — multiplicative system:

```
TECH
×
GAMEPLAY
×
ART
×
AUDIO
×
SHAREWARE
×
MODDING
×
DEATHMATCH
×
HISTORICAL MOMENT
```

### Миф 20. «Существует одна настоящая id Software»

Какая?

Softdisk/Keen?

Doom founders?

Quake conflict-era?

Carmack post-Romero company?

Doom 3 id?

RAGE/ZeniMax?

Doom 2016?

Microsoft-era?

Мы уже увидели несколько почти разных компаний.

Поэтому фраза:

```
НАСТОЯЩАЯ id
УМЕРЛА
В XXXX
```

имеет смысл только после уточнения — какую именно id ты считаешь настоящей.

Founder-id умерла давно.

Independent-id — в 2009.

Carmack-id — в 2013.

Но development culture, основанная на feel, performance, control, own tech и strong core, пока полностью не исчезла.

[↑ К содержанию](#contents)

---
## 74. Главная историческая дуга id Software { #p074 }

Теперь можно собрать всю историю не как список игр, а как одну причинную цепь.

Самое странное в id — не то, что она сделала Doom или Quake.

Самое странное:

### как эта компания вообще до сих пор существует?

Почти всё, что определяло её рождение, исчезло:

```
FOUNDERS
→ почти все ушли

OWNERS
→ сменились

INDEPENDENCE
→ исчезла

SHAREWARE
→ исчез

PC-ONLY CULTURE
→ исчезла

EXTERNAL ENGINE LICENSING
→ исчезло

CARMACK
→ ушёл

ROMERO
→ ушёл

HOLLENSHEAD
→ ушёл

WILLITS
→ ушёл

TECH-FIRST MODEL
→ закончилась
```

1991 и 2026 буквально похожи на две разные организации.

И всё же modern Doom всё ещё часто ощущается как id.

### Начало — не миссия изменить индустрию

Softdisk team просто хочет:

```
САМИ
КОНТРОЛИРОВАТЬ
ТО,
ЧТО
ДЕЛАЕМ
```

Это первый ген id — creative/technical autonomy.

### Carmack даёт независимости technical leverage

Smooth scrolling на PC → Commander Keen.

И возникает identity:

```
МЫ
МОЖЕМ
ЗАСТАВИТЬ
КОМПЬЮТЕР
ДЕЛАТЬ
ТО,
ЧТО
ОН
ВРОДЕ БЫ
НЕ ДОЛЖЕН
```

### Shareware делает independence economically real

```
СДЕЛАЛИ
↓
ДАЛИ
ПОПРОБОВАТЬ
↓
ПОНРАВИЛОСЬ
↓
PLAYER
ПЛАТИТ
```

Компания получает belief:

```
GOOD PRODUCT
>
GATEKEEPER
```

### Wolfenstein формулирует density principle

Лишние mechanics, которые тормозят action, выкидываются.

```
GAME
НЕ ОБЯЗАНА
МОДЕЛИРОВАТЬ
МИР

ОНА
ДОЛЖНА
СОЗДАВАТЬ
ИНТЕРЕСНОЕ
ПОВЕДЕНИЕ
```

### Doom — идеальное совпадение всех частей

Technology, tools, art, levels, audio, business, distribution, modding, multiplayer — всё тянет в одну сторону.

И поэтому Doom создаёт не только campaign, а ecosystem:

```
shareware
→ viral distribution

WAD
→ modding

LAN
→ deathmatch

community
→ future developers
```

### Успех Doom ломает маленькую id

Следующий project уже обязан быть «следующей революцией».

И тут Quake соединяет одновременно слишком много риска:

```
TECH REVOLUTION
+
DESIGN REVOLUTION
+
FLAT MANAGEMENT
```

Engine меняется, content устаревает, vision плавает, team выгорает.

Quake всё равно великая — и именно поэтому organization может неправильно решить, что process тоже был нормальный.

### Уход Romero — первая культурная смерть id

Баланс:

```
CARMACK
↔
ROMERO
```

ломается.

Компания постепенно превращается в technology-centered studio.

### Quake II / Quake III показывают преимущества Carmack-company

Больше production discipline.

Quake III особенно идеально совпадает с strengths:

```
TECHNICAL PRECISION
+
MECHANICAL PRECISION
+
MINIMUM NARRATIVE OVERHEAD
```

### Engine licensing создаёт вторую identity

id становится не только game studio, но technology supplier для огромной части FPS-индустрии.

Возникает иллюзия:

```
МОЖЕТ
ENGINE
И ЕСТЬ
НАШ
ГЛАВНЫЙ
PRODUCT?
```

### Doom 3 — вершина technology-first model

Renderer thesis буквально рождает horror thesis.

Но теперь уже видно:

```
GRAPHICS
REVOLUTION
≠
AUTOMATIC
GAME DESIGN
REVOLUTION
```

### AAA ломает old assumptions

Старая model:

```
SMALL TEAM
+
NEW ENGINE
+
ONE GAME
```

AAA требует:

```
100+ PEOPLE
MULTIPLATFORM
ART PIPELINE
ANIMATION
TOOLS
OUTSOURCING
MULTI-YEAR PRODUCTION
```

Это уже другая профессия.

### RAGE — попытка натянуть old Carmack model на new AAA reality

Technology рождает concept, concept расползается на vehicles/hubs/crafting/open-world ambitions.

Лучшее всё равно shooting.

Именно здесь старая formula начинает реально проигрывать.

### ZeniMax — конец независимой id

2009.

Суверенитет исчезает.

Но появляются capital, publisher infrastructure, sister studios и возможность пережить дорогие ошибки.

### Old Doom 4 — низшая точка самоопределения

id, которая когда-то заставляла рынок копировать себя, теперь смотрит на рынок и спрашивает:

```
КАК
ДОЛЖЕН
ВЫГЛЯДЕТЬ
СОВРЕМЕННЫЙ
BLOCKBUSTER FPS?
```

Ответ получается качественным production, но без Doom soul.

### Спасительный акт — признать ошибку

Несколько лет work отправляются в мусор.

Это дорогой, но фундаментальный принцип:

```
IDENTITY
>
SUNK COST
```

### 2013 — старая power structure исчезает

Hollenshead OUT.

Carmack OUT.

По всем законам история должна закончиться.

Если id \= её создатели, всё.

Но к этому моменту часть culture уже распределена между людьми, tools, processes, code и expectations.

### Doom reboot превращает implicit culture в explicit principles

Founders могли просто чувствовать Doom.

Новая team обязана ответить:

```
WHAT IS DOOM?
```

И формулирует:

```
GUNS
DEMONS
MOVEMENT
AGGRESSION
PLAYER POWER
```

Это момент, когда culture перестаёт быть только личной интуицией founders.

### Doom 2016 доказывает невозможное

Без Carmack/Romero/Hall/Adrian studio делает game, которая ощущается не corporate imitation, а настоящим Doom comeback.

Значит логотип не пустой.

### id Tech 6 делает второй proof

Engineering standard тоже survives.

Performance, low latency, own technology продолжаются без Carmack.

### Eternal делает третий proof

Новая id способна не только восстановить old values, но **сама создать дальнейшую evolution**.

Это уже не cargo cult.

### Willits уходит — studio почти не шатается

Чем меньше departure одного человека способен уничтожить company, тем больше company стала institution.

### Microsoft acquisition — ещё один слой ownership

Но id уже достаточно зрелая, чтобы owner не становился главным creative автором.

Doom остаётся distinct внутри огромного shooter portfolio.

### Dark Ages снова ломает successful formula

И это очень id-like.

Не Eternal 2.

Shield, parry, ground combat, iron-tank fantasy.

А Revelations ещё через год корректирует Dark Ages mobility.

То есть slogan тоже не sacred.

### Почему id выжила

#### 1\. Сильный technical capital

Code/tools/architecture/performance practices переживают отдельных людей.

#### 2\. Founders успели вырастить не-founders

Cloud, McGee, Willits, Duffy, Stratton и новые поколения.

Craft можно передавать.

#### 3\. Community хранит внешнюю память

Doom/Quake communities десятилетиями сохраняют design language, movement culture, maps, source ports, mods.

#### 4\. IP становятся культурными constraints

Doom уже диктует ожидания: shotgun, demons, aggression, player power.

Новый developer приходит не в пустоту.

#### 5\. Компания не пытается буквально заморозить старую форму

После Romero не ищут Romero 2.

После Carmack — Carmack 2.

После shareware — не пытаются навечно жить shareware.

Identity сохраняется через adaptation, а не мумификацию.

#### 6\. ZeniMax дала время пережить ошибки

RAGE + Doom4 write-offs могли быть очень опасны для независимой studio.

Parent capital делает creative reset финансово возможным.

#### 7\. Modern leadership правильно диагностирует прошлое

Не pixel art/keycards как surface.

А deeper functions: speed, power, enemy/weapon identity, forward momentum.

#### 8\. Engineering culture действительно институционализировалась

Sousa приходит извне, но не превращает id в Crytek. Он становится частью idTech culture.

#### 9\. id учится признавать чужую expertise

Wolfenstein → MachineGames.

Open-world RAGE 2 → Avalanche.

Preservation → Nightdive.

#### 10\. Сохраняется внутренний quality checksum

```
IS IT FAST?
DOES IT FEEL GOOD?
IS THE PLAYER IN CONTROL?
IS THE CORE ACTUALLY FUN?
DOES THIS FEATURE HELP THE CORE?
CAN A GREAT PLAYER GET BETTER?
IS THE GAME CLEAR ABOUT WHAT IT IS?
```

### Главный парадокс

Первая id стала великой, потому что была маленькой.

Чтобы выжить — пришлось перестать быть маленькой.

Стала великой благодаря founders ownership.

Чтобы финансировать AAA — пришлось продаться.

Стала великой благодаря Carmack.

Чтобы пережить Carmack — пришлось перестать быть компанией Carmack.

Стала великой через technology-first.

Чтобы снова делать великие games — пришлось заставить technology служить gameplay.

Была построена вокруг незаменимых людей.

Чтобы жить 35 лет — пришлось научиться не иметь незаменимых людей.

### Самый точный ответ

id не осталась той же компанией.

Она **стала другой компанией, не перестав быть узнаваемой id**.

Сохранилась не форма, а constraints:

```
PLAYER CONTROL
ДОЛЖЕН
БЫТЬ
ТОЧНЫМ

CORE LOOP
ДОЛЖЕН
БЫТЬ
СИЛЬНЫМ

PERFORMANCE
НЕ РОСКОШЬ

TECH
ДОЛЖНА
ПОМОГАТЬ
GAME

MASTERY
ДОЛЖНА
ВОЗНАГРАЖДАТЬСЯ

BUILD
ИМЕЕТ
ПРАВО
ПОБЕДИТЬ
ТЕОРИЮ
```

Вот почему современная id может быть совершенно другой организацией и всё равно периодически выдавать ощущение:

```
ДА
БЛЯДЬ
ЭТО id
```

[↑ К содержанию](#contents)

---


---

[← X. Перерождение Doom](10-doom-rebirth-modern-id.md) · [Общее оглавление](index.md) · [XII. Боковые ветви →](12-side-branches.md)
