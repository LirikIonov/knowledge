# Valve II — Игры, движки и сервисная модель

## 18. Source как платформа: внутренние ветки Valve, моды и ограниченный рынок лицензирования { #p018 }

Предыдущая техническая глава объясняла переход от GoldSrc к Source: physics, actors, materials, Hammer и entity I/O. Здесь вопрос другой:

> Что происходит, когда движок перестаёт обслуживать одну Half-Life 2 и должен поддерживать множество игр, внутренних teams, моддеров и внешних licensees?

Source стала великой платформой, но не единым идеально упакованным продуктом. Её сила происходила из тесной связи с играми Valve; та же связь ограничила способность конкурировать с Unreal Engine как универсальным commercial middleware.

### Source — семейство, а не одна версия

Название создаёт ложную картину единой codebase, последовательно обновляемой для всех. Реально games shipping-ились на branches, которые расходились, получали специализированные features и не всегда легко объединялись обратно.

Условно можно различать:

- Half-Life 2 launch-era branch;
- Episode/2006 improvements;
- Orange Box generation;
- Left 4 Dead line;
- Portal 2 line;
- Counter-Strike: Global Offensive evolution;
- Dota 2-specific technology до перехода на Source 2.

Каждая игра предъявляла свои требования. Left 4 Dead нужен Director, horde AI и networked co-op; Portal 2 — portals, gels, puzzles и сложная co-op synchronization; Dota 2 — иной camera, unit simulation, UI и live-service workload; CS:GO — конкурентная networking predictability и длительная hardware support.

Если все изменения немедленно вливать в общий trunk, одна game ломает другую. Если branches расходятся, fixes и tools фрагментируются. Source постоянно платит эту цену.

### Что такое engine branch в производственном смысле

Branch — не обязательно полностью отдельный движок. Это линия code и tools, зафиксированная вокруг потребностей product. Team берёт общую основу, добавляет features, исправляет bugs и в определённый момент перестаёт безопасно получать все изменения соседей.

Merge дорог, потому что systems взаимодействуют. Новый renderer меняет materials; новое animation поведение затрагивает networking и save files; physics fix способен изменить competitive movement; filesystem update ломает tools.

```text
общая база уменьшает начальную стоимость
↓
специализация ускоряет конкретную игру
↓
ветки расходятся
↓
стоимость обратного объединения растёт
```

Это нормальная software economics, а не исключительно некомпетентность Valve. Проблема возникает, когда документация и название продолжают обещать единство, которого operationally уже нет.

### Внутренняя платформа Valve

Для Valve shared foundation даёт огромные преимущества:

- programmers переносят знание между teams;
- assets и tools имеют общую логику;
- networking, filesystem, console и editor не строятся заново;
- новая игра начинает с работающего runtime;
- улучшение одного subsystem потенциально помогает нескольким products;
- mod community уже знает базовый workflow.

Orange Box особенно хорошо показывает platform leverage: Half-Life 2: Episode Two, Portal и Team Fortress 2 различаются жанром, art direction и structure, но используют общую technology и shipping infrastructure.

Однако reuse не означает бесплатность. Portal требует изменить rendering и collision assumptions вокруг рекурсивных пространств. TF2 строит свой animation, particles и multiplayer logic. Каждый product превращает общий engine в собственный вариант.

### Source SDK: открыто достаточно для модификации, но не весь engine

Valve выпускала Source SDK с Hammer, model viewer, Faceposer, map compilers, sample content и game code interfaces. Поздний Source SDK 2013 публикует значительный C++ слой client/server gameplay.

Но SDK не равен полному исходному коду Source. Закрыты или ограничены core subsystems; license регулирует использование; коммерческий standalone product требует иных условий.

Моддер получает:

- base game runtime;
- заменяемую gameplay code;
- entities и weapons;
- maps, models и materials pipeline;
- networking interfaces;
- developer console и debugging.

Он не получает автоматического права взять всё, удалить зависимость от Valve и продавать универсальный engine как собственный. Официальная лицензия SDK прямо сохраняет эти границы. ([Source SDK 2013](https://github.com/ValveSoftware/source-sdk-2013), [license](https://github.com/ValveSoftware/source-sdk-2013/blob/master/LICENSE))

### Toolchain — главное преимущество и источник зависимости

Hammer, Faceposer, model compiler, material scripts и map compilers образуют производственную цепочку. Когда она работает, небольшая команда получает tools, на создание которых ушли годы Valve. Когда один элемент ломается, workaround трудно найти вне узкого community knowledge.

Source workflow часто опирается на:

- command-line compilers;
- строгие directory conventions;
- текстовые scripts;
- version-specific utilities;
- undocumented limits;
- wiki и forum knowledge;
- ручную диагностику compile logs.

Для ветерана эта среда быстра и прозрачна: почти всё можно открыть, заменить и проверить. Для нового developer она выглядит архаично рядом с unified editor Unreal или Unity.

Именно поэтому оценки Source расходятся. Один человек видит прямой доступ к понятным primitives; другой — набор исторически сложившихся tools без цельного UX.

### Цена входа выросла относительно GoldSrc

Source была мощнее, но contemporary-looking total conversion требовала больше disciplines:

- high-detail models;
- normal maps и сложные materials;
- physics setup;
- facial/animation pipeline;
- более дорогие environments;
- soundscapes;
- network testing;
- larger downloads.

Bedroom team всё ещё могла экспериментировать с сильной mechanic, но конкурировать presentation с Half-Life 2 становилось сложнее. Engine democratizes technology и одновременно повышает expectation.

### Garry's Mod: engine превращается в игрушку

Garry Newman использовал Source physics, spawning и scripting не для традиционной campaign, а как sandbox. Пользователь создаёт scenes, contraptions, poses и game modes из доступных systems.

Garry's Mod демонстрирует фундаментальную платформенную ценность Source: части, созданные для authored Half-Life 2, становятся общим construction kit.

```text
Valve создаёт physics props и tools
↓
мод снимает ограничения campaign
↓
community строит собственные modes
↓
мод становится самостоятельным коммерческим продуктом
```

Позднее DarkRP, Trouble in Terrorist Town, Prop Hunt и другие modes превращают GMod почти в platform внутри platform. Valve не проектировала все эти игры, но Source предоставила общий physical и network vocabulary.

### Моды как prototypes будущих самостоятельных игр

Source ecosystem дала разные траектории:

- **Dear Esther** начала как experimental mod и помогла сформировать walking-simulator discourse;
- **The Stanley Parable** использовала знакомый FPS language для метакомментария об agency и narration;
- **Insurgency** выросла из tactical multiplayer mod;
- **No More Room in Hell** развивала co-op survival horror;
- **Black Mesa** превратила fan remake в масштабный standalone product;
- **Dystopia** смешивала cyberpunk combat и cyberspace objectives.

Важна не сумма скачиваний, а genre range. Один FPS engine поддерживает narrative experiment, sandbox, tactical shooter, horror и remake. Это признак настоящей платформы.

Steam позднее сокращает distribution friction: мод или standalone derivative можно обновлять через тот же client, где живут base games. Engine и store начинают усиливать друг друга.

### Vampire: The Masquerade — Bloodlines: сила и опасность раннего лицензирования

Troika использовала Source, пока Valve сама ещё доводила technology для Half-Life 2. Это давало доступ к advanced facial animation, dialogue presentation и first-person interaction — отличное соответствие character-heavy RPG.

Но внешний developer работал с движущейся целью:

- tools и engine менялись;
- documentation отставала;
- technical support зависел от Valve;
- новые improvements не всегда легко попадали в branch Troika;
- team писала workarounds вокруг незавершённых systems;
- contractual release зависел от Half-Life 2.

Bloodlines прекрасно использует лица, first-person dialogue и atmospheric spaces, но стала символом технически проблемного релиза. Нельзя сваливать все bugs на Source: у Troika были scope, production и publisher pressures. Однако незрелый external engine усиливал риск.

Этот случай показывает разницу между внутренней и внешней платформой. Valve programmer может изменить core или найти автора subsystem. Licensee ждёт support, документацию и compatible build.

### Support — отдельный продукт, которого не видно на screenshot

Продать source code недостаточно. Licensee необходимы:

- response на engine bugs;
- guidance по performance;
- обновлённые tools;
- ясные platform requirements;
- migration path;
- sample content;
- предсказуемая feature availability;
- помощь при certification и shipping.

Internal team может подойти к desk автора physics. External studio находится в другом городе, timezone и corporate relationship. Каждый вопрос проходит через support channel и contract.

Epic системно превращала это обслуживание в business. У Valve engine licensing оставалась побочной ветвью относительно собственных games и Steam. Поэтому техническое качество Source не превращалось автоматически в удобство клиента.

### Dark Messiah: physics как чужой дизайнерский язык

Arkane в **Dark Messiah of Might and Magic** использовала enhanced Source для first-person melee, body awareness и физического combat. Игра известна возможностью пнуть врага в spikes, огонь или пропасть, использовать environment и соединять spells с физикой.

Это важный успех licensing: внешняя studio не просто повторила Half-Life 2, а взяла её принцип — мир как оружие — и применила к fantasy immersive action. Официальная Steam-страница прямо называет enhanced Source Engine и подчёркивает physics rendering и first-person melee. ([Dark Messiah on Steam](https://store.steampowered.com/app/2100/Dark_Messiah_of_Might__Magic/))

При этом продукт потребовал значительной adaptation. Чем уникальнее game, тем меньше ценность готового default behavior и выше цена изменения engine.

### The Ship, Zeno Clash и нишевая выразительность

Внешние и независимые Source-games часто были не технологическими blockbusters, а проектами с отчётливой идеей.

- **The Ship** строила social assassination внутри пространства с NPC-like needs.
- **Zeno Clash** использовала first-person foundation для сюрреалистического melee и уникального art world.
- различные Kuma titles, SiN Episodes и другие licensees проверяли episodic, simulation или multiplayer formats.

Source давала зрелые FPS fundamentals, но визуальная идентичность зависела от способности studio уйти от узнаваемого Half-Life feel. Проект со standard materials, movement и UI быстро выглядел «как мод», даже если юридически был самостоятельной игрой.

### Respawn и дальняя технологическая родословная

Titanfall использовала сильно изменённую технологическую основу, происходящую от Source. Это не означает, что Apex Legends является «модом Half-Life 2» или работает на неизменном Valve engine. После многолетней самостоятельной разработки branch может заменить renderer, networking, tools и множество core systems.

Но lineage интересна: Source оказалась достаточно гибкой, чтобы стать starting point для fast movement, giant Titans, console releases и затем battle royale. Архитектурное наследие может жить после исчезновения большей части первоначального кода.

Правильная формулировка:

> technology Respawn имеет исторические корни в лицензированной и глубоко переработанной Source line.

А не:

> Apex буквально работает на том же движке, что Half-Life 2.

### Почему Source не стала Unreal Engine

Epic строила engine licensing как самостоятельный массовый business. Для успеха нужны не только features, но и productization:

- полная documentation;
- predictable releases;
- dedicated support;
- stable external APIs;
- samples и onboarding;
- platform certification;
- понятная pricing/licensing model;
- roadmap, учитывающая чужие games;
- возможность начать без личного контакта с владельцем engine.

Valve прежде всего строила Source для собственных shipping needs. External license существовала, но не определяла roadmap. Если Half-Life 2 требовала breaking change, internal product имел больший вес, чем удобство licensee.

Также Steam оказался значительно более масштабируемым бизнесом, чем engine support. Marketplace получает процент от множества games независимо от technology; middleware требует дорогой технической поддержки и конкурирует с Epic, Unity и proprietary engines.

Поэтому Source может быть великим engine и одновременно неудачным кандидатом на domination массового middleware market. Эти оценки не противоречат друг другу.

### Branch fragmentation и технологический долг

Когда каждая game развивает свою линию, возникают:

- повторные bug fixes;
- несовместимые tools;
- feature, доступная только одному project;
- трудный merge;
- разная поддержка hardware;
- documentation, относящаяся не к той branch;
- modder confusion.

Долгоживущие games ещё сильнее усложняют upgrade. Counter-Strike не может безболезненно получить новую physics; competitive feel зависит от старого поведения. Dota 2 не может остановить service на годы ради clean rewrite.

Source 2 позднее станет попыткой обновить authoring, rendering и platform architecture, но миграция снова будет происходить game by game. Универсального переключателя не существует.

### Узнаваемое Source-feel: достоинство и клеймо

Игрок часто узнаёт Source до чтения credits. Это сочетание movement acceleration, collision, physics weight, sound spatialization, door behavior, UI conventions и характера levels.

Для Valve identity полезна: Half-Life, Portal и mods ощущаются родственными. Для внешней studio она может мешать. Если fantasy RPG двигается и взаимодействует с props как Half-Life 2, technology просвечивает сквозь fiction.

Чтобы избавиться от клейма, team должна заменить defaults:

- camera и movement;
- UI;
- materials и lighting style;
- interaction feedback;
- animation;
- sound mix;
- entity conventions.

Чем больше заменено, тем ближе вопрос: не дешевле ли использовать более нейтральный engine? Source особенно выгодна проекту, который хочет её strengths и не боится её характера.

### Steam и Source усиливали друг друга, но не были одним продуктом

Source mod требовал base technology; Steam давала distribution и updates. Valve могла заметить популярный project, упростить установку или превратить его в standalone release. Это продолжает модель GoldSrc на новом уровне.

Но нельзя считать любую Steam-игру частью Source ecosystem. Store постепенно становится engine-neutral именно потому, что экономически выгоднее продавать Unity, Unreal и proprietary games, чем заставлять partners лицензировать Valve technology.

Это стратегический выбор:

```text
Source licensing
→ доход и влияние только там,
где разработчик выбирает Source

Steam
→ доход и влияние независимо от engine
```

Неудивительно, что Valve вложила больше энергии в универсальную distribution platform, чем в превращение Source в массовый middleware.

### Почему Source особенно хороша для FPS

Source наследует десятилетие refinement first-person fundamentals:

- responsive mouse input;
- понятное collision и movement;
- networked client/server model;
- console и cvars;
- spatial sound;
- быстрое создание brush levels;
- entities и triggers;
- physics interaction;
- сильная связь map и gameplay code.

Для FPS developer это богатая отправная точка. Для strategy, open-world streaming или radically data-oriented simulation значительная часть assumptions может мешать. Универсальный engine обязан одинаково серьёзно обслуживать множество жанров; Source была особенно сильна там, где совпадала с историей Valve.

### Мнение Кирилла

**Source 1 — великий движок.**

Особенно хорош как FPS foundation:

- input;
- physics;
- movement;
- world interaction;
- modding;
- быстрый iteration;
- соединение authored и systemic design.

Для своей эпохи он воспринимается как полноценная яркая альтернатива Unreal Engine 3. Source-games обладают узнаваемой материальностью: предметы хочется толкать, движение быстро отвечает, maps ощущаются построенными для действий, а не только для screenshots.

Но к началу 2010-х technology уже **«подзаебала»** и визуально/архитектурно чувствовала возраст. Узнаваемость превращалась в повторяемость:

- характерное освещение;
- знакомая physics jitter;
- похожее движение;
- branch fragmentation;
- устаревающий content pipeline;
- всё более заметное отставание presentation от новых engines.

Именно двойственность делает Source значимой. Она прожила достаточно долго, чтобы стать культурным языком PC-modding, и слишком долго, чтобы старение невозможно было скрыть.

Главный итог:

> **Source стала выдающейся внутренней и моддерской платформой именно благодаря тесной связи с играми Valve. Но отсутствие productization, стабильной общей ветки и внешне ориентированного support не позволило ей стать массовым middleware-стандартом уровня Unreal.**

---


## 19. Counter-Strike: Source: техническая модернизация, раскол дисциплины и новая жизнь пользовательских серверов { #p019 }

Counter-Strike: Source кажется очевидным продуктом: у Valve появился новый engine, а у компании уже была самая популярная multiplayer game. Перенести Counter-Strike на Source означало показать технологию миллионам игроков, проверить её под реальной нагрузкой и предложить современную визуальную версию проверенной формулы.

Но Counter-Strike нельзя обновлять как обычную action game. В ней мельчайшие особенности movement, recoil, collision, sound и map geometry являются частью накопленного знания. Улучшение renderer может сопровождаться изменением дисциплины. Поэтому CS:S стала одновременно успешной игрой, гигантским stress test Source и неудачной попыткой немедленно заменить 1.6 для всего competitive community.

### Зачем Valve понадобилась Counter-Strike на Source

Half-Life 2 доказывала character technology, physics и single-player постановку. Для engine platform этого недостаточно. Source должна была выдерживать:

- тысячи dedicated servers;
- большое число одновременных clients;
- постоянную конкурентную стрельбу;
- разнообразный consumer hardware;
- server mods и custom content;
- anti-cheat environment;
- быстрые updates через Steam;
- игроков, способных заметить изменение нескольких миллисекунд.

Counter-Strike была самым суровым доступным испытанием. Если Source стабильно обслуживает CS-аудиторию, Valve получает реальное доказательство зрелости networking, performance и distribution.

Игра также помогала Half-Life 2 commercial packages. Покупатель видел не только campaign, но и современную multiplayer Counter-Strike. Valve получала recurring engagement вокруг большого single-player release.

### Beta как проверка engine до Half-Life 2

Летом 2004 года Valve расширяла Counter-Strike: Source beta на владельцев Condition Zero и ATI Half-Life 2 bundle; вместе предлагался Source technology benchmark. Это показывает двойную функцию продукта: game и hardware/engine test. ([Valve — Phase 2 of CS: Source Beta](https://store.steampowered.com/news/39/))

Массовая beta давала данные, которые невозможно получить внутри офиса:

- drivers и GPU combinations;
- bandwidth и latency;
- server load;
- crash patterns;
- exploits;
- реальные настройки игроков;
- поведение physics props;
- несовместимости maps и hardware.

Пользователи фактически помогали стабилизировать platform перед крупнейшим релизом Valve. Они получали ранний доступ, но также принимали риски незавершённой technology.

### Что Source меняла на поверхности

CS:S переносила знакомые weapons, objectives и карты в новую presentation system:

- более детальные models;
- ragdolls;
- shader materials;
- динамичные reflections и water;
- physics props;
- новый sound environment;
- обновлённые effects;
- более насыщенную геометрию и декорации.

Для нового или casual-player это выглядело почти идеальным remake: та же понятная Counter-Strike, но без угловатой GoldSrc-картинки.

Однако competitive game существует не на screenshot. Она существует в повторяемости взаимодействий.

### Movement — не способ добраться до боя, а часть боя

В Counter-Strike скорость остановки, acceleration, air control, crouch, jump и collision определяют возможность точно выстрелить, пересечь sightline и занять timing.

Даже если две версии используют похожие численные намерения, различия engine меняют ощущение:

- насколько быстро player model останавливается;
- когда accuracy восстанавливается;
- как capsule/box проходит рядом с geometry;
- можно ли повторить привычный jump;
- как игроки сталкиваются друг с другом;
- насколько читается чужая velocity.

Ветеран не оценивает movement отдельно. Он строит на нём тысячи автоматизированных действий. Новая версия обнуляет часть embodied knowledge и поэтому ощущается не upgrade, а другой sport.

### Hitboxes, interpolation и восприятие справедливости

Игрок никогда не видит server state напрямую. Он видит интерполированную картину на client, отправляет command и получает решение server с учётом latency и lag compensation. Если animation, hitbox и visual model расходятся, возникает знакомое ощущение: «я попал, но игра не засчитала».

Source меняла networking и animation representation. Даже технически корректный результат мог восприниматься неверным, если feedback отличался от 1.6. Competitive trust зависит не только от точности code, но и от совпадения визуальной причины с результатом.

Проблема усугубляется community comparison. Любая странная смерть становится доказательством, что «hitreg в Source сломан», даже если конкретный случай вызван packet loss, server settings или ошибкой восприятия. Репутация затем влияет на каждое следующее событие.

### Physics украшает мир и загрязняет спортивную доску

Для Half-Life 2 movable objects являются источником gameplay. Для Counter-Strike physics prop может быть помехой:

- меняет sightline;
- выдаёт позицию шумом;
- блокирует movement;
- ведёт себя по-разному после столкновения;
- создаёт лишнее визуальное движение;
- требует network synchronization.

С одной стороны, cans, barrels и furniture делают environment живее. С другой — спортивная карта ценна стабильностью. Если дверь или бочка каждый раунд оказывается в другом положении, игроку приходится учитывать случайность, которая не обязательно добавляет качественное решение.

Valve и mappers постепенно ограничивали влияние props в competitive contexts. Это важный урок: showcase-feature engine не обязана подходить каждой игре на этом engine.

### Карта может сохранить название и перестать быть той же картой

Dust, Dust2, Aztec, Office и другие знакомые maps переносились с новой геометрией, lighting и clutter. Даже небольшое изменение имеет системные последствия:

- угол открывается раньше;
- silhouette хуже читается на материале;
- object даёт новое укрытие;
- doorway становится шире;
- grenade отскакивает иначе;
- sound распространяется по-другому;
- привычный lineup исчезает.

Для casual audience обновлённая карта — красивая версия памяти. Для professional scene — новая доска, только внешне похожая на старую.

### Почему 1.6 не исчезла

Обычная software migration предполагает, что новая версия функционально заменяет старую. Спортивная игра не обязана подчиняться этой логике. Если community считает старый ruleset более точным, понятным и глубоким, лучшая графика не является достаточным аргументом.

CS 1.6 уже обладала:

- огромной installed base;
- дешёвыми hardware requirements;
- зрелыми servers;
- картами и conventions;
- турнирами;
- командами и организаторами;
- десятилетием общей памяти;
- низким количеством декоративного шума.

CS:S должна была не просто быть хорошей. Она должна была компенсировать switching cost всего ecosystem. Этого не произошло.

В результате формируются параллельные scenes. Часть регионов, leagues и public servers остаётся в 1.6; часть принимает Source; новые игроки могут начинать уже с CS:S. Вместо единого successor Valve получает раскол.

### Для новичка Source могла быть объективно привлекательнее

Veteran resistance легко представить консерватизмом, но не следует делать обратную ошибку и считать CS:S бессмысленной для всех. Новому игроку GoldSrc в 2004 году уже могла казаться архаичной:

- грубые models;
- низкое texture resolution;
- ограниченная animation;
- менее выразительный sound;
- interface и server flow прошлого поколения;
- визуальная дистанция от Half-Life 2 и современных shooters.

Source снижала эстетический барьер. Более детальный environment помогал поверить в пространство; weapon feedback был зрелищнее; ragdolls заменяли повторяющиеся death animations; Steam упрощала получение актуальной версии.

Получается конфликт двух видов доступности:

```text
1.6
= технически лёгкая, чистая, знакомая ветерану

CS:S
= визуально современная, понятнее новой аудитории,
но механически чужая ветерану
```

Универсального «лучшего» решения не существовало. Valve выбирала будущую technology, а часть community защищала накопленную точность старой.

### Competitive legitimacy нельзя назначить сверху

Владелец IP может объявить новую версию официальной, финансировать tournaments и прекратить активное развитие старой. Но sport существует там, где игроки, teams и organizers признают правила достойными mastery.

CS:S показывает предел publisher power. Valve могла распространять продукт через Steam, но не могла приказом перенести доверие к recoil, movement и maps. Legitimacy требовала лет практики и независимого согласия ecosystem.

Это различие позднее станет важным для CS:GO. Технический successor должен не только получить users через platform, но и убедить обе старые scenes, что на нём стоит строить careers.

### Update способен менять дисциплину после релиза

Steam позволяла Valve исправлять CS:S постоянно. Это преимущество перед застывшей коробкой, но competitive community воспринимает patch двояко. Bug fix улучшает fairness; изменение movement или weapon balance обесценивает practice.

Платформа создаёт tension:

- software ожидается живым и исправляемым;
- sport ожидается стабильным и повторяемым.

Valve должна определять, где историческое поведение является дефектом, а где — частью дисциплины. CS:S стала ранней школой live competitive stewardship, хотя компания ещё не выстроила современную прозрачность patch notes, seasons и public test environments.

### Раскол был проблемой и одновременно экспериментом

Параллельное существование двух Counter-Strike позволяло сравнить:

- visual accessibility;
- spectator preferences;
- hardware reach;
- map behavior;
- региональную культуру;
- отношение veterans и newcomers;
- пригодность Source для competitive FPS.

Но оно дробило talent и audience. Турнирный организатор выбирал дисциплину; sponsor видел две версии; команда не могла автоматически переносить всех игроков. Позднее CS:GO будет пытаться объединить наследников 1.6 и Source, а не просто продолжить одну очевидную линию.

### CS:S как огромная custom-server platform

Если esport replacement оказался неполным, community sandbox был чрезвычайно успешным. Более богатая physics, Lua/plugin ecosystems вокруг серверов, custom maps и большая аудитория породили modes, далеко уходившие от bomb-defusal.

- **Surf** превращает air movement и наклонные поверхности в отдельную дисциплину.
- **Zombie modes** строят асимметричное заражение, barricades и survival.
- **Jailbreak** создаёт социальные правила, роли охраны и заключённых.
- **Minigame servers** соединяют десятки коротких challenges.
- **GunGame** меняет progression оружия внутри матча.
- **Deathrun**, roleplay и custom maps используют CS:S как доступный multiplayer construction kit.

Это наследие иногда недооценивают, потому что оно не укладывается в официальный competitive narrative. Для миллионов людей CS:S была не слабой заменой 1.6, а входом в пользовательскую культуру Source.

### Выпуск и долгая жизнь

Steam указывает дату выпуска Counter-Strike: Source **1 ноября 2004 года**, незадолго до Half-Life 2. Игра продолжала обновляться, получила перенос на более поздние ветки Source и сохраняла active servers после появления CS:GO. ([Steam](https://store.steampowered.com/app/240/CounterStrike_Source/))

Такой срок жизни опровергает простую формулу «CS:S провалилась». Она не смогла полностью заменить 1.6 как единый sport, но стала коммерчески успешной multiplayer platform и важным мостом между GoldSrc и будущей Counter-Strike.

### Мнение Кирилла

Для Кирилла CS:S почти не имеет эмоционального веса.

В саратовской локальной и файлообменной среде, где он играл, **1.6 была живой, доступной и понятной**, а Source практически не ощущалась обязательной. История platform migration существовала где-то в индустрии, но не создавала личной потребности менять игру.

Отсюда честный вопрос:

> **«Нахуя она существует?»**

Исторических ответов несколько:

- проверить Source в массовом multiplayer;
- дать новой аудитории современную Counter-Strike;
- добавить multiplayer-value к Half-Life 2;
- перевести часть ecosystem на новую technology;
- построить базу для custom servers и будущих iterations.

Но личный ответ остаётся слабым. Если 1.6 уже выполняет роль чистой «шахматной» дисциплины, а позднее GO делает следующий полноценный шаг, Source выглядит промежуточной версией, не обладающей незаменимой identity.

Это не означает, что CS:S объективно бесполезна. Это различие между **исторической функцией** и **личной причиной играть**. Для Кирилла первая очевидна, вторая почти отсутствует.

---

## 20. Half-Life 2 Episodes: попытка победить шестилетнюю разработку, которая повторила её болезнь { #p020 }

После почти шестилетнего production Half-Life 2 Valve поставила правильный диагноз: если каждое продолжение требует одновременно нового engine, технологической революции и гигантской campaign, серия будет исчезать на многие годы.

Решением должна была стать episodic model — короткие самостоятельные главы, выпускаемые регулярно. Она обещала чаще продолжать сюжет, быстрее проверять technology и удерживать команду внутри понятного scope.

Valve публично описывала episodes как четырёх-шестичасовые experiences, каждая из которых приносит новую историю, gameplay и актуальные improvements Source. ([Valve, 24 февраля 2006 года](https://valvearchive.com/Websites/steampowered.com/Steam/Marketing/February24.2006/))

Идея была логичной. Результатом стали две сильные игры — и провал самого формата.

### Что должна была исправить episodic development

Большая игра накапливает риск годами. Technology устаревает до релиза; story меняется после создания levels; игроки долго не дают feedback; команда поздно видит полный pacing.

Эпизод обещал другой цикл:

```text
ограниченный набор environments и mechanics
↓
быстрый production
↓
релиз через Steam
↓
данные и feedback
↓
следующая глава
```

Digital distribution особенно подходила модели: не нужно производить отдельный full-price retail blockbuster; небольшой продукт можно preload, продать и обновить напрямую.

Valve также могла постепенно развивать Source. Вместо одного огромного leap каждая глава добавляет lighting, AI, particles или tools и немедленно shipping-ит улучшение.

### Aftermath превращается в Episode One

Первое продолжение некоторое время называлось **Aftermath**. Название подчёркивало непосредственные последствия финала Half-Life 2. Позднее продукт стал Episode One — обещанием серии, а не просто expansion.

Это branding имеет значение. «Aftermath» может быть отдельным довеском. «Episode One» создаёт contract с аудиторией: будут Two и Three, а общая история движется к завершению.

Episode One вышла 1 июня 2006 года, примерно через полтора года после Half-Life 2. Для обычного expansion это разумный срок; для обещанной быстрой episodic cadence — уже сигнал, что производство не стало мгновенным.

### Alyx как центральная система Episode One

Почти весь эпизод Gordon проводит рядом с Alyx. Это сознательное развитие character technology и companion design.

Партнёр должен:

- участвовать в бою, но не забирать всё удовольствие;
- помогать, но не решать puzzles за игрока;
- реагировать на environment;
- не блокировать путь;
- переживать хаотические physics situations;
- говорить достаточно, чтобы строить отношения, но не раздражать повторением;
- сохранять credibility, когда игрок ведёт себя абсурдно.

Alyx также служит эмоциональным зеркалом. Gordon молчит, поэтому её страх, юмор и облегчение помогают сцене иметь человеческий тон. В тёмных пространствах она использует pistol рядом с flashlight игрока, превращая cooperation в механику.

### Камерность как достоинство и ограничение

Episode One происходит в Citadel и разрушающемся City 17. Valve переиспользует знакомые environments, factions и assets. Это соответствует episodic economics: продолжение быстрее, потому что foundation уже существует.

Компактность создаёт плотность:

- последствия финала начинаются немедленно;
- отношения с Alyx получают больше времени;
- collapse города задаёт постоянную цель;
- нет необходимости заново вводить весь мир.

Но familiar setting уменьшает ощущение нового путешествия. После разнообразия Half-Life 2 возвращение в Citadel, tunnels и городские улицы может восприниматься как extended final act, а не новая глава мира.

### Темнота, flashlight и dependency

Underground sections строятся вокруг ограниченного flashlight и Alyx. Игрок освещает targets; companion стреляет. В лучшем случае возникает взаимозависимость и horror tension. В худшем — ожидание recharge и борьба с visibility.

Это хороший пример episodic experiment: небольшая mechanic получает значительную долю короткой игры. Если она не нравится, проблема ощущается сильнее, чем один encounter в большой campaign.

### Telemetry: shipped game начинает отвечать разработчику

Steam позволяла собирать агрегированные данные о прохождении:

- время в chapters;
- места смертей;
- difficulty;
- точки, где игроки останавливаются;
- использование mechanics;
- завершение encounters.

До этого playtest происходил до релиза на ограниченной sample. Telemetry показывает поведение огромной реальной аудитории на собственных компьютерах.

Но data не объясняет причину автоматически. Высокая death rate может означать хороший climax, непонятную цель, bug или намеренный challenge. Дизайнер всё ещё интерпретирует цифру через наблюдение и контекст.

Episodic cycle обещал использовать данные одного выпуска для следующего. Это ранняя service-thinking логика внутри narrative single-player game.

### Экономика эпизода требует дисциплины повторного использования

Короткий продукт не обязательно дешевле пропорционально длительности. Engine, tools, voice recording, QA, localization, marketing и platform certification имеют fixed costs. Если команда создаёт новые enemies, environments и technology для каждого четырёхчасового эпизода, стоимость часа может оказаться выше большой игры.

Чтобы модель работала, разработчик должен сознательно переиспользовать:

- assets;
- characters;
- weapons;
- core mechanics;
- production pipeline;
- часть environments;
- marketing identity.

Episode One делает это последовательно и поэтому ощущается знакомым. Episode Two стремится дать больше нового и поэтому становится дороже и медленнее. Игровое улучшение подрывает industrial premise.

Здесь вкус аудитории конфликтует с business model. Покупатель Half-Life ожидает инновации; экономически эффективный episode должен быть вариацией на стабильной основе.

### Цена и восприятие длины

Episodic product вынужден объяснять, почему несколько часов стоят денег отдельно. Игрок сравнивает не только качество, но и duration с full game. Даже плотная глава может получить ярлык «слишком короткой», если marketing не формирует правильное ожидание.

Valve частично решала проблему ценой, digital distribution и позднее Orange Box. Но Episode One всё равно оценивалась одновременно как произведение и как fraction Half-Life 2.

Это ещё одна причина, почему bundle окажется удобнее чистой episodic sale: короткий narrative component не должен один нести всю дискуссию о value.

### Developer Commentary как публичный слой production knowledge

Episode One включала Commentary Mode, развивая эксперимент Lost Coast. Игрок мог пройти знакомые сцены и активировать nodes с объяснениями designers, artists и programmers.

Это больше bonus track. Valve превращала собственный production process в часть brand:

- рассказывала о playtests;
- объясняла visual guidance;
- показывала AI compromises;
- связывала technology с конкретной сценой;
- обучала будущих developers внутри самой игры.

Commentary укрепляла образ Valve как инженерно-дизайнерской лаборатории, а не только закрытого автора продукта.

### Мнение Кирилла об Episode One

Episode One для Кирилла — **«прикольный»**.

Это качественный довесок:

- больше Alyx;
- хороший темп;
- сильная непосредственная связь с финалом HL2;
- несколько выразительных cooperative ситуаций;
- компактная продолжительность.

Но ощущение нового великого путешествия отсутствует. Знакомый City 17 и зависимость от уже освоенных systems делают эпизод хорошим продолжением, а не самостоятельным пиком.

### Episode Two меняет масштаб

Episode Two вышла в октябре 2007 года внутри Orange Box. Вместо ещё одного городского aftermath Valve переносит действие в леса, caves и White Forest.

Изменение environment сразу решает проблему узнаваемости:

- природное освещение;
- большие outdoor spaces;
- новые silhouettes;
- vehicle travel;
- Antlion caves;
- resistance base;
- rural ruins;
- масштабный финальный бой.

Episode Two ощущается новой частью путешествия, хотя использует знакомый foundation.

### Hunter как враг, построенный для взаимодействия

Hunter должен быть не просто меньшим Strider. Он быстрый, устойчивый, действует группой и использует flechettes. Его атака создаёт delayed explosions и заставляет менять позицию.

Особенно хорошо enemy взаимодействует с physics: тяжёлый prop можно использовать против него, а flechettes превращают objects в временную угрозу. Это типичный Valve design — новый противник заставляет переосмыслить уже знакомые инструменты.

### Antlion caves и смена масштаба

Подземные sections сначала сжимают пространство и делают бой ближним. Затем игра открывается в автомобильное путешествие. Контраст усиливает ощущение выхода наружу.

Valve использует companion characters и environmental beats, чтобы caves не стали однообразной серией tunnels. Но именно Episode Two лучше первой главы показывает episodic ideal: короткая игра успевает сменить несколько выразительных языков.

### Strider finale и открытая задача

Финальная оборона White Forest — одна из самых системных battles Half-Life 2 era. Игрок перемещается между направлениями, отслеживает Striders и Hunters, использует vehicle и Magnusson Devices.

Encounter сложен для обучения:

- нужно объяснить новый explosive device;
- научить прикреплять его Gravity Gun;
- дать понять priority targets;
- позволить быстро перемещаться;
- сохранять давление без мгновенного провала;
- сообщать состояние нескольких направлений.

В отличие от линейной corridor fight, игрок сам определяет порядок реакции. Это делает climax replayable и одновременно повышает риск confusion.

### Narrative payoff и cliffhanger

Episode Two продвигает историю значительно дальше: связь с Aperture и Borealis, планы сопротивления, развитие отношений персонажей и смерть Eli Vance.

Финал рассчитан на продолжение. Его эмоциональная сила основана на обещании, что игрок отправится дальше и ответит на случившееся. Когда Episode Three не выходит, cliffhanger превращается из драматического перехода в незавершённый contract с аудиторией.

### Мнение Кирилла об Episode Two

**Episode Two — шедевр и один из пиков всей Half-Life.**

Причины:

- плотнее большой HL2;
- разнообразнее Episode One;
- почти не имеет серьёзных просадок;
- постоянно меняет ситуации;
- вводит сильных Hunters;
- соединяет caves, vehicle, base defense и narrative payoff;
- заканчивается мощным эмоциональным ударом.

Это почти идеальная форма Half-Life для вкуса Кирилла: достаточно длинная, чтобы стать путешествием, и достаточно короткая, чтобы не размыть лучшие идеи.

### Почему episodic model всё равно умерла

Episode One заняла больше времени, чем предполагает образ «быстрой главы». Episode Two стала крупнее, технологически амбициознее и вышла ещё через шестнадцать месяцев.

Valve столкнулась с противоречием:

```text
эпизод должен быть быстрым и ограниченным
↓
новая Half-Life должна ощущаться значительным событием
↓
команда добавляет technology, enemies и systems
↓
scope растёт
↓
cadence ломается
```

Культура Valve не любила выпускать просто ещё несколько хороших уровней. Проект должен был оправдывать существование новой идеей. Но episodic economics работает лучше, когда foundation стабилен и команда принимает повторяемость.

### Episode Three и технологическая ловушка

Третий эпизод должен был завершить trilogy, но development разошёлся по experiments и competing priorities. Source старела; новая Half-Life ожидалась как технологический шаг; короткий episode уже не мог соответствовать годам ожиданий.

Каждая задержка увеличивала проблему:

```text
через год можно выпустить Episode Three
↓
через три года аудитория ждёт Half-Life 3
↓
через десять лет обычный episode уже выглядит невозможным
```

Модель, созданная для частых releases, особенно плохо переносит пропуск cadence. Название «Episode Three» само напоминает о несостоявшемся обещании.

Поздняя anniversary-версия Final Hours включает ранние идеи и experiments третьей главы, но существование concepts не означает, что одна почти готовая игра была тайно отменена. Как и с leak 2003, нужно различать prototypes, directions и production-ready whole. ([Half-Life 2: 20th Anniversary](https://www.half-life.com/en/halflife2/20th))

### Незавершённость меняет восприятие уже выпущенного Episode Two

В 2007 году смерть Eli — сильный cliffhanger. Игрок должен пережить shock и ждать немедленной экспедиции к Borealis. Спустя годы та же сцена несёт второй слой: это место, где рассказ остановился.

Хорошая драматическая незавершённость стала плохой product finality. Episode Two не даёт эмоционального closure, потому что и не должна была быть финалом.

Отсутствие Episode Three поэтому повреждает не качество levels, а contract всей trilogy. Если бы Episode Two заканчивалась завершённой аркой, молчание Valve было бы обычным отсутствием sequel. Cliffhanger делает его невыполненным обещанием внутри уже проданного произведения.

Half-Life: Alyx позднее возвращается к последствиям финала, но не превращает episodic trilogy в завершённую. Она меняет перспективу и открывает новое направление, а не выпускает отсутствующую третью главу в первоначальном формате.

### Итог episodic experiment

Как игры Episodes успешны:

- Episode One качественно развивает Alyx и aftermath;
- Episode Two концентрирует лучшие качества Half-Life;
- оба продукта развивают Source и commentary;
- история получает важные события.

Как production model эксперимент провален:

- releases не становятся достаточно частыми;
- scope растёт;
- trilogy не завершается;
- feedback не создаёт устойчивый industrial rhythm;
- Valve снова уходит в долгие технологические поиски.

Главная ирония:

> **Valve придумала Episodes, чтобы вылечить Half-Life от шестилетней разработки, но требование постоянно переизобретать Half-Life оказалось сильнее ограниченного формата.**

---

## 21. The Orange Box: три новых игры, одна дата и почти невозможная плотность ценности { #p021 }

The Orange Box обычно вспоминают как один из лучших bundles в истории: пять игр по цене одной. Но её значение не только в выгоде. В одной упаковке Valve одновременно выпустила три принципиально разных новых продукта:

- Half-Life 2: Episode Two;
- Portal;
- Team Fortress 2.

К ним добавлялись Half-Life 2 и Episode One. Покупатель получал завершённую на тот момент линию Half-Life 2, экспериментальную puzzle game и multiplayer shooter, разрабатывавшийся почти девять лет.

Такой package распределял риск, создавал единый shipping target и позволял маленькому Portal попасть к аудитории, которую отдельный неизвестный puzzle title мог не собрать.

### Не compilation старых хитов

Игровые сборники существовали давно, но обычно переупаковывали catalog. Orange Box использовала classics как foundation, а основную культурную ценность создавала премьерами.

Структура выглядела так:

```text
известный шедевр: Half-Life 2
+
продолжение: Episode One
+
новая сюжетная глава: Episode Two
+
неизвестный эксперимент: Portal
+
долгожданный multiplayer: Team Fortress 2
```

Покупатель мог прийти ради одного компонента и открыть другой. Это cross-subsidy внимания.

### Black Box: версия только с новым content

Изначально Valve и EA объявляли две configurations. **The Black Box** должна была содержать Episode Two, Portal и Team Fortress 2 — только новые продукты. **The Orange Box** добавляла Half-Life 2 и Episode One.

Официальное объявление февраля 2007 года представляло обе версии как осенние releases. ([EA and Valve](https://s204.q4cdn.com/701424631/files/doc_news/2007/02/1/314544.pdf))

Для владельца HL2 и Episode One Black Box была логичнее: он не платит за уже купленное. Но SKU отменили, оставив Orange Box основным package.

Решение вызвало справедливое раздражение. Digital account уже знал, какими играми владеет пользователь, но pricing bundle не обязательно вычитала дубликаты.

Valve позволяла передавать лишние licenses Half-Life 2 и Episode One через Steam Friends. Это смягчало проблему и одновременно демонстрировало странность digital ownership: duplicate нельзя было продать или обменять свободно, но platform разрешала конкретный gift flow.

### Почему пять игр могли стоить как одна

Marginal cost цифровой копии очень низка. Half-Life 2 и Episode One уже окупили значительную часть разработки; включение в bundle повышало perceived value почти без manufacturing cost каждой дополнительной игры.

Retail box всё ещё имела физические расходы, но economics content отличалась от пяти новых отдельных discs. Valve могла использовать старый catalog как средство acquisition.

Для нового игрока предложение было почти абсурдным. Для существующего фаната value концентрировалась в трёх premieres.

### Portfolio logic: успех оценивается не по каждой строке отдельно

Если Portal продаётся отдельно слабо, publisher может считать проект неудачным. В Orange Box её функция шире:

- повысить reviews и word of mouth package;
- создать новый IP;
- показать range Source;
- привлечь аудиторию, которой не нужен multiplayer;
- усилить культурную идентичность Valve.

TF2 может не принести full-price revenue отдельно, но создаёт годы engagement и Steam logins. Episode Two поддерживает доверие core Half-Life audience. Старые игры привлекают newcomers.

Valve может оценивать combined lifetime value:

```text
продажа package
+ новый Steam account
+ заполненный TF2 server
+ узнаваемость Portal
+ возвращение к Half-Life catalog
```

Такая логика доступнее platform owner, чем традиционному publisher, который получает ограниченную долю от каждого SKU и обязан отчитываться по отдельным products.

### Bundle снижает marketing cost объяснения

Три самостоятельные кампании потребовали бы трёх отдельных сообщений, рекламных бюджетов и решений о покупке. Orange Box имеет один узнаваемый объект и одну дату.

Portal можно описать внутри общего интереса прессы к Valve. TF2 получает внимание Half-Life-аудитории. Episode Two появляется в материалах рядом с визуально радикальной TF2 и необычной portal mechanic.

Каждый product производит новости для остальных. Обзор package почти обязан рассказать обо всех компонентах; даже skeptical журналист запускает маленькую игру, которую мог бы пропустить как отдельный low-profile release.

### Риск общей даты

Общий shipping target помогает coordination, но создаёт coupling. Bug в одном component способен задержать весь package; console certification проверяет огромный набор; marketing date связывает teams с разным уровнем готовности.

Кроме того, attention внутри bundle распределяется непредсказуемо. Portal могла потеряться рядом с TF2 — вместо этого стала сенсацией. Другая маленькая игра могла бы быть подавлена количеством content.

Orange Box успешна не потому, что bundle автоматически усиливает всё, а потому, что компоненты достаточно различались и каждый имел отчётливую identity.

### Отсутствие традиционной иерархии на обложке

Обычный package выделил бы Half-Life 2 крупнее, а Portal поместил мелким bonus. Оранжевая упаковка перечисляет content почти утилитарно. Это даёт неизвестным играм странное равноправие: они не выглядят demo или мини-режимами внутри Half-Life.

Именно самостоятельность названий позволила Portal и TF2 немедленно строить собственные brands, хотя коммерчески они приехали в одной коробке.

### Каждый продукт закрывал слабость другого

Если продавать отдельно:

- Episode Two могла выглядеть коротким expansion;
- Portal — маленьким неизвестным puzzle experiment;
- TF2 — multiplayer-only игрой без campaign;
- старые HL2/EP1 — неинтересными текущему владельцу.

В bundle:

```text
Half-Life brand
→ доверие и аудитория

Episode Two
→ гарантированное сюжетное продолжение

TF2
→ долгосрочная replayability

Portal
→ новая авторская идея и surprise

HL2 + Episode One
→ полная точка входа новичку
```

Ни один компонент не обязан один оправдывать full-price purchase.

### Portal получает аудиторию без необходимости объяснить себя рекламой

Portal трудно продавать в 2007 году. Короткая first-person puzzle game с неизвестным названием, минималистичными rooms и механикой, которую сложно объяснить статическим screenshot, выглядела коммерчески рискованно.

В Orange Box риск почти исчезает. Покупатель Half-Life или TF2 уже получает Portal и может попробовать без отдельного решения о покупке. Word of mouth затем превращает маленький компонент в культурный феномен.

Bundle выполняет функцию discovery algorithm до современного storefront recommendation: физически помещает эксперимент рядом с гарантированным хитом.

### TF2 получает безопасный перезапуск после девяти лет

Team Fortress 2 пережила несколько радикальных redesigns. Отдельный релиз создал бы давление: может ли multiplayer-only sequel один оправдать цену и ожидание?

Orange Box снижает барьер. Огромное число владельцев Episode Two автоматически получает TF2; servers быстро заполняются; network effect запускается в день релиза.

Для multiplayer game это критично. Даже великолепная система выглядит мёртвой без людей. Bundle покупает стартовую population не рекламой, а совместным SKU.

### Episode Two является якорем доверия

Half-Life fan мог скептически относиться к cartoon TF2 и странному Portal, но Episode Two была понятным продолжением. Она служила reason to buy now.

При этом сама глава выигрывала от package: короткая длительность не вызывала того же спора о цене, потому что рядом находились ещё четыре игры.

### Общий shipping target как организационный механизм

Valve описывает себя как self-organizing company, но products всё равно нуждаются в deadlines и coordination. Orange Box создала внешний неподвижный объект: несколько teams должны закончить к общей дате.

Если Portal готова, а TF2 нет, Portal не выпускается. Поэтому помощь соседней команде становится рациональной:

```text
мой component стабилен
↓
чужой component блокирует package
↓
помощь чужой команде
ускоряет мой собственный release
```

Это не отменяет management и dependencies, но превращает сотрудничество из абстрактной культурной ценности в общий outcome.

### Три разных доказательства Source

Orange Box одновременно демонстрировала диапазон engine.

- **Episode Two** — outdoor environments, vehicles, Hunters, cinematic character scenes.
- **Portal** — recursive rendering, transformed physics, precise spatial puzzles.
- **TF2** — stylized animation, class multiplayer, particles, читаемость silhouettes.

После Half-Life 2 Source могла казаться technology одного конкретного realistic sci-fi shooter. Orange Box показывает, что она способна поддерживать horror/puzzle comedy, cartoon multiplayer и narrative adventure.

### PC, Xbox 360 и PlayStation 3 — неодинаковый опыт

Orange Box была не только Steam release. Console packages привели игры Valve к аудитории, которая не участвовала в ранней PC ecosystem.

Xbox 360 version стала важной точкой входа и получила сильное признание. PlayStation 3 port разрабатывался при участии EA и известен худшей technical reputation: performance и support отличались. Это показывает предел package promise — одинаковая коробка не гарантирует одинаковое качество platform implementation.

На PC Steam обеспечивала updates и долгую жизнь TF2. Console versions зависели от certification, platform policies и иной update economics. Особенно для multiplayer разрыв со временем увеличивался.

### Маркетинг через намеренно простую упаковку

Orange Box визуально почти отказывается от обычного blockbuster cover art. Ярко-оранжевый фон, маленькие символы и перечисление titles выглядят скорее как utilitarian software package или бюджетная compilation.

Но простота решает проблему: невозможно честно выбрать одного героя для пяти разных игр. Gordon, Heavy и portal icon существуют рядом, а цвет превращает package в мгновенно узнаваемый объект.

Название тоже не объясняет content. Оно работает как label общей поставки, а не как новая fictional universe.

### Почему такой bundle трудно повторить

Orange Box возникла из редкого совпадения:

- Episode Two была готова продолжить известную серию;
- Portal была маленькой и рискованной;
- TF2 наконец завершала долгий production;
- HL2 и Episode One уже существовали;
- Steam позволяла выдавать и обновлять licenses;
- Valve владела всеми компонентами;
- economics не требовала делить bundle между независимыми publishers.

Обычный publisher предпочёл бы продавать три новых продукта отдельно. Valve могла оценивать не только выручку каждой коробки, но и рост Steam accounts, TF2 population, Portal brand и долгосрочную ценность catalog.

### Коммерческий успех не распределился равномерно

Portal стала неожиданным культурным прорывом; TF2 превратилась в долгоживущую service game; Episode Two получила выдающиеся оценки, но её story осталась без следующей главы.

Bundle не стирает различия. Один компонент может стать meme factory, другой — multiplayer economy, третий — трагически незавершённым narrative. Общая дата создаёт старт, но дальнейшая судьба определяется отдельными systems и решениями Valve.

### Мнение Кирилла

Orange Box — почти идеальный игровой пакет.

Обложка при этом смешная:

> выглядит как дешёвая бюджетная сборка — тупо ярко-оранжевая коробка с перечислением содержимого.

Контраст с содержанием прекрасный. Внутри:

- Half-Life 2 — шедевр и лучший PC-шутер;
- Episode One — хороший, **«прикольный»** довесок;
- Episode Two — шедевр;
- Portal — любимая Valve-игра Кирилла;
- TF2 — один из наиболее уважаемых им multiplayer shooters.

Почти каждый элемент отдельно мог бы определять год другой компании. Здесь они лежат в одной нарочито простой коробке.

Для вкуса Кирилла package особенно точен по плотности:

- одна длинная campaign;
- две компактные главы;
- короткая радикальная puzzle game;
- бесконечно replayable class shooter;
- минимум необходимости покупать filler ради одного нужного продукта.

Главный итог:

> **The Orange Box была не просто щедрой скидкой. Она использовала известность Half-Life, чтобы безопасно запустить Portal и заполнить servers TF2; использовала replayability TF2, чтобы увеличить долговечность package; и превратила три производственных риска в один из самых ценных релизов в истории игр.**

---


## 22. Portal: студенческий прототип DigiPen, который Valve превратила в идеальную короткую игру { #p022 }

Portal часто вспоминают как доказательство необычайной изобретательности Valve. Это верно только наполовину. Главную механику придумали не внутри компании: она пришла из студенческой игры **Narbacular Drop**. Собственное достижение Valve состояло в другом — компания распознала сильную идею, наняла её авторов, встроила порталы в Source, а затем окружила механику настолько точной режиссурой, драматургией и визуальным языком, что технический prototype превратился в одну из самых цельных игр своего времени.

### До Portal была Narbacular Drop

Narbacular Drop создала в DigiPen команда студентов, называвшая себя **Nuclear Monkey Software**. Игрок управлял принцессой по прозвищу No-Knees, запертой в разумном подземелье Wally. Подземелье могло открывать на поверхностях два взаимосвязанных портала, а игрок решал пространственные задачи, проходя через одну точку и выходя из другой.

В прототипе уже находилось принципиальное ядро будущей Portal:

- два связанных входа в одно нелокальное пространство;
- возможность видеть мир сквозь портал;
- перенос игрока и предметов между удалёнными точками;
- задачи, основанные не на поиске ключа, а на изменении самой геометрии маршрута;
- сохранение движения и использование падения для набора скорости.

Поэтому формула «Valve придумала порталы» неверна. Корректнее сказать: команда DigiPen придумала игровую систему, а Valve увидела в ней потенциал, который значительно превосходил масштаб студенческого проекта.

Это различие важно для всей истории компании. Valve нередко выступала не как одинокий источник идеи, а как организация, способная заметить уже работающий prototype и приобрести не только концепцию, но и людей, которые лучше всех понимали её возможности. Так прежде произошло с Team Fortress и Counter-Strike; с Portal та же модель сработала уже не в мод-среде, а в учебной.

### Демонстрация, после которой наняли всю команду

Представители Valve увидели Narbacular Drop на выставке студенческих проектов DigiPen. Команду пригласили показать игру в офисе компании. По воспоминаниям разработчиков, демонстрация едва успела начаться, когда Гейб Ньюэлл предложил работу всем её участникам.

Эту историю легко превратить в легенду о мгновенном гениальном озарении, но практический смысл решения интереснее. Valve не просто купила право повторить заметный трюк. Она получила компактную команду, уже прошедшую самый неопределённый этап разработки:

- авторы доказали, что механика вообще доставляет удовольствие;
- создали редактор и набор головоломок;
- столкнулись с пространственными ограничениями идеи;
- научились объяснять игроку непривычное правило;
- могли отличить настоящую глубину от эффектной, но одноразовой демонстрации.

Для самих выпускников переход был резким. У них не было опыта создания коммерческой игры масштаба Valve, поэтому рядом работали более опытные сотрудники компании. Portal стала одновременно самостоятельным проектом и обучением производству: студенческая уверенность в центральной механике сочеталась с накопленными Valve знаниями о playtesting, темпе, подаче мира и технической доводке.

### Портал — не телепорт и не графический трюк

Первой большой задачей стало воспроизведение portal technology в Source. Обычный телепорт может скрыть перемещение затемнением, дверью или монтажным переходом. Portal требует, чтобы обе области пространства существовали для игрока одновременно и подчинялись одним правилам.

Система должна была согласованно решать несколько классов задач:

- отрисовывать через одну поверхность сцену, видимую с позиции другой;
- правильно преобразовывать положение и направление камеры;
- переносить игрока, кубы и другие физические объекты без заметного разрыва;
- сохранять скорость, превращая вертикальное падение в горизонтальный полёт;
- обрабатывать столкновения объекта, который частично находится по обе стороны портала;
- синхронизировать звук, частицы, освещение и физику;
- предотвращать бесконечные визуальные и collision-ошибки при взгляде портала в портал;
- ограничивать размещение порталов так, чтобы правило оставалось понятным и уровни не разрушались случайными поверхностями.

Фраза GLaDOS «speedy thing goes in, speedy thing comes out» описывает не шутку поверх механики, а её центральный закон. Игрок должен доверять сохранению импульса настолько же естественно, как прыжку в обычной игре. Если поведение хотя бы иногда кажется произвольным, пространство перестаёт быть инструментом и становится лотереей.

Valve также пришлось решить проблему восприятия. Портал математически соединяет две системы координат, но человек не думает матрицами преобразований. Ему нужны устойчивый цвет каждой двери, хорошо читаемые рамки, видимая глубина другой комнаты, предсказуемая ориентация и безопасные первые упражнения. Технология становится механикой только тогда, когда игрок способен строить о ней мысленную модель.

### Малый масштаб оказался достоинством

Portal начала разрабатываться в 2005 году небольшой командой. У неё не было ресурсов на длинную кампанию, десятки персонажей, крупные открытые пространства и традиционную кинематографическую постановку. Эти ограничения определили форму игры:

- изолированные test chambers позволяли вводить по одной переменной;
- стерильные поверхности ясно показывали, куда можно поставить портал;
- голос из громкоговорителей заменял постоянное присутствие анимированного NPC;
- повторяемая архитектура делала изменения в поведении комплекса особенно заметными;
- короткая продолжительность позволяла закончить игру до исчерпания идеи.

Так Portal превратила производственную экономию в художественную систему. Белые комнаты существуют не потому, что художникам нечего было рисовать. Они создают контролируемую грамматику: чистая поверхность обещает возможность действия, тёмная металлическая — запрещает его, кнопка требует груза, энергетический шар следует по видимому маршруту. Игрок учится читать лабораторию без всплывающей энциклопедии.

### Playtesting как соавтор игры

Valve не могла полагаться на интуицию людей, уже месяцами живших с порталами. Для нового игрока даже простое действие — поставить вход на стене, выход на полу и шагнуть в собственное падение — не является очевидным. Поэтому задачи многократно проверялись на людях, а команда наблюдала не только за тем, прошёл ли человек комнату, но и за тем, что именно он понял.

Отсюда вырастает характерная последовательность Portal:

1. игрок сначала видит портал, но не создаёт его;
2. проходит сквозь уже установленную связь и видит самого себя;
3. получает контроль только над одним цветом;
4. учится переносить кубы и направлять энергетические шары;
5. получает полный portal gun;
6. соединяет пространственное мышление с импульсом;
7. применяет изученное вне предусмотренного тестом маршрута.

Игра почти никогда не выдаёт новое правило в момент, когда одновременно требуется совершить сложный трюк. Она сначала демонстрирует, затем просит повторить, после — комбинирует с предыдущими знаниями. Это учебник, замаскированный под комедию о лабораторном насилии.

### Как служебный голос стал GLaDOS

Сценарист Эрик Уолпоу сначала записывал тестовые реплики через text-to-speech. Голос должен был направлять игрока, комментировать результаты и заполнять пустоту между задачами. Но механически полезный narrator быстро оказался интереснее безличной системы.

Постепенно GLaDOS получила характер: холодную вежливость, пассивную агрессию, плохую способность правдоподобно лгать и всё более заметное личное раздражение. Эллен Маклейн произнесла реплики с машинной точностью, но оставила достаточно человеческих интонаций, чтобы игрок слышал за протоколом обиду и садизм.

GLaDOS решает сразу несколько задач:

- объясняет правила и реагирует на прогресс;
- создаёт присутствие антагониста без дорогих сцен лицом к лицу;
- связывает разрозненные chambers в единый эксперимент;
- управляет темпом между головоломками;
- раскрывает состояние Aperture через оговорки и противоречия;
- делает саму архитектуру лаборатории продолжением личности.

Это редкий случай, когда tutorial system, рассказчик, комический персонаж и финальный boss являются одной сущностью. Экономия не ощущается компромиссом: отсутствие живых людей становится главным источником тревоги.

### Aperture Science и повествование через пространство

Поначалу Aperture выглядит как безупречный научный комплекс. Белые панели, камеры наблюдения, пиктограммы и спокойный голос обещают контролируемую процедуру. Затем фасад трескается: появляются закулисные коридоры, технические шахты, грязные стены, старые офисы и надписи предыдущего пленника.

Игра не прерывается ради ролика о том, что корпорация опасна. Игрок сам проходит из публичной части системы в её внутренности. Ложь GLaDOS подтверждается географией: за идеально оформленным тестом существует громадная машина, предназначенная не для заботы об испытуемом, а для продолжения эксперимента любой ценой.

**Weighted Companion Cube** показывает, как Valve связывала playtesting с драматургией. Команде требовалось, чтобы игрок заметил и запомнил конкретный куб. Вместо интерфейсного маркера объект получил сердечки, имя и настойчивые комментарии GLaDOS. Обязательное уничтожение куба превращает техническую операцию в абсурдно эмоциональный эпизод. Игра не доказывает, что куб действительно живой; она показывает, насколько мало нужно человеку, чтобы наделить вещь отношением, когда единственный собеседник постоянно манипулирует им.

### Побег меняет смысл уже освоенной механики

Самый сильный структурный ход Portal происходит после ложного финала испытаний. Игрок уже считает, что понял формат: новая комната, новая комбинация элементов, следующая похвала с угрозой. Попытка GLaDOS сжечь Челл разрушает договор.

Важно, что после этого Portal не выдаёт новое оружие и не становится другой игрой. Те же порталы, которые система разрешала ставить для прохождения тестов, теперь используются для выхода из предназначенного маршрута. Механическое мастерство превращается в самостоятельность: раньше игрок решал задачи GLaDOS, теперь сам определяет, что является задачей.

Закулисная часть также переосмысляет предыдущие комнаты. Наблюдение было реальным, обещанный cake — инструментом мотивации, а нейтральный автоматический комплекс — пространством чьей-то воли. Именно поэтому короткий побег ощущается не бонусной главой, а драматическим переворотом всей игры.

### Финал, который знает, когда остановиться

Битва с GLaDOS проверяет освоение порталов, но не пытается стать обычным shooter boss fight. Игрок обращает инфраструктуру комплекса против управляющего ею компьютера, разбирает её личность по модулям и завершает конфликт в том же языке, в котором прошёл всю игру.

Песня Джонатана Коултона **Still Alive** продолжает сцену после титров. Это не отдельная комическая награда, а последний монолог GLaDOS: она переписывает поражение как успешный эксперимент, одновременно угрожает и цепляется за отношения с испытуемой. Даже credits работают на персонажа.

В Orange Box Portal могла выглядеть небольшой добавкой рядом с Half-Life 2 и TF2. Именно это снизило коммерческий риск странной короткой игры без известного бренда. Но после релиза соотношение перевернулось: компактный experiment стал самостоятельной культурной точкой, породил продолжение и закрепил модель Valve по найму авторов сильных prototypes. Позже компания похожим образом пригласила команду студенческой **Tag: The Power of Paint**; её идея красок получила новое применение в Portal 2. Подробная история продолжения относится к пункту 26.

### Мнение Кирилла

**Portal 1 — лучшая игра Valve для Кирилла «на все века и эпохи».** Portal — его любимая игровая серия вообще.

Первая часть особенно сильна абсолютной концентрацией:

- практически ноль филлера;
- одна механика непрерывно раскрывается глубже;
- идеальная короткая продолжительность;
- точное обучение без ощущения урока;
- GLaDOS одновременно смешная, страшная и функциональная;
- narrative существует внутри действия, а не вместо него;
- escape-секция меняет восприятие уже знакомой игры;
- финал завершает и механику, и отношения с антагонистом.

Portal 2 объективно крупнее, разнообразнее и богаче персонажами. Но первая Portal обладает почти недостижимой **чистотой идеи**. Она вводит одно невозможное пространственное правило, исследует его без отвлечений и заканчивается ровно тогда, когда сказала всё необходимое.

Главный итог:

> **Величие Portal не в том, что Valve присвоила удачную студенческую механику, а в том, что компания наняла её авторов и помогла им превратить prototype в законченное произведение, где технология, обучение, юмор, пространство и сюжет говорят на одном языке.**

---

## 23. Team Fortress 2: девять лет не полировки, а последовательных превращений { #p023 }

Team Fortress 2 вышла в 2007 году — почти через девять лет после публичного появления ранней версии проекта. Эта цифра часто звучит как история о невероятно долгой доводке одного шедевра. На деле под названием TF2 последовательно существовали несколько очень разных игр. Финальная версия родилась не из бесконечного добавления возможностей, а из способности Valve выбрасывать целые направления, которые переставали соответствовать сущности Team Fortress.

### Brotherhood of Arms: серьёзная война вместо карикатуры

На E3 1999 Valve показывала **Team Fortress 2: Brotherhood of Arms**. Она должна была стать технологичной военной игрой с реалистичными солдатами, современным оружием и командной координацией. В материалах той эпохи фигурировали:

- отделения бойцов и роль командира;
- передача приказов между игроками;
- управляемые компьютером товарищи;
- голосовая коммуникация;
- десантирование;
- выразительная параметрическая анимация;
- поле боя, выглядевшее гораздо серьёзнее Team Fortress Classic.

Проект отвечал ожиданиям конца 1990-х: sequel должен был быть больше, реалистичнее и технологически убедительнее. Однако реализм плохо уживался с правилами самой Team Fortress. Серия строилась на предельно разных классах: один человек бежит быстрее всех, другой таскает пулемёт, третий строит автоматическую пушку, четвёртый маскируется под врага, а солдат взлетает на собственной ракете. В натуральных пропорциях и правдоподобной военной форме эти различия либо терялись, либо выглядели случайной нелепостью.

Проблема была не только эстетической. Реалистичный командный shooter обещает определённую логику мира: оружие примерно подчиняется физике, бойцы сопоставимы по возможностям, базы не строятся в нескольких десятках метров друг от друга, а хороший командир организует подчинённых. Team Fortress требует противоположного — мгновенно читаемых исключений и намеренно искусственных арен.

### Переход на Source не дал готового ответа

Разработка пережила смену технологии с GoldSrc на Source и несколько внутренних итераций. Публичная тишина не означала, что одна версия спокойно приближалась к релизу. Моби Франке позднее вспоминал, что к его приходу в Valve в 2002 году проект прошёл около четырёх художественных направлений. Среди известных экспериментов были более фантастические и научно-фантастические варианты, включая направление, обычно связываемое с названием **Invasion**.

Точные границы и длительность каждой внутренней версии восстановить трудно, поэтому не следует превращать отдельные concept images в полный производственный календарь. Надёжный вывод проще: к началу 2000-х Valve понимала, что старый military promise не приводит к цельной игре, но ещё не нашла форму, которая объясняла бы абсурдные классовые правила с первого взгляда.

Затяжная разработка TF2 отличается от обычного переноса даты. Здесь менялся сам ответ на вопросы «что это за мир?», «насколько серьёзно игрок должен его воспринимать?» и «почему девять настолько разных людей участвуют в одном бою?».

### Прорыв Моби Франке: стиль должен объяснять геймплей

Финальное направление возникло, когда художественная задача была сформулирована не как украшение, а как проблема читаемости. Моби Франке предложил персонажей с резко различающимися формами и преувеличенными пропорциями. Источником вдохновения стала американская коммерческая иллюстрация первой половины XX века — в материалах Valve упоминаются, в частности, Дж. К. Лейендекер, Дин Корнуэлл и Норман Роквелл.

Это не означало простое копирование «мультяшности». Valve строила отдельную визуальную систему:

- крупные массы важнее мелкой фактуры;
- силуэт класса должен узнаваться без текстур;
- верх тела получает больше контраста и значимых деталей;
- формы оружия подчёркивают роль владельца;
- RED и BLU различаются не одним оттенком формы, а согласованными палитрами окружения и персонажей;
- материалы выглядят нарисованными, но сохраняют объём и читаемость в движении;
- архитектура допускает театральную условность двух соседних баз.

Официальные художественные рекомендации TF2 позднее описывали мир как идеализированную Americana 1950–1960-х: не современный, не фотореалистичный и не бесконтрольно cartoon. Это важная граница. Стиль смешной, но дисциплинированный; преувеличение всегда служит идентификации.

### Силуэт является частью боевого интерфейса

В быстром multiplayer shooter игрок принимает решение за доли секунды. Он должен понять не только команду противника, но и класс, оружие, дистанционную угрозу и вероятное намерение. Если для этого приходится читать подпись над головой, визуальный дизайн уже опоздал.

TF2 начинает с gross shape:

- Heavy — огромный верх тела и масса пулемёта;
- Scout — тонкая фигура, лёгкая поза и быстрый ритм движения;
- Soldier — прямоугольный корпус и ракетница;
- Sniper — вытянутый силуэт и винтовка;
- Engineer — каска, компактность и рабочее снаряжение;
- Medic — длинный халат и характерный healing device;
- Spy — узкая фигура в костюме;
- Demoman — асимметрия, взрывчатка и бутылка;
- Pyro — закрытая маской фигура и широкий огнемёт.

По форме игрок уже получает данные о функции. Анимация усиливает разницу: класс не просто имеет другое количество здоровья, он стоит, бежит и держит оружие иначе. Поэтому графика TF2 стареет медленнее многих реалистичных игр своего времени. Она не пыталась выиграть соревнование по числу деталей; она оптимизировала изображение под человеческое распознавание.

### Девять классов стали девятью персонажами

Team Fortress Classic предлагала классы прежде всего как наборы характеристик. TF2 сохранила их системное ядро, но дала каждому голос, национальность-карикатуру, пластику, темперамент и собственную фантазию силы.

Heavy не просто медленный класс с большим запасом здоровья — он человек, искренне любящий оружие. Engineer не меню строительства — спокойный техасский мастер. Spy получает удовольствие от превосходства и унижения. Medic пугает тем, что научное любопытство у него сильнее этики. Даже команды реплик устроены не как нейтральные уведомления, а как столкновения личностей.

Серия роликов **Meet the Team** сделала эту конструкцию понятной за пределами самой игры. Каждый короткометражный фильм одновременно рекламировал класс, объяснял его роль и расширял характер. Valve не понадобилась традиционная campaign, чтобы создать запоминающийся ансамбль: механическая функция и комедийный образ поддерживали друг друга.

### Отказ от гранат показывает логику финальной игры

Обе команды в Team Fortress Classic имели доступ к общим ручным гранатам, а классы — к специальным. Для ветеранов это была существенная часть глубины. Но во время разработки TF2 Valve обнаружила, что универсальная граната слишком часто решает столкновение сильнее основного оружия и размывает классовые роли.

Гранаты также создавали другие проблемы:

- усиливали spam в узких проходах;
- позволяли разным классам отвечать на ситуацию одинаковым способом;
- увеличивали число смертей от угроз, которые трудно прочитать;
- затрудняли обучение новичка;
- мешали сделать основное оружие выразительным центром класса.

Удаление было не механическим упрощением ради массовой аудитории. Команда проверила, какие интересные возможности исчезли вместе с гранатами, и вернула необходимые функции другими средствами. Scout, например, получил двойной прыжок как ясный источник мобильности. Цель состояла в том, чтобы каждая способность усиливала identity конкретного класса, а не существовала как общий слой поверх всех девяти.

Так сформировалась мягкая система взаимных противодействий. У класса есть благоприятные и опасные встречи, но результат не определяется одним выбором на экране spawn. Aim, движение, позиция, знание карты, координация и использование особенностей оружия оставляют пространство для мастерства.

### «Мультяшность» была проверяемой гипотезой

Переход к финальному стилю не произошёл одним concept art. Команда делала prototypes и проверяла, выдерживает ли условный мир движение, освещение и бой. Среди экспериментов был вариант с ощущением stop-motion или clay animation. Он не стал финальной техникой, но помог подтвердить, что TF2 может отказаться от реализма и при этом остаться материальной, а не плоской комедией.

У Кирилла этот промежуточный образ вызывает ассоциацию с более поздней **Battlefield Heroes**. Это полезное визуальное сравнение, но не утверждение о копировании: проекты имеют собственные линии происхождения, а сходство объясняется общей задачей — сделать военный shooter доступным и читаемым через стилизацию.

### Возвращение в 2006 году и релиз в Orange Box

Когда Valve снова публично показала TF2 в 2006 году, контраст с Brotherhood of Arms был почти комическим. Вместо серьёзной армии зрители увидели гипертрофированных наёмников, яркие базы и насилие, поданное как slapstick. Однако за сменой тона скрывалась гораздо более строгая игра.

Финальная TF2 удержала фундамент Team Fortress:

- классовую асимметрию;
- зависимость от состава команды;
- высокую механическую планку отдельных ролей;
- rocket jumping и другие освоенные сообществом техники;
- Engineer buildings, disguises и healing;
- карты, создающие фронт и повторяемые командные ситуации.

Но теперь форма честно сообщала содержание. Мир не пытался объяснить, почему логика реальной войны нарушается каждую секунду. Он с самого начала объявлял себя театром наёмников, где условность — правило, а не ошибка.

Размещение в The Orange Box решило сразу несколько рисков. TF2 вернулась после многолетнего исчезновения не как одиночная ставка за полную цену, а как часть чрезвычайно сильного набора. Покупатели Half-Life и Portal наполнили серверы, а multiplayer придал всему package долговечность. Позднейшая сервисная и экономическая история TF2 относится к следующим пунктам; здесь важно зафиксировать, что в октябре 2007 года уже существовала законченная и узнаваемая основа.

### Что на самом деле доказывают девять лет

TF2 не является аргументом, что любая долгая разработка полезна. Девять лет означали потраченные версии, смену технологии, потерю публичной видимости и огромную цену возможностей. Большинство студий не могло бы так долго держать бренд без релиза.

Но история показывает другое качество Valve того периода: компания могла признать, что технически впечатляющий проект не нашёл identity, и не обязана была выпускать его только потому, что уже вложила годы. Парадоксально, но возможность многократно отменить неправильную TF2 в итоге спасла правильную. Позднее та же свобода всё чаще приводила не к новой форме, а к исчезновению игр; этот организационный предел будет разобран отдельно.

### Мнение Кирилла

Для Кирилла Team Fortress 2 — **шедевр и лучший командный shooter до Overwatch**. В игре проведено примерно 300 часов, и это один из немногих multiplayer-проектов, которые он действительно любит и глубоко уважает.

Особенно важен личный контекст примерно 2009–2010 годов. TF2 распространялась в Саратове через локальную или файлообменную сеть уже с накопившимися patches. Это была почти vanilla-версия: исходные классы, ясные карты и первые unlockable weapons, каждое из которых казалось огромным расширением игры. Шляпы, полноценная экономика Steam и позднейшая лавина предметов ещё не заслоняли первоначальную композицию.

Именно поэтому ранняя TF2 запомнилась не как бесконечный каталог контента, а как идеально различимый ансамбль:

- каждый класс меняет способ думать;
- мастерство ощущается телесно — в aim, movement, prediction и выборе позиции;
- командная зависимость не уничтожает личное выражение;
- юмор не отвлекает от механики, а делает её понятнее;
- визуальный стиль работает боевым интерфейсом;
- игра уважает повторение, потому что одна и та же карта порождает разные человеческие ситуации.

Главный итог:

> **Team Fortress 2 создавали девять лет не потому, что девять лет шлифовали один план. Она стала великой потому, что Valve несколько раз отказалась от неверной игры и в конце концов нашла форму, где карикатурное искусство, характеры и классовая механика объясняют друг друга.**

---

## 24. Left 4 Dead: как эксперимент Turtle Rock превратил сотрудничество в условие выживания { #p024 }

Left 4 Dead обычно воспринимается как одна из главных игр Valve, но её происхождение снова проходит через внешнюю команду. Основную концепцию разработала **Turtle Rock Studios** Майкла Бута — студия, уже тесно связанная с Counter-Strike. Valve помогла превратить prototype в законченный продукт, участвовала в производстве, дизайне, художественной постановке и доводке, а незадолго до релиза купила студию. Поэтому честная история требует не выбирать одного «настоящего автора», а разделить роли.

### Turtle Rock выросла рядом с Counter-Strike

До Left 4 Dead Turtle Rock работала над официальными ботами Counter-Strike, Counter-Strike: Condition Zero, Xbox-версией Counter-Strike, картами и другими задачами вокруг экосистемы Valve. Майкл Бут специализировался на AI и наблюдал не только за поведением компьютерных противников, но и за тем, почему матчи Counter-Strike остаются интересными после сотен повторений.

Counter-Strike не генерирует новые карты на каждом раунде. Повторяемость создают люди, неопределённость и смена темпа: ожидание контакта внезапно превращается в короткое насилие, после которого наступает новая пауза. Этот ритм стал одним из интеллектуальных источников Left 4 Dead. В кооперативной игре непредсказуемость людей-противников требовалось частично заменить системой.

### Terror-Strike: четыре игрока против массы ножевых ботов

Внутренний эксперимент, получивший название **Terror-Strike**, начался с простой перестройки Counter-Strike. Небольшая группа вооружённых игроков защищалась от огромного числа агрессивных ботов, которые пользовались ножами и давили количеством. В одной из известных версий команда устанавливала приманку на ночной cs_italy и затем переживала нападение.

Здесь ещё не было законченной Left 4 Dead, но уже находилась её важнейшая эмоция: несколько друзей удерживают линию против толпы, которая физически заполняет пространство. Огнестрельное оружие даёт людям локальное превосходство, а масса врагов не позволяет чувствовать абсолютный контроль.

Зомби-тема оказалась не просто модной оболочкой. Она объясняла поведение системы:

- противников может быть очень много;
- им допустимо атаковать примитивно и без самосохранения;
- одинаковая базовая толпа не требует сложной индивидуальной личности;
- заражённые могут появляться из тёмных проходов и окон;
- жанр допускает гротескных особых монстров;
- B-movie логика превращает ограничения AI в ожидаемое поведение орды.

Идея постепенно перешла от survival experiment к полноценному четырёхпользовательскому co-op shooter. Важнейшее решение состояло в том, что кооперация должна быть не рекомендацией и не бонусом к эффективности, а физической необходимостью.

### «Одиночки умирают» как центральный закон

Многие кооперативные игры позволяют четырём людям проходить рядом, оставаясь четырьмя самостоятельными героями. Left 4 Dead проектирует зависимость. Игрок может стрелять, двигаться и принимать решения сам, но определённые состояния невозможно снять без товарища.

Базовые системы поддерживают этот закон:

- упавшего Survivor поднимает другой игрок;
- лечение занимает время и может быть отдано товарищу;
- огонь по союзникам делает хаотическую стрельбу опасной;
- оружие и припасы распределены по маршруту;
- обзор одного человека не покрывает все направления;
- incapacitation превращает личную ошибку в общую задачу спасения;
- голосовые реплики персонажей автоматически передают важную информацию.

Игра не читает лекцию о командной работе. Она создаёт моменты, в которых помощь ощущается конкретным действием: вытащить захваченного, прикрыть лечащегося, вернуться за отставшим, отдать аптечку, закрыть спину во время волны.

### Special Infected — инструменты против плохого поведения

Обычная орда создаёт давление, но сама по себе может поощрять простую и устойчивую тактику: встать в удобной точке и непрерывно стрелять. Special Infected нарушают повторяемые решения. Каждый из них наказывает определённую привычку или перестраивает геометрию команды.

**Hunter** прыгает на жертву и полностью лишает её контроля. Он особенно опасен для игрока, который ушёл вперёд или отстал: освободиться самостоятельно нельзя.

**Smoker** вытягивает человека языком из построения, превращая дистанцию и линию видимости в угрозу. Команда должна быстро определить направление атаки и разорвать захват.

**Boomer** слаб в прямом бою, но его желчь ослепляет и привлекает орду. Он заставляет думать, когда и на какой дистанции стрелять. В ранних экспериментах роль менялась: существовали более прямолинейный взрывающийся вариант и Screamer, который убегал звать толпу. Playtests показали проблемы с обнаружением и пониманием, а функции были перераспределены в более читаемую конструкцию.

**Tank** ломает безопасную статичную позицию. Его запас здоровья и разрушительная сила вынуждают двигаться, распределять внимание и использовать пространство.

**Witch** создаёт не постоянную агрессию, а драматическое ожидание. Игроки слышат плач, ищут источник и договариваются, как пройти мимо или быстро уничтожить угрозу. Она превращает осторожность в командное событие.

Поэтому особые заражённые — не просто roster монстров с разными атаками. Это дизайн-критика поведения игроков. Они разделяют, ослепляют, вытесняют, останавливают и заставляют нарушать удобный план, после чего товарищи должны восстановить группу.

### AI Director управляет ритмом, а не читает мысли

Самым известным компонентом стала система **AI Director**. Её иногда описывают почти мистически: будто игра понимает психологию конкретного человека и сочиняет уникальный фильм. Реальность интереснее именно своей инженерной конкретностью.

Director наблюдает за состоянием Survivors и ходом прохождения, оценивает накопившееся давление, а затем регулирует процедурно размещаемые элементы. Он может влиять на время появления орды, обычных и особых заражённых, на периоды относительной тишины и на часть размещения припасов. Точный набор решений зависит от карты и правил режима, но общий принцип — управление **интенсивностью**.

Упрощённая драматическая кривая выглядит так:

```text
нарастание угрозы
        ↓
пик / крупная атака
        ↓
снижение давления
        ↓
передышка и ожидание
        ↓
новое нарастание
```

Если система всё время бросает максимум врагов, напряжение превращается в шум и усталость. Если атаки полностью предсказуемы, игрок запоминает сценарий. Director создаёт промежуточную форму: уровень и ключевые события спроектированы людьми, но точное заполнение маршрута и темп не повторяются буквально.

Это не procedural level generation. Улицы, комнаты, choke points, safe rooms, финалы и пространственные истории остаются authored content. Процедурность действует внутри дизайнерских ограничений и меняет постановку столкновений. Поэтому кампания сохраняет режиссуру, но не превращается после первого прохождения в выученный тир.

### Режиссура без традиционного сюжета

Название отсылает к кинематографическому обозначению оставшегося за кадром пространства, а четыре кампании оформлены как horror movies — с постерами, названиями и финальными титрами. Но Left 4 Dead почти не рассказывает заранее написанную историю через длинные сцены.

Вместо этого она создаёт **анекдоты прохождения**:

- игрока утаскивают в момент, когда остальные уже прыгнули вниз;
- случайно потревоженная Witch разрушает спокойный план;
- Tank появляется в неудобной геометрии;
- последний живой участник возвращается и поднимает команду;
- пустой коридор оказывается страшнее предыдущей орды, потому что все ждут следующего пика.

Director не пишет сюжет в литературном смысле. Он распределяет условия, в которых люди сами производят драму. В этом Left 4 Dead соединяет авторскую режиссуру Valve с неповторимостью multiplayer: карта задаёт форму фильма, система меняет монтаж напряжения, а игроки исполняют роли.

### Valve и Turtle Rock: совместный продукт, а не удобная легенда

Ядро проекта, Terror-Strike и исходная AI-архитектура возникли в Turtle Rock под руководством Майкла Бута. Это нельзя растворять в общей формуле «Valve придумала Left 4 Dead». Одновременно финальная игра не была независимо закончена Turtle Rock и только издана чужим логотипом.

Valve включилась в разработку задолго до релиза. Сотрудники компаний совместно работали над pacing, уровнями, персонажами, текстом, визуальным стилем, технологией Source, playtesting и доводкой. Авторы Valve, в том числе Чет Фалижек, помогали продвигать и оформлять проект внутри компании. В результате Left 4 Dead несёт характерные черты обоих коллективов: AI-centric concept Turtle Rock и производственную культуру Valve, построенную на наблюдении за игроком и непрерывной переработке.

10 января 2008 года Valve официально объявила о покупке Turtle Rock. Студия в Южной Калифорнии стала расширением компании, известным как **Valve South**. В пресс-релизе Valve прямо связывала решение с Left 4 Dead, многолетними отношениями команд и желанием получить базу для разработки в районе Лос-Анджелеса.

Организационно союз оказался сложнее творческого. Между Orange County и Bellevue существовала физическая дистанция, а культура Valve исторически тяготела к тесному личному взаимодействию и свободному перемещению людей между проектами. После выпуска структура Valve South распалась: часть сотрудников перешла в Bellevue или осталась с Valve, другие вернулись к независимой Turtle Rock. Это не отменяет совместного авторства первой игры, но объясняет, почему название студии исчезло из следующего релиза.

### Почему повторяемость не требует loot treadmill

В первой Left 4 Dead сравнительно мало campaign content и нет бесконечного дерева предметов. Долговечность строится на комбинации:

- человеческого поведения трёх товарищей;
- непостоянного размещения угроз;
- меняющегося ритма Director;
- нескольких уровней сложности;
- режимов co-op и Versus;
- специальных заражённых, создающих комбинации ситуаций;
- коротких, хорошо запоминаемых кампаний.

Игрок возвращается не ради увеличения числа у оружия, а ради новой версии знакомого маршрута и совершенствования группового поведения. Знание карты помогает, но не снимает напряжение: оно освобождает внимание для реакции на то, как именно система и люди изменили этот заход.

Игра также уважает время за счёт структуры. Кампания поделена safe rooms, правила объясняются действием, а смерть редко требует повторять много одиночного narrative content. Даже поражение создаёт историю о том, в какой момент команда развалилась.

### Мнение Кирилла

Первая Left 4 Dead — **«охуенная игра»**. Кирилл проходил её в кооперативе на пиратской копии, и именно совместное прохождение соответствует её настоящей форме: это не shooter с необязательными попутчиками, а машина коллективных историй.

Первая часть кажется темнее, сдержаннее и ближе к horror. Она меньше перегружена комедийными красками и потому особенно хорошо удерживает ощущение ночного пути через уже погибший мир. Left 4 Dead 2 для Кирилла эмоционально важнее и полнее раскрывает формулу, но её расширения, конфликт вокруг быстрого sequel и конкретные нововведения относятся к следующему пункту.

Ценность оригинала в чистоте первой формулировки:

- сотрудничество встроено в уязвимость тела;
- каждый особый враг проверяет командную дисциплину;
- Director поддерживает ритм, не подменяя level design;
- знакомая карта не превращается в полностью предсказуемый сценарий;
- horror рождается из ожидания и риска потерять людей, а не только из декораций;
- короткая кампания сохраняет высокую плотность решений.

Главный итог:

> **Left 4 Dead родилась из AI-эксперимента Turtle Rock, а стала классикой благодаря точной формуле совместной зависимости: authored maps задают путь, Director меняет напряжение, Special Infected разрывают плохие построения, а настоящую драму каждый раз создают четыре человека.**

---
## 25. Left 4 Dead 2: великий сиквел, который Valve выпустила слишком быстро для доверия собственной аудитории { #p025 }

Left 4 Dead 2 анонсировали 1 июня 2009 года на E3, а выпустили 17 ноября — почти ровно через год после первой игры. Для обычной ежегодной серии такой интервал не выглядел бы необычным. Для Valve, приучившей аудиторию к долгим циклам Half-Life и бесплатным обновлениям Team Fortress 2, решение прозвучало как нарушение только что сформированного общественного договора.

Парадокс L4D2 состоит в том, что обе стороны спора имели серьёзные основания. Игроки справедливо подозревали, что первую игру слишком быстро заменяют новым товаром. Valve действительно создала не набор из нескольких карт, а значительно более широкую и технологически связанную версию формулы. Качество результата не отменяет проблемы доверия, а справедливость бойкота не превращает сиквел в ленивый expansion.

### Valve сама создала ожидание бесплатной поддержки

К 2009 году Team Fortress 2 уже показывала новую модель отношений с PC-аудиторией. Купленная игра продолжала получать карты, режимы, достижения и оружие. Left 4 Dead была особенно подходящим кандидатом для такого развития: её кампании рассчитаны на повторение, Director меняет прохождения, а новый content естественно добавляется поверх существующей основы.

После релиза первой игры Valve говорила о поддержке и выпустила Survival Pack. Но не успела пройти даже половина года, когда аудитории предложили покупать новую номерную часть. Отсюда выросла логичная цепочка подозрений:

- обещанная поддержка L4D1 могла быть свёрнута;
- новая игра разделит matchmaking и сообщество;
- пять кампаний, оружие и заражённые выглядят как возможный крупный DLC;
- покупатели первой части заплатили за продукт с очень коротким периодом актуальности;
- успех TF2 уже доказал, что Valve технически умеет расширять multiplayer-игру бесплатно.

Так появился организованный **L4D2 Boycott**. Его декларации касались не только цены, но и поведения компании: участники требовали выполнить обещания по первой части и объяснить, почему новый материал нельзя доставить прежним владельцам как обновление.

Важно не высмеивать протест задним числом. Сегодня L4D2 продаётся дёшево, включает почти всё наследие первой игры и воспринимается как очевидная окончательная версия. Летом 2009 года игроки не могли знать, что именно получат. Они видели известный publisher pattern: быстро объявить sequel и оставить предыдущую аудиторию позади.

### Почему Valve выбрала отдельную игру

Объяснение компании сводилось не к одной причине. Команда одновременно разрабатывала новых заражённых, оружие, персонажей, кампании, события и более гибкий Director. Эти элементы зависели друг от друга: нельзя было просто выпустить Charger отдельно, не перестроив карты и столкновения под создаваемое им перемещение; новые возможности Director требовали иных level-design assumptions; melee меняло плотность и поведение орды.

Разработчики также говорили о техническом состоянии первой игры. В поздней ретроспективе Чет Фалижек описывал L4D1 как поспешно доведённую и тяжёлую для дальнейшего исправления codebase. Это свидетельство участника, данное спустя годы, а не исчерпывающий независимый аудит. Но оно помогает понять, почему внутри Valve отдельный executable казался не только коммерческим выбором, но и способом свободно изменить фундамент.

Логика была такой:

```text
не набор независимых добавок
↓
связанный пакет новых правил
↓
карты проектируются под них заново
↓
отдельная игра кажется команде честнее
и технически безопаснее
```

Проблема заключалась не в отсутствии у Valve причин, а в том, что компания плохо подготовила аудиторию к столь резкой смене модели. На месте привычного длинного молчания Valve возник противоположный шок: продолжение появилось быстрее, чем сообщество успело почувствовать завершённость оригинала.

### Новые Special Infected отвечают на мету первой игры

Опытные команды L4D1 научились стабилизировать столкновения. Они держались плотной группой, занимали угол или дверной проём, прикрывали ограниченное число направлений и быстро освобождали захваченного. Новые заражённые были спроектированы как ответы на эту дисциплину.

**Charger** пробивает строй, хватает одного Survivor и уносит его от остальных. Он превращает геометрию длинного коридора, балкона или опасного края в оружие.

**Spitter** покрывает область кислотой. Там, где раньше четыре игрока могли безопасно стоять почти в одной точке, теперь требуется немедленно разойтись. Особенно сильна комбинация с врагом, который временно удерживает человека на месте.

**Jockey** забирается на Survivor и направляет его движение. Он не просто наносит урон, а заставляет команду догонять человека, которого ведут к огню, кислоте, краю или остальным заражённым.

Новые Specials не заменяют старых. Их ценность появляется в комбинациях: Smoker вытягивает, Spitter закрывает путь спасения, Charger разрывает строй, Boomer создаёт визуальный шум, Hunter фиксирует отделившегося. В Versus это превращает команду заражённых из набора отдельных атакующих в асимметрическую систему координации.

### Melee меняет телесное ощущение формулы

Ближнее оружие — не просто ещё одна категория damage. Сковорода, топор, мачете, катана или бензопила заставляют игрока сознательно входить в опасную дистанцию. Стрельба прореживает толпу заранее; melee создаёт ритм шага, удара, отталкивания и движения сквозь массу тел.

Это усиливает физическую комедию и делает окружение предметнее. Оружие соответствует дороге через американский Юг: найденный пожарный топор или сковорода выглядят частью места, а не абстрактным уровнем редкости. При этом слот melee означает отказ от второго огнестрельного оружия, то есть выразительность оплачивается тактическим ограничением.

### Uncommon Common и идентичность кампаний

В первой игре обычные заражённые в основном образуют универсальную массу. L4D2 вводит локальные варианты, связанные с окружением: защищённых экипировкой представителей служб, заражённых работников и другие типы, чьи свойства требуют небольшого изменения поведения.

Они находятся между обычной ордой и Special Infected. Не требуют полноценной командной операции, но не позволяют стрелять во всё одинаково. Главное — кампании получают механическую память. Игрок различает места не только по декорации, но и по тому, какое исключение из базовых правил здесь встречается.

### Пять кампаний образуют дорожное путешествие

L4D2 переносит действие из холодного северо-восточного horror первой части на американский Юг — от Savannah к Новому Орлеану. Кампании воспринимаются не просто как отдельные фильмы, а как последовательный маршрут одной группы.

Смена региона расширяет тональность:

- дневной свет не отменяет опасность, а делает разрушение более открытым;
- болота замедляют обзор и движение;
- ярмарка Dark Carnival сталкивает праздничную искусственность с катастрофой;
- проливной дождь превращается в динамическое препятствие;
- городские и промышленные пространства дают разные формы финалов;
- возвращение через уже пройденную местность позволяет самой карте стать частью задачи.

Новые Survivors заметнее разговаривают друг с другом и формируют внутреннюю динамику. Coach, Nick, Rochelle и Ellis не нуждаются в длинных биографических сценах: характеры проявляются в автоматических репликах, реакциях на окружение и повторяемых трениях. Особенно Ellis превращает дорогу в источник бесконечных историй, которые остальные не обязательно хотят слушать.

### Director 2.0 меняет не только количество врагов

В первой L4D Director прежде всего управлял интенсивностью и наполнением authored route. Вторая игра расширяет возможный набор воздействий. Официальное описание подчёркивало изменение погоды, элементов мира и отдельных путей наряду с адаптацией к состоянию игроков.

Это видно в кампаниях, построенных вокруг переменного события. Ливень может резко лишить видимости и звука; маршрут или расположение объектов меняют конкретную форму знакомой сцены; gauntlet finale требует двигаться вперёд, а не оборонять одну точку до прибытия спасения.

Director 2.0 всё ещё не сочиняет уровень из пустоты. Дизайнер заранее создаёт допустимые ветви, пространства и события. Система выбирает и регулирует внутри этих границ. Поэтому удачная непредсказуемость остаётся результатом совместной работы алгоритма и level designer, а не магического procedural storytelling.

### Scavenge и расширение соревновательной формулы

Режим **Scavenge** сжимает асимметрию Versus до короткой борьбы за канистры с топливом. Survivors должны выносить их к генератору, а заражённые — срывать темп и использовать открытость переносчика. Ограниченное время и видимый прогресс делают матч понятнее зрителю и создают постоянное решение: нести добычу сейчас, бросить её ради спасения или рискнуть более дальним маршрутом.

L4D2 в целом разнообразнее организует финалы. Вместо постоянного «закройтесь и ждите» появляются перемещение через орду, сбор ресурсов и другие сценарии, которые не позволяют одной оборонительной привычке доминировать во всей игре.

### Поездка лидеров бойкота в Bellevue

Valve пригласила двух организаторов бойкота в свой офис, оплатила поездку и дала им сыграть в незавершённую L4D2. После демонстрации они признали, что масштаб изменений больше, чем ожидалось, хотя не отказались от всех претензий к поддержке первой части.

Часть сообщества немедленно стала подозревать, что лидеров «купили» гостеприимством. Эпизод показателен в обе стороны. Valve выбрала прямой разговор и доступ к продукту вместо обычного пресс-релиза. Но личная поездка нескольких представителей не могла автоматически разрешить коллективный вопрос о цене, доверии и будущем L4D1.

Сам boycott постепенно потерял силу, а многие его участники всё равно купили игру. Это не обязательно доказывает лицемерие: протест мог быть предупреждением компании, а качество готового продукта — отдельным решением покупателя.

### Первая игра не исчезла сразу, но центром стала вторая

L4D1 получила Survival Pack, Crash Course, исправления и позднейший дополнительный content. Valve не отключила её на следующий день после анонса продолжения. Однако исторический центр серии действительно переместился в L4D2.

Со временем вторая часть получила кампании и персонажей первой, а также общую инфраструктуру пользовательского контента. Для современного игрока L4D2 стала почти антологией обеих игр. Практическая щедрость позднего состояния не меняет того, что первоначальным владельцам пришлось заплатить второй раз, чтобы перейти на долгосрочную платформу.

### Почему наследникам трудно повторить чистоту L4D2

Успех игры породил целое семейство четырёхпользовательских co-op action games. Многие наследники добавляют классы, редкость экипировки, карты способностей, постоянную progression и сборки. Эти системы создают долгосрочные цели, но могут сместить внимание с конкретной миссии на подготовительную бухгалтерию.

**Back 4 Blood**, созданная поздней Turtle Rock, ближе всего заявляла прямое родство, но cards, builds и meta-progression сделали её другим опытом. Игрок оценивает не только пространство, команду и текущую угрозу, но и длинный слой числовой подготовки.

**Vermintide 2** для Кирилла — более убедительный наследник: у неё есть собственная melee-идентичность и более тяжёлая progression, но давление группы и необходимость взаимного спасения сохраняют понятное родство с L4D.

### Мнение Кирилла

На релизе Кирилл почти не ощущал boycott: игра шла на пиратке, появилась вторая часть, она была очевидно богаче, и можно было просто перейти.

Как игра **Left 4 Dead 2 — любимая co-op игра Кирилла для прохождения миссий и недостижимый стандарт жанра**. В ней нет тонны builds, MMO-бухгалтерии, карточек и loot score. Роли возникают из ситуации: кто прикрывает, кто несёт предмет, кто спасает, кто первым замечает комбинацию заражённых.

Как бизнес-решение полноценный sequel через год после service-like первой игры всё равно выглядит как:

> **плевок покупателям L4D1.**

Обе оценки существуют одновременно. Великолепный продукт не обязан быть образцом корректного обращения с ранней аудиторией.

Примерно в 2017 году Кирилл пытался вернуться в online и Versus, но столкнулся с veterancy gap. Долгоживущие серверы заполнены людьми, знающими каждый choke point, timing, spawn spot и оптимальный маршрут. Система, которая десятилетиями вознаграждает знание, одновременно делает вход вернувшегося игрока болезненным.

Главный итог:

> **Left 4 Dead 2 довела исходную формулу почти до совершенства, потому что каждый новый заражённый, предмет и тип события отвечал на реальное поведение игроков. Но именно полнота сиквела сделала страх владельцев L4D1 обоснованным: новая игра действительно стала платформой, которая почти заменила купленный годом ранее оригинал.**

---

## 26. Portal 2: как расширить идеальную маленькую игру и не уничтожить её чистоту { #p026 }

Portal закончилась настолько точно, что продолжение выглядело опасной идеей. Простое увеличение числа камер могло превратить неожиданное произведение в набор более сложных головоломок. Добавление обычного экшена разрушило бы уникальную механику. Повтор прежнего сюжета обманул бы игрока, уже знающего ложь GLaDOS и устройство Aperture.

Portal 2 стала примером правильного sequel design не потому, что буквально сохранила минимализм оригинала. Она выбрала другое решение: оставить portals грамматическим центром, а вокруг них расширить пространство, персонажей, историю и набор физических систем.

### Сначала Valve попыталась сделать Portal без порталов

Команда сознательно не хотела выпускать «ещё двадцать test chambers». Одно из ранних направлений называлось **F-Stop**. Оно происходило в Aperture, но не использовало portal gun, Челл и привычную структуру отношений с GLaDOS. Основой была другая пространственная механика, долгое время не раскрывавшаяся публично.

Эксперимент был не бессмысленным. Он доказывал, что Aperture Science может существовать как более широкая вселенная странных испытательных технологий. Но playtesting обнаружил разрыв между внутренним интересом команды и ожиданием аудитории. Людям могла нравиться новая головоломка, однако название Portal обещало им действие с порталами.

Это важный урок: хороший prototype ещё не обязательно является правильным продолжением конкретной игры. Brand identity здесь не маркетинговая наклейка, а освоенный игроком способ думать. Valve отказалась от значительной работы и вернула portal gun в центр.

История демонстрирует полезную сторону anti-sunk-cost культуры компании. Но она также показывает цену полной свободы: год экспериментов мог исчезнуть, а разработке требовалось заново найти структуру. В данном случае перезапуск привёл к релизу; во многих последующих проектах Valve подобные повороты завершались отменой.

### Принцип расширения: новые системы должны проходить через portals

Финальная Portal 2 не заменяет базовую механику набором гаджетов. Большинство новых элементов создаёт поток, поверхность или траекторию, которую игрок затем связывает порталами.

**Thermal Discouragement Beams** продолжают идею перенаправляемой энергии, но делают путь луча визуально непрерывным и пригодным для более сложных комбинаций.

**Hard Light Bridges** превращают свет в поверхность. Портал переносит не только игрока, но и направление стены, пола или укрытия.

**Aerial Faith Plates** задают заранее читаемый импульс и позволяют строить последовательности полёта без необходимости каждый раз создавать огромную шахту.

**Excursion Funnels** переносят игрока и предметы вдоль видимого потока. Смена направления превращает их в управляемую транспортную систему.

Каждый элемент достаточно прост для отдельного понимания. Сложность появляется из композиции: куда провести мост, где перехватить funnel, когда изменить направление луча и какую поверхность отдать одному из двух цветов.

### Gels: вторая студенческая идея внутри Portal

Repulsion, Propulsion и Conversion Gel происходят из студенческого проекта DigiPen **Tag: The Power of Paint**. В Tag игрок сам стрелял краской, изменяющей свойства поверхности. Valve пригласила авторов проекта и адаптировала систему для Portal 2, повторив модель найма команды Narbacular Drop.

Ключевое слово — адаптировала. Если оставить самостоятельный paint gun, игрок решает задачу краской параллельно portal gun. В Portal 2 гели обычно поступают из труб, а игрок направляет их порталами. Новая система становится содержанием, которое переносит старая грамматика.

- синий Repulsion Gel заставляет поверхность отбрасывать;
- оранжевый Propulsion Gel ускоряет движение;
- белый Conversion Gel создаёт portalable surface там, где её прежде не было.

Существовал и Adhesion Gel, позволявший держаться на стенах и потолке, но он создавал проблемы с ориентацией и вызывал у playtesters дискомфорт. Удаление показывает границу сложности: механика может быть оригинальной, но если игрок теряет устойчивое ощущение «где низ», пространственная задача превращается в борьбу с камерой.

### Масштаб Aperture становится историей компании

Первая Portal намеренно показывает узкую поверхность комплекса и короткий backstage. Продолжение делает само здание главным персонажем. Челл просыпается в разрушенной современной Aperture, падает в гигантские старые уровни, проходит через несколько исторических эпох и затем возвращается к современным лабораториям.

Изменение архитектуры рассказывает историю без отдельной энциклопедии:

- ранняя Aperture занимает огромные подземные пространства и мыслит индустриальным оптимизмом;
- очередная эпоха перекрашивает старую инфраструктуру, но не исправляет безумную экономику экспериментов;
- поздняя компания беднеет, импровизирует и всё настойчивее использует людей как расходный материал;
- современный комплекс автоматизирован настолько, что продолжает существовать после исчезновения нормальной организации.

Визуальная смена бетона, металла, офисных вывесок, тестовых сфер и белых панелей делает chronology физическим маршрутом. Игрок буквально поднимается через историю корпорации.

### Cave Johnson существует через записи и последствия

Джей Кей Симмонс озвучивает Cave Johnson как предпринимателя, чья уверенность не уменьшается вместе с компетентностью компании. Игрок никогда не встречает его живым. Он слышит заранее записанные обращения, рассчитанные на давно исчезнувших испытуемых, и одновременно видит материальные последствия решений.

Такой способ подачи экономен, но не ощущается дешёвым. Запись не требует остановить игру и телепортировать героя в flashback. Реплика Cave соответствует конкретной эпохе окружения, а постепенное ухудшение его голоса и положения Aperture создаёт драматическую дугу.

История Caroline добавляет личное измерение. GLaDOS перестаёт быть просто неизвестным компьютером: за её голосом обнаруживается насильственно сохранённая связь с прежней организацией. Игра не превращает это в полное оправдание антагониста, но делает её идентичность трагичнее и сложнее.

### Wheatley меняет конфигурацию знакомых ролей

В начале Wheatley кажется безопасным comic companion. Стивен Мерчант придаёт ему нервозность, говорливость и желание казаться полезным. Он помогает Челл двигаться через разрушенный комплекс и выглядит противоположностью холодной GLaDOS.

После смены власти роли переворачиваются. Wheatley получает огромную систему, но не способность ею управлять; GLaDOS оказывается запертой в potato battery и вынуждена сопровождать Челл. Это не простая мораль «власть развращает умного». Wheatley одновременно некомпетентен, обижен и зависим от встроенной потребности системы проводить тесты.

Portal 2 избегает прямого повторения первой игры:

- GLaDOS вновь опасна, но временно становится союзником;
- новый помощник оказывается новым управляющим;
- тестовые камеры превращаются в импровизацию разрушающегося комплекса;
- возвращение к испытаниям имеет другую мотивацию и темп.

### Комедия встроена в технический ритм

Portal 2 заметно разговорчивее первой части. Это риск: шутки могли подавить одиночество и чистоту оригинала. Игра компенсирует его точным пространственным timing. Реплики запускаются во время перемещения, ожидания механизма или осмотра нового пространства; персонажи реагируют на действия, а не требуют отдельного диалогового режима.

Юмор также различает голоса. Cave продаёт катастрофу как корпоративное достижение. Wheatley маскирует неуверенность потоком слов. GLaDOS наносит точные личные уколы и почти никогда не признаёт эмоциональную зависимость. Даже announcer демонстрирует бюрократическое спокойствие системы, которая продолжает процедуры во время полного разрушения.

### Co-op требует не второго тела, а четырёх порталов

Отдельная кампания Atlas и P-body решает фундаментальную проблему совместной puzzle game. Если один игрок способен выполнить всё своими двумя порталами, второй становится наблюдателем или дополнительной рукой. Хорошая co-op chamber требует цепочки из четырёх порталов, одновременных действий или разделения ролей.

Координация сама становится механикой:

- один игрок создаёт траекторию, по которой летит другой;
- партнёры меняют portal links в определённой последовательности;
- кнопки, funnels и bridges требуют синхронизации;
- ошибка одного робота часто физически видна второму;
- жесты и high-five превращают паузы в отношения персонажей.

Ping system решает реальную коммуникационную проблему. Фраза «поставь портал туда, слева от той штуки» почти бесполезна в сложном трёхмерном пространстве. Маркер позволяет указать поверхность, подтвердить план и обучать партнёра без обязательного голоса. Интерфейс не просто обслуживает co-op, а делает совместное мышление возможным.

GLaDOS использует двух роботов для новой формы манипуляции: хвалит одного, унижает другого, намекает на секреты и пытается создать ревность. Так даже отдельная campaign сохраняет единство механики и характера.

### Финальный выстрел в Луну подготовлен правилами

Кульминация кажется намеренно абсурдной: Челл стреляет порталом в Луну. Но шутка работает как честный payoff.

Игра заранее сообщает, что Conversion Gel изготовлен из лунного материала и создаёт поверхность для порталов. Показывает почти неограниченную дальность связи, если поверхность видима. Приучает искать белое пятно в критический момент. Поэтому игрок самостоятельно совершает невозможное действие по уже изученному правилу.

Это важное отличие от cutscene, в которой герой внезапно применяет неизвестную способность. Portal 2 даёт игроку самому нажать кнопку и завершить сюжет решением головоломки. Космический climax остаётся частью gameplay language.

После победы GLaDOS отпускает Челл не из внезапной доброты, а потому что отношения стали для неё опаснее и сложнее продолжения теста. Финальная песня **Want You Gone** отвечает Still Alive: GLaDOS снова пытается оформить эмоциональное поражение как рациональное освобождение от проблемы.

### Продолжение не делает оригинал черновиком

Portal 2 больше почти во всём: продолжительнее, дороже, разнообразнее, населённее, технически богаче. Но она не заменяет первую часть. Для понимания отношений с GLaDOS и эффекта побега важна исходная компактность; sequel строит удовольствие на уже существующей памяти игрока.

Это один из лучших вариантов продолжения: не объявить предыдущую игру неполной, а исследовать то, что она сознательно оставила за границей. Portal остаётся идеальной камерной пьесой, Portal 2 становится большим путешествием через историю того же пространства.

### Мнение Кирилла

**Portal 2 — грамотный сиквел и шедевр.** Особенно ценны GLaDOS, история, постановка, Cave Johnson, Old Aperture, новые механики и полноценная co-op campaign.

Но Portal 1 остаётся для Кирилла абсолютной вершиной Valve:

```text
Portal 1
= идеальная маленькая игра

Portal 2
= идеальное расширение,
которое не делает первую ненужной
```

Вторая часть сознательно жертвует частью одиночества и стерильной концентрации ради масштаба, ансамбля персонажей и исторического слоя. Это не улучшенная замена, а другой тип совершенства.

Главный итог:

> **Portal 2 спасла себя дважды: сначала Valve отказалась от интересной, но неверной идеи Portal без порталов, затем встроила каждую крупную новинку — гели, мосты, funnels, co-op и историю Aperture — вокруг уже знакомого пространственного языка. Поэтому продолжение расширяет оригинал, а не объясняет, что тот был недостаточно большим.**

---

## 27. Dota 2 и IceFrog: как Valve превратила общественный мод в глобальную соревновательную платформу { #p027 }

Dota 2 — ещё один случай, когда Valve не изобретает центральную игру внутри собственного офиса. Как с Team Fortress и Counter-Strike, она замечает сложившуюся community-систему и приглашает человека, которому сообщество доверяет её развитие. Но масштаб и юридическая неоднозначность DotA были гораздо больше: это уже не один мод с легко определяемой командой, а многолетняя цепочка карт, авторов, сайтов, версий и заимствованных Warcraft III assets.

Главным приобретением Valve стал не абстрактный жанр MOBA и не одна карта. Компания получила **IceFrog — действующего хранителя живого баланса**, способного провести систему из модификации чужой RTS в самостоятельный продукт.

### Генеалогия сложнее имени одного автора

Упрощённая линия выглядит так:

```text
Aeon of Strife в StarCraft
↓
Defense of the Ancients Эула в Warcraft III
↓
множество ответвлений и DotA Allstars
↓
Guinsoo объединяет популярных героев и версии
↓
IceFrog принимает долгосрочное развитие Allstars
↓
Valve нанимает IceFrog
↓
Dota 2
```

**IceFrog не создал первую DotA.** Эул заложил раннюю Warcraft III-версию, Стив «Guinsoo» Фик и другие участники развивали Allstars, сообщество тестировало комбинации, распространяло карту и формировало competitive knowledge. Даже название описывает традицию, а не единоличное произведение.

Ценность IceFrog состояла в stewardship. Он выпускал версии, менял героев и предметы, реагировал на competitive play и сохранял ощущение непрерывности между обновлениями. В игре с огромным числом взаимодействий баланс не является таблицей, которую однажды можно закончить. Это длительное управление экосистемой, где слишком резкая правка способна уничтожить доверие, а слишком осторожная — законсервировать мету.

### Blizzard создала среду, но не закрепила жанр за собой

DotA существовала благодаря Warcraft III: World Editor, сетевой инфраструктуре Battle.net, моделям, звукам, персонажам и правилам базовой RTS. Однако карта не была официальным продуктом Blizzard. Пользовательские авторы свободно сменяли друг друга, а популярность росла быстрее, чем издатель формировал собственный коммерческий ответ.

В результате люди, лучше всего понимавшие новую игру, разошлись к конкурентам:

- Guinsoo оказался в Riot Games и работал над League of Legends;
- IceFrog пришёл в Valve и возглавил переход к Dota 2.

Blizzard владела технологической и культурной почвой, но не отношениями с конкретными хранителями дизайна. Для Кирилла это один из самых очевидных стратегических промахов компании: гигантский новый жанр вырос буквально внутри её редактора, а два важнейших направления коммерциализации построили другие фирмы.

### Найм IceFrog вместо производства «своего клона»

Сотрудники Valve сами играли в DotA и понимали, что её аудитория ценит не только общую формулу «две команды ведут героев по линиям». Значение имеют тысячи конкретных решений: скорость поворота, длительность stun, fog, elevation, deny, способ сборки предметов, timing появления существ и неожиданные комбинации способностей.

В 2009 году IceFrog сообщил, что присоединился к Valve. Официальный анонс Dota 2 последовал 13 октября 2010 года и прямо представлял проект как его новую работу. Этот framing был критически важен. Valve говорила существующим игрокам не «мы сейчас улучшим ваш старый мод», а «человек, которому вы уже доверяли обновления, продолжает систему с ресурсами полноценной студии».

Такой ход агрессивен: частная компания присваивает коммерческий центр community phenomenon. Но он гораздо уважительнее механически, чем попытка скопировать внешние признаки и упростить всё для воображаемой массовой аудитории.

### Dota 2 сначала сохраняет странности, а потом улучшает оболочку

Valve не стала немедленно очищать DotA от накопленных исключений. В Dota 2 сохранились:

- last hits и denies;
- потеря золота после смерти;
- high ground и fog of war;
- lanes, jungle и работа с волнами creeps;
- сложные item recipes;
- разные типы disable и immunity;
- hero matchups, зависящие от точных timings;
- механики, которые новичку кажутся архаичными или необъяснимыми.

Не каждое старое правило священно, и Dota 2 позднее серьёзно менялась. Но стартовый принцип был консервативным: если взаимодействие выжило годы коллективного отбора, сначала следует понять его функцию, а не удалять ради внешней чистоты.

Основные ранние улучшения происходили вокруг матча:

- стабильный самостоятельный клиент вместо запуска пользовательской карты Warcraft III;
- matchmaking и reconnect;
- наблюдение за играми внутри клиента;
- голосовая и текстовая коммуникация;
- replays;
- bots и practice;
- coaching;
- guides и build suggestions;
- единая Steam identity;
- инфраструктура для турниров и broadcast.

Это характерная сила Valve. Компания не обязана была лучше IceFrog понимать каждый hero matchup. Она умела строить Source-клиент, сетевые сервисы, распространение, spectator tools и продуктовую оболочку, которых мод не мог получить в прежней среде.

### Перерождение героев без Warcraft assets

Механические роли требовалось сохранить узнаваемыми, но визуальный и юридический слой принадлежал миру Warcraft. Поэтому Dota 2 создаёт собственные модели, названия, голоса и fiction, оставляя знакомую функцию.

Для ветерана соответствия были очевидны: новый герой мог быть юридически самостоятельным, но занимать место старого образа в системе matchups. Это породило странное ощущение одновременно новой дорогой игры и максимально верного переноса.

Задача была сложнее reskin. В Warcraft III персонажи использовали уже знакомые расы и силуэты Blizzard. Valve требовалось сделать более сотни способностей визуально различимыми, сохранить читаемость массового боя и построить мир, который не выглядел случайной коллекцией заменённых имён.

### Конфликт за DOTA показывает неопределённость community-авторства

В 2010 году Valve подала заявку на регистрацию DOTA как товарного знака. Blizzard возразила: имя выросло внутри Warcraft III community, многие элементы истории были связаны с её платформой, а связанные с DotA-Allstars права переходили между организациями.

Спор не завершился судебным решением о том, кто «создал жанр». В 2012 году компании заключили соглашение. Valve сохранила коммерческое использование DOTA для самостоятельной игры. Blizzard могла использовать название в определённых некоммерческих community-контекстах, а её собственный коммерческий проект перестал называться Blizzard DOTA, прошёл через имя Blizzard All-Stars и в итоге стал Heroes of the Storm.

Этот эпизод нельзя свести к формуле «Valve украла карту» или «Blizzard всё упустила и не имела прав». Разные слои принадлежности расходились:

- движок и исходные assets были Blizzard;
- конкретные версии карты делали разные community-авторы;
- баланс и актуальную линию Allstars вёл IceFrog;
- название приобрело значение через миллионы игроков;
- самостоятельный коммерческий продукт финансировала и выпускала Valve.

Юридическое соглашение закрепило практический компромисс, но философский вопрос о приватизации community culture никуда не исчез.

### The International 2011 был одновременно анонсом масштаба и испытанием

Первый публичный показ Dota 2 состоялся не через спокойную demo для прессы. На Gamescom в августе 2011 года Valve провела **The International**: шестнадцать сильных команд сыграли в ещё не выпущенную игру, а победителю предназначался миллион долларов.

Для esports того времени сумма была шокирующей. Но турнир решал больше рекламной задачи:

- доказывал ветеранам, что Dota 2 сохраняет достаточную глубину для профессиональной игры;
- показывал героев и интерфейс через реальный high-level match;
- проверял spectator tools и broadcast;
- создавал международный статус с первого публичного появления;
- превращал переход команд со старой DotA в историческое событие;
- нагружал сетевую и организационную инфраструктуру.

Na'Vi выиграла первый чемпионат и миллион долларов. Даже зритель, не понимавший всех правил, считывал заявление Valve: Dota 2 создаётся не как небольшой remake мода, а как центральная глобальная competitive platform.

### Долгая beta была фактическим запуском

После The International доступ распространялся приглашениями. Dota 2 долго называлась beta, но уже имела огромную аудиторию, регулярные обновления, торговлю знаниями, турниры и профессиональные команды. Формальный релиз в июле 2013 года был важной административной точкой, но не моментом, когда игра внезапно стала общественной.

Это меняет само значение слова «готова». Для Portal существует окончательная последовательность комнат и титры. Для Dota 2 выпуск означает, что стабильна платформа, на которой продолжает изменяться баланс. Hero roster, карта, items и интерфейс могут жить годами.

Такая модель естественно ведёт к следующим главам: games-as-a-service, free-to-play и экономика предметов. Здесь достаточно зафиксировать основание — Valve перенесла общественную игру в инфраструктуру постоянного обслуживания. Конкретную монетизацию не следует смешивать с историей происхождения.

### Почему глубина одновременно привлекает и отталкивает

Dota 2 сохраняет огромное пространство mastery. Один матч объединяет execution, экономику, карту, draft, психологию, командную коммуникацию и знание сотен взаимодействий. Каждое решение относительно просто описать отдельно, но их произведение почти бездонно.

Цена этой глубины высока. Новичок не всегда понимает, почему умер, какое правило нарушил и какую информацию должен был иметь заранее. Матч длинный, ошибки одного человека влияют на четырёх союзников, а teammate может воспринимать незнание не как этап обучения, а как ущерб собственному времени. Именно поэтому инфраструктура guides, наблюдения и coaching важна, но не способна полностью убрать культурный порог.

### Мнение Кирилла

Dota и Dota 2 — **совершенно не его игры**. Отталкивают top-down camera, огромное количество предметов, builds, buffs и debuffs, knowledge checks и постоянное ощущение системной бухгалтерии, напоминающей неприятную часть MMO. Одновременно происходит слишком много, а embodied connection с одним персонажем ощущается слабее, чем в action game от первого или третьего лица.

Это не противоречит любви к Warcraft III. Warcraft III предлагает кампанию, режиссуру, мир, строительство базы, разные масштабы задач и контекст персонажей. Dota извлекает из RTS один конкурентный узел и делает его бесконечно повторяемой микросистемой.

Личное ощущение Dota 2:

> **та же DotA, только вместо Warcraft-ассетов юридически очищенные версии героев Valve.**

Это намеренное упрощение впечатления, а не утверждение, что Valve только заменила модели: техническая, сетевая, художественная и турнирная работа была огромной. Но для человека, не любящего саму core loop, инфраструктурное величие не превращает матч в желанный опыт.

Heroes of the Storm выглядела привлекательнее благодаря знакомым персонажам Blizzard и более дружелюбной структуре, хотя сама Blizzard позднее снизила приоритет проекта.

Бизнесовая оценка Valve противоположна личной оценке игры. Blizzard позволила жанру вырасти внутри Warcraft III и не сумела первой закрепить его коммерчески. Guinsoo ушёл к Riot, IceFrog — к Valve. Valve же правильно поняла, что покупать нужно не поверхностную формулу, а доверие к человеку, который способен продолжить живую систему.

Итоговая формулировка Кирилла остаётся предельно точной:

> **«С точки зрения бизнеса — молодцы, а хули нет-то».**

Главный итог:

> **Dota 2 стала не столько изобретением Valve, сколько крупнейшей операцией по институционализации мода: IceFrog сохранил механическую преемственность, Valve дала клиент, Steam, spectator infrastructure и деньги, а The International сразу объявил, что общественная Warcraft III-карта теперь претендует на роль глобального спорта.**

---
## 28. От коробочного релиза к игре-сервису: как обновление стало основным производственным циклом Valve { #p028 }

Valve пришла к games-as-a-service раньше, чем выражение «live service» превратилось в издательскую мантру. Переход не начался с презентации о recurring revenue, retention и daily engagement. Он вырос из практических задач компании: исправлять Counter-Strike без нового диска, автоматически обновлять клиент через Steam, поддерживать multiplayer population, наблюдать за поведением игроков и продолжать удачную систему после релиза.

Поэтому ранняя сервисная модель Valve отличалась от многих позднейших попыток индустрии. Сначала существовала игра, в которую люди хотели возвращаться. Уже затем вокруг повторяемости появились регулярный content, экономика и постоянная монетизация. Сервисность была способом продлить живую игру, а не оправданием выпустить пустую оболочку с обещанием когда-нибудь её закончить.

### Что именно изменилось относительно коробочной модели

Традиционный цикл PC-игры выглядел приблизительно так:

```text
несколько лет производства
↓
печать дисков и маркетинговый запуск
↓
один-два patches
↓
снижение продаж
↓
команда переходит к sequel
```

Большое обновление после выхода было дорогим. Его требовалось распространять отдельным installer, публиковать на сайтах и дисках журналов, согласовывать версии серверов и клиентов. Expansion обычно продавался как отдельный продукт, потому что только новая коробка оправдывала производство и распространение.

Steam постепенно изменил саму стоимость итерации:

```text
единый клиент
↓
автоматическое обновление
↓
быстрая доставка всем владельцам
↓
частые исправления и баланс
↓
новые карты, правила и предметы
↓
возврат аудитории после каждого события
↓
релиз перестаёт быть концом разработки
```

Это не просто удобство скачивания. Когда новая версия гарантированно достигает активной аудитории, дизайнер может считать post-release change нормальной частью работы. Серверы не обязаны годами поддерживать множество несовместимых builds, а игроку не нужно искать правильный patch вручную.

### Multiplayer превращает population в часть самого продукта

Для одиночной игры число одновременных владельцев почти не меняет прохождение. Для multiplayer shooter другие люди являются частью функциональности:

- они заполняют серверы;
- создают диапазон навыка;
- поддерживают разные режимы и регионы;
- производят непредсказуемые ситуации;
- обучают новых участников;
- создают видео, карты, тактики и разговор вокруг игры.

Поэтому продажа дополнительной карты как отдельного DLC может быть вреднее немедленной выручки. Владельцы DLC играют на одних серверах, остальные — на других, matchmaking pool дробится, а оператору приходится поддерживать несколько составов content. Valve постепенно пришла к принципу: важные карты и режимы лучше раздавать всей аудитории, а монетизировать то, что не мешает людям играть вместе.

Эта логика позже станет основой free-to-play, но возникла раньше отмены входной цены.

### Team Fortress 2 как главная лаборатория

TF2 вышла в 2007 году как законченная платная игра внутри Orange Box. После релиза Valve не стала сразу производить TF3. Она начала обновлять существующую систему:

- Gold Rush и Payload;
- class updates;
- achievements;
- альтернативное оружие;
- новые карты и режимы;
- Halloween events;
- комиксы и Meet the Team;
- cosmetics;
- crafting, trading и community content.

К июню 2011 года, когда TF2 стала free-to-play, Valve официально говорила уже более чем о двухстах обновлениях. Не все они были крупными, но сама величина показывает смену производственной единицы. Раньше основным событием был новый title; теперь событием мог стать patch, тематическая неделя или обновление одного класса.

Каждый крупный update создавал измеримую волну внимания:

```text
анонс и тематическая страница
↓
возвращение старых игроков
↓
новые стратегии и социальный разговор
↓
приток покупателей
↓
наблюдение за новым поведением
↓
следующая итерация
```

Valve одновременно училась производить сам content и режиссировать его появление. Class update становился небольшим праздником с собственными шутками, комиксом, achievements и короткими раскрытиями. Маркетинг больше не существовал только перед первоначальным релизом.

### Telemetry не заменяет дизайнерское решение

Цифровой клиент позволяет видеть, чем люди действительно пользуются: на каких картах уходят, какое оружие выбирают, где умирают, сколько возвращаются после обновления. Для Valve, и раньше строившей разработку вокруг playtesting, telemetry стала расширением наблюдения с десятков приглашённых тестеров до миллионов реальных матчей.

Но данные не говорят автоматически, какой должна быть игра. Они показывают симптом:

- предмет почти никто не выбирает;
- одна точка карты создаёт непропорционально долгий тупик;
- новый режим быстро теряет аудиторию;
- update возвращает игроков лишь на несколько дней.

Причину всё равно интерпретирует человек. Низкая частота выбора может означать слабость, сложность, узкую роль или плохое объяснение. Сервисная модель увеличивает возможность исправлять, но одновременно создаёт соблазн проектировать только то, что легко измеряется.

### Community становится частью производственной цепочки

Моды и пользовательские карты были важны Valve с Half-Life, но в service game участие community можно встроить в официальный pipeline. Пользователь создаёт карту или cosmetic, Workshop собирает предложения и голоса, Valve проверяет соответствие, выбранная работа попадает в update, а автор может получить часть дохода.

Это меняет масштаб производства. Компания больше не обязана рисовать каждый предмет и строить каждую арену собственными силами. Её новая функция — не только разработчик, но и куратор:

```text
community производит варианты
↓
игроки сигнализируют интерес
↓
Valve отбирает и интегрирует
↓
официальный update возвращает аудиторию
↓
часть ценности возвращается авторам
```

Однако curator power остаётся у Valve. Компания решает, что станет официальным, как распределяется видимость и какое вознаграждение получит автор. «Контент делает community» не означает, что платформа перестала управлять экономикой.

### Сервис меняет понятие законченности

Portal можно оценивать как фиксированную последовательность: начало, развитие, финал. TF2 после релиза существует в версиях. Игрок 2007 года и игрок 2015 года формально запускают одну игру, но видят разные интерфейсы, предметы, карты, визуальный шум и социальные нормы.

Отсюда возникает важная потеря. Коробочная игра сохраняет историческую композицию. Service game постоянно переписывает себя, а ранняя версия может исчезнуть без официального способа её восстановить. Улучшения, необходимые действующей аудитории, одновременно стирают объект, который когда-то полюбили первые игроки.

Для Кирилла это особенно заметно в TF2. Ранняя почти vanilla-композиция была очень чистой: девять силуэтов, ограниченный набор оружия и ясный визуальный язык. Поздняя игра получила больше вариантов, но часть первоначальной элегантности растворилась в огромном каталоге предметов.

### Организационная цена: успешная игра никогда не освобождает людей

В коробочной модели релиз завершает крупную фазу. Часть команды исправляет критические ошибки, остальные начинают новый проект. В service model успех создаёт постоянное обязательство:

- backend должен выдерживать нагрузку;
- баланс требует наблюдения;
- security и anti-cheat ведут бесконечную гонку;
- экономика нуждается в контроле supply и exploits;
- события требуют content;
- support разбирает проблемы аккаунтов и транзакций;
- художники и дизайнеры поддерживают cadence;
- старый код всё равно приходится модернизировать.

TF2, Dota 2, Counter-Strike и Steam конкурируют за инженеров с ещё не доказавшими ценность одиночными играми. В свободной структуре Valve это особенно важно: работа над огромным действующим продуктом имеет очевидный эффект и реальные данные, тогда как новый authored project годами несёт риск отмены.

Так сервисный успех помогает объяснить, почему в 2010-х Valve могла выглядеть одновременно чрезвычайно активной технологической компанией и почти исчезнувшей студией одиночных игр. Люди не обязательно «ничего не делали» — их втягивали системы, которые нельзя было оставить без владельца.

### L4D2 показала отсутствие единой доктрины

Left 4 Dead вышла уже после того, как TF2 приучила PC-аудиторию к бесплатным content updates. Поэтому платный sequel через год воспринимался как предательство сервисной логики. При этом сама Valve считала объём и связанность изменений достаточными для новой игры.

Конфликт показывает, что компания ещё не следовала одному универсальному правилу. TF2 развивалась как платформа; L4D получила номерной sequel; Portal 2 оставалась крупным авторским продуктом; Dota 2 с рождения проектировалась как постоянно изменяющаяся система. «Valve перешла к сервисам» не означает, что каждую IP пытались втиснуть в одинаковый шаблон.

### Dota 2 уже рождается незавершаемой

Для Dota вопрос «когда закончится разработка?» почти лишён смысла. Даже без нового героя competitive environment меняется через баланс, карту, предметы и открытия профессиональных команд. Стабильный продукт здесь не равен неподвижному.

Valve предоставляет клиент и правила, IceFrog и команда меняют систему, турниры демонстрируют возможности, а игроки производят мету. Разработка становится циклом между оператором и аудиторией. Формальный релиз 2013 года лишь снимает beta label; он не закрывает production.

### Сервисность не равна battle pass

Поздняя индустрия часто смешивает несколько разных вещей:

- долгую поддержку;
- обязательное подключение;
- регулярные сезоны;
- постоянную продажу cosmetics;
- time-limited progression;
- ежедневные задания;
- незавершённый релиз с дорожной картой.

Игра может быть сервисом без всех этих элементов. Portal 2 с редактором и Workshop создаёт долгоживущую пользовательскую платформу без необходимости продавать seasonal pass. И наоборот, наличие магазина и daily quest не гарантирует, что core game достаточно интересна для многолетней жизни.

Лучшее раннее открытие Valve состояло не в том, что игрока нужно постоянно удерживать. Оно состояло в том, что хорошую multiplayer-систему необязательно выбрасывать ради следующей коробки.

### Можно ли было применить модель к другим IP

#### Half-Life

Основная Half-Life плохо переносит бесконечную сервисность. Её сила — authored pacing, одиночество, controlled attention и точная последовательность пространств. Второй человек способен разрушить Ravenholm одним прыжком на голову, выстрелом в ведро и криком в Discord.

Отдельный Resistance co-op mode теоретически мог стать лабораторией боевых систем, но превращение основной серии в Destiny-подобную платформу уничтожило бы её идентичность.

Итог Кирилла:

> **«Халфу сложно сделать сервисом и похуй».**

#### Portal

Portal естественно расширять через user-generated content:

```text
официальная сюжетная кампания
+
co-op
+
редактор
+
Workshop
+
community chambers
```

Valve могла редко добавлять новую puzzle mechanic, объект, gel или небольшую co-op campaign. Один официальный элемент затем породил бы тысячи пользовательских комнат. Ассоциация Кирилла — пользовательские миры и уровни в духе Super Meat Boy: authored core остаётся законченным, а community layer живёт рядом.

#### Left 4 Dead

Именно здесь упущение выглядит крупнейшим. Формула уже содержит co-op, repeatable campaigns, Director, mutations, Special Infected, Versus и community maps. Одна L4D3-platform могла годами получать кампании, заражённых, оружие и новые director behaviours без необходимости выпускать L4D4.

Итог Кирилла:

> **«L4D3 тупо проебали».**

### Мнение Кирилла

Valve **правильно перешла на игры-сервисы**. Вместо попытки ежегодно производить очередного «убийцу Call of Duty» она обнаружила, что хорошую систему можно развивать годами.

Но правильность относится к принципу, а не ко всякой современной технике удержания. Сервис хорош, когда:

- core game уже заслуживает возвращения;
- обновления раскрывают систему, а не чинят намеренно пустой релиз;
- аудиторию не дробят платными картами;
- monetization не подменяет игровой смысл;
- старый игрок может вернуться без ощущения второй работы;
- authored games не исчезают только потому, что их сложнее монетизировать бесконечно.

Главный итог:

> **Valve превратила patch из послерелизного ремонта в основной производственный цикл. Это продлило жизнь TF2, Dota и Counter-Strike, но создало новую организационную гравитацию: успешный сервис бесконечно требует людей, данных, content и инфраструктуры, поэтому всё сильнее вытесняет рискованные законченные игры.**

---

## 29. Free-to-play: когда отсутствие цены становится частью multiplayer-дизайна { #p029 }

Valve не придумала free-to-play. К 2011 году модель уже существовала в азиатских online games, браузерных проектах и растущем рынке PC. Значение Valve было другим: компания перевела в F2P признанный premium shooter, а затем показала на Dota 2, что бесплатная competitive game может не продавать доступ к героям и боевой силе.

Для Valve free-to-play стало не жанром, а следствием сетевого эффекта. Чем меньше препятствие входа, тем больше людей поддерживает серверы, друзей, matchmaking и рынок content. Но нулевая цена также убирает естественную стоимость нового аккаунта, поэтому вместе с ростом приходят smurfs, cheaters, griefers и новые способы злоупотребления.

### TF2 не прыгнула из коробки прямо в бесплатность

В 2007 году TF2 была обычной платной игрой. За следующие годы Valve последовательно построила системы, которые могли финансировать её без продажи каждому человеку входного билета:

1. class updates возвращали аудиторию;
2. achievements открывали альтернативное оружие;
3. item drops отвязали часть наград от конкретных задач;
4. hats доказали ценность чистой косметики;
5. crafting создал применение дубликатам;
6. trading придал предметам обменную ценность;
7. Mann Co. Store в 2010 году позволил покупать предметы за Steam Wallet;
8. community contributors начали получать долю продаж.

Только после этой последовательности 23 июня 2011 года, вместе с Über Update, TF2 стала бесплатной. В официальном анонсе Valve подчёркивала четыре года поддержки и более двухсот обновлений. Компания снимала цену с уже доказавшей качество и имевшей работающую экономику игры.

Это принципиально отличается от запуска неизвестного проекта, который сначала требует гигантскую аудиторию, а потом пытается найти причину её удерживать.

### Population сама является ценностью

У multiplayer-игры есть проблема «холодного старта» и старения. Даже превосходная система становится практически недоступной, если:

- рядом нет серверов;
- режим не набирает нужное число участников;
- все оставшиеся игроки намного опытнее новичка;
- друзьям приходится сначала покупать игру, чтобы попробовать её вместе;
- региональная population существует только несколько часов в сутки.

Free-to-play снижает координационную цену. Один человек может отправить ссылку друзьям, и вся группа начинает играть без коллективного решения о покупке. В случае TF2 каждый новый участник также увеличивает ценность уже купленных копий: появляется больше соперников, союзников и серверной жизни.

Поэтому бесплатный игрок не просто «неплатящий пользователь». Он создаёт matchmaking liquidity, социальное распространение и возможную аудиторию для контента других людей.

### Free и Premium в Team Fortress 2

Valve не закрыла классы, карты или режимы. Официальный FAQ прямо обещал идентичный игровой опыт и доступ ко всей игре. Почти всё оружие можно было получить через achievements, drops или crafting.

Разница находилась преимущественно в экономической оболочке:

- у бесплатного аккаунта был меньший backpack;
- crafting и trading ограничивались;
- часть редких и косметических drops предназначалась Premium;
- любая покупка в Mann Co. Store переводила аккаунт в Premium;
- прежние покупатели автоматически сохраняли Premium и получили шляпу Proof of Purchase.

Это умная конструкция. Нельзя купить исключительный класс или карту и получить боевое пространство, недоступное другим. Но человек, глубже входящий в сбор и обмен предметов, естественно сталкивается с предложением один раз заплатить.

Старому покупателю символическая шляпа не возвращала цену игры, но фиксировала статус раннего участника. Valve не могла сделать переход полностью безболезненным: человек вчера заплатил за то, что сегодня раздают. Она компенсировала не стоимость, а идентичность.

### F2P изменяет тип нежелательного поведения

Цена игры выполняет роль слабого залога. Заблокированный cheater или griefing-аккаунт теряет купленный доступ. При нулевой цене новую личность можно создавать снова и снова.

Valve заранее признавала этот риск в FAQ TF2 и обещала отслеживать обход блокировок. Но проблема оказалась не временной аномалией, а постоянным свойством модели:

- disposable accounts удешевляют cheating;
- smurf может избегать своего уровня навыка;
- bots масштабируются массово;
- ban теряет часть устрашающей силы;
- operator вынужден связывать доверие с историей аккаунта, платежами, телефоном или иными сигналами.

Free-to-play расширяет population, но затем требует систем, различающих нового честного человека и одноразовый инструмент злоупотребления. Подробная эволюция VAC, Trust Factor и VACnet относится к пункту 79.

### Dota 2 выбрала более строгую competitive честность

У Dota 2 не было платной эпохи. В 2012 году, ещё во время beta, Valve сформулировала модель на странице Spoils of War:

> игра бесплатна, все герои бесплатны, предметы можно заработать, а купить competitive advantage нельзя.

Решение о героях особенно важно. В Dota draft является частью матча. Hero — не только avatar или личный стиль, а элемент общего словаря counter-picks и комбинаций. Если часть roster закрыта покупкой или многомесячной progression, игрок имеет неравный доступ к самим правилам.

Valve могла использовать популярную модель продажи героев. Вместо этого она монетизировала appearance, couriers, announcers, tournament-related content и другие слои, не меняющие базовую доступность draft.

Это не делает всю экономику Dota автоматически безвредной: randomness, scarcity и FOMO могут существовать внутри косметики. Но фундаментальное решение сохранило конкурентную целостность лучше модели, где новый герой одновременно является gameplay update и товаром.

### CS:GO показывает обратную сторону нулевой цены

Counter-Strike: Global Offensive стала free-to-play значительно позже, в 2018 году, когда skins economy и гигантская аудитория уже существовали. Теоретически снижение входного барьера должно было расширить population. Практически для Counter-Strike особенно болезненны одноразовые cheater accounts и smurfs: один нарушитель способен испортить длинный соревновательный матч девяти людям.

Valve меняла роль Prime и доступ бесплатных аккаунтов к рейтинговой среде. Конкретные правила со временем пересматривались, поэтому важен не один snapshot, а вывод: free-to-play требует заново создавать цену идентичности. Если доступ бесплатен, доверие приходится зарабатывать историей или отдельным статусом.

### Бесплатность не говорит, насколько игра щедра

Две F2P-игры могут быть экономически противоположными.

Одна предлагает:

- полный gameplay;
- прозрачную косметическую покупку;
- отсутствие обязательной ежедневной рутины;
- возможность вернуться после долгого перерыва.

Другая использует:

- героя в сезонном pass;
- time-limited progression;
- несколько накладывающихся валют;
- ежедневные задания как обязанность;
- искусственно медленное получение gameplay elements;
- FOMO вместо самостоятельного желания играть.

Поэтому спор «платная или бесплатная» слишком груб. Важнее спросить, что именно продаётся, какие ограничения исчезают после платежа и пытается ли система заставить игрока жить по расписанию магазина.

### Мнение Кирилла

Переход TF2 в free-to-play — **абсолютно правильный**. Без притока новых людей старая платная TF2 могла приблизиться к судьбе Day of Defeat: замечательная multiplayer game, в которой слишком мало новичков и слишком высок veterancy gap.

Кирилл нормально относится к F2P, если core gameplay открыт, герои и механики не требуют обязательной оплаты, а деньги в основном идут за cosmetics.

#### Apex Legends

Это положительный личный пример. Кирилл бесплатно скачал Apex, убедился, что игра ему нравится, и примерно в 2022 году добровольно потратил около **1000 рублей** на внутриигровую вещь.

Психологически модель работает так:

```text
сначала докажи,
что игра хорошая
↓
я сам захочу
дать денег
```

#### Overwatch 1

Лутбоксы не вызывали сильного раздражения, потому что игра покупалась один раз, boxes регулярно выдавались за игру, legendary cosmetics было много, а весь roster оставался частью core product. Это не делает random rewards идеальной моделью, но ощущение сделки было понятным.

#### Overwatch 2

Первоначальная привязка новых героев к battle-pass progression воспринималась значительно хуже. Проблема не только в денежной цене. Каждый сезон игра снова требовала отрабатывать доступ к части gameplay. Blizzard позднее отказалась от этой hero-unlock модели, тем самым косвенно подтвердив, что monetization пересекла важную границу.

### Предпочтительная модель

Идеальный вариант для Кирилла:

```text
один раз заплатил
↓
получил полноценную игру
↓
gameplay updates бесплатны
↓
cosmetics продаются отдельно
```

Допустимый вариант:

```text
F2P
↓
core gameplay бесплатный
↓
игра сначала доказывает ценность
↓
платёж добровольный
и преимущественно косметический
```

Не нравится:

- FOMO;
- gameplay за seasonal pass;
- обязательная подписка для нормального темпа;
- бесконечное число валют;
- ощущение второй работы;
- необходимость регулярно «выкупать» уже освоенную игру заново.

Главный итог:

> **Valve показала, что free-to-play может быть не урезанной бесплатной версией, а способом убрать входной барьер из полноценной multiplayer-системы. TF2 доказала жизнеспособность перехода из premium, а Dota 2 установила более важный принцип: если герой является частью конкурентного языка, доступ к нему не должен быть товаром.**

---

## 30. От оружия и шляп к Steam Economy: как Valve научилась создавать, оценивать и облагать комиссией цифровые вещи { #p030 }

Экономика Valve не возникла в один день вместе с лутбоксами. Она выросла из последовательности небольших дизайнерских вопросов. Как наградить игрока за освоение класса? Что делать с повторяющимися предметами? Почему люди хотят вещь без боевого преимущества? Можно ли позволить обмен? Кто будет производить тысячи косметических вариантов? Что произойдёт, если обменяемый предмет получит публичную цену?

TF2 стала лабораторией, Dota 2 расширила модель до community-funded esports, а Counter-Strike превратил weapon finish в ликвидный статусный объект. Вместе они создали **Steam Economy** — платформенную систему, где Valve одновременно определяет правила выпуска, хранит инвентарь, обслуживает сделки и получает комиссию.

### Первый этап: оружие как альтернативный способ играть

Class updates TF2 добавляли unlockable weapons. В ранней форме предмет прежде всего имел gameplay function: не обязательно становился сильнее стандартного, а менял набор возможностей и компромиссов класса.

Achievement-based unlock связывал награду с конкретной активностью. Игрок видел цель, выполнял условия и получал вещь. Но система создавала и нежелательное поведение: люди заходили на специальные achievement servers, выполняли искусственные сценарии и воспринимали задачу не как освоение класса, а как препятствие между собой и оружием.

Этот эпизод содержит постоянную проблему экономики. Как только награда привязана к метрике, часть аудитории оптимизирует метрику, а не игру, которую она должна была поощрять.

### Item drops превращают время в шанс

В 2009 году Valve ввела случайные drops. Теперь предмет мог появиться во время игры без выполнения определённого achievement. Это уменьшало необходимость следовать списку заданий, но добавляло scarcity и случайность.

Игрок уже не спрашивал только «что нужно сделать?». Он спрашивал:

- сколько времени до следующего drop;
- почему друг получил редкую вещь, а я нет;
- можно ли оставить игру запущенной;
- как обойти ограничение;
- что делать с дубликатами.

Так внутри shooter возникла задача оптимизации производства предметов.

### Idling controversy: экономика меняет поведение раньше появления денег

Часть игроков использовала idle servers и внешние способы, чтобы получать drops без нормальной игры. Valve удалила часть предметов, добытых через запрещённый external idling program, а людям, не использовавшим его, выдала косметическую **Cheater’s Lament**.

Жест был одновременно наказанием и театром. Честность превратилась в видимый головной убор, поэтому социальная реакция оказалась частью enforcement.

Главный урок появился ещё до свободного рынка:

> как только цифровая вещь воспринимается как редкая и желанная, игроки начинают максимизировать её производство независимо от первоначального игрового смысла.

### Hats доказали ценность вещи без боевой силы

Косметические головные уборы появились в TF2 в 2009 году. Они почти не меняли combat, но оказались желанными благодаря сочетанию нескольких факторов:

- видимая редкость;
- юмор;
- персонализация знакомого класса;
- возможность демонстрировать стаж и участие в событии;
- социальное сравнение;
- соответствие уже сильным характерам наёмников.

Для индустрии это было важное доказательство: item не обязан давать damage, чтобы иметь субъективную ценность. Напротив, отсутствие боевого преимущества делает продажу приемлемее, потому что статус не разрушает формальную честность матча.

Но косметика не является совершенно внешней к gameplay. Она занимает экран, изменяет силуэт, сообщает о владельце и влияет на художественную целостность. Когда каталог растёт без достаточной дисциплины, «только визуальная» монетизация способна ухудшить читаемость, ради которой TF2 когда-то отказалась от реализма.

### Crafting создаёт sink и неофициальную валюту

Дубликат бесполезен, пока его нельзя преобразовать. Crafting позволил собирать оружие и metal в новые предметы. Экономике необходимы **sinks** — процессы, выводящие лишние единицы из обращения. Без них supply непрерывно растёт, а обычные drops теряют значение.

Community постепенно использовала metal как меру мелкой стоимости, а Mann Co. Supply Crate Keys — как более стабильную крупную единицу обмена. Valve не объявляла их официальными деньгами. Они стали quasi-currency снизу, потому что были достаточно стандартизированы, востребованы и обменяемы.

Это показывает разницу между проектированием и возникновением рынка. Valve задаёт свойства предмета, но участники сами решают, какой объект удобнее использовать как общий эквивалент.

### Mann-Conomy соединяет инвентарь с реальными платежами

30 сентября 2010 года Mann-Conomy Update добавил Mann Co. Store, trading, расширенную персонализацию и новые предметы. Покупки проходили через Steam Wallet. Valve подчёркивала, что карты и режимы останутся бесплатными, а gameplay-relevant items по-прежнему можно будет получать игрой.

Это была точка превращения набора rewards в формальную экономическую систему:

- у предметов появилась первичная цена;
- игрок мог выбирать между временем, обменом и покупкой;
- Steam Wallet связал внутриигровую вещь с остальным магазином;
- trading создал вторичную социальную ценность;
- Vintage status сохранил различие ранних экземпляров;
- community contributors начали участвовать в продажах.

В том же обновлении crates и платные keys сформировали модель paid randomness. Контейнер выпадает или приобретается, но для открытия нужен товар с фиксированной ценой, а результат определяется случайностью и редкостью. Подробные юридические и психологические последствия loot boxes рассматриваются в пункте 83; здесь важно происхождение инфраструктуры.

### Workshop превращает community в оплачиваемого поставщика

В 2011 году Valve запустила Steam Workshop для TF2 как единый submission hub. Художник мог загрузить предмет, получить реакцию community, а Valve — выбрать работу для официальной интеграции. Если вещь продавалась, contributor получал долю.

Официальный пост к первой годовщине Mann Co. Store сообщал, что авторы community content заработали более двух миллионов долларов за год. При открытии магазина Dota 2 Valve уже говорила о миллионах выплат TF2 contributors и о том, что более 80% стартового ассортимента Dota происходило из community.

Модель чрезвычайно сильна:

```text
тысячи авторов несут риск производства
↓
community предварительно оценивает работы
↓
Valve выбирает небольшую долю
↓
официальная игра придаёт предмету спрос
↓
доход делят автор и платформа
```

Она демократизирует возможность заработать, но одновременно создаёт зависимость от непрозрачного отбора. Автор может вложить огромный труд без гарантии включения; Valve получает широкий каталог вариантов, оплачивая только выбранные.

### Trading придаёт предмету биографию

Необмениваемая награда имеет ценность только для владельца. Trading позволяет ей двигаться между людьми, участвовать в подарке, торге и накоплении. У конкретной вещи появляются provenance, редкость и история владения.

Одновременно возникает новая поверхность риска:

- мошенничество;
- подмена предметов в trade window;
- фишинг аккаунтов;
- кража инвентаря;
- использование внешних сайтов;
- споры о возврате сделки;
- автоматизированные торговые bots.

Инвентарь становится не только частью игры, но и security asset. Valve должна защищать его почти как платёжную учётную запись, хотя юридически предмет не равен обычной собственности или банковскому депозиту.

### Community Market создаёт публичную цену

12 декабря 2012 года Valve запустила beta Steam Community Market именно с предметами TF2. Игроки получили возможность покупать и продавать поддерживаемые вещи за Steam Wallet funds. Сделка больше не требовала вручную искать второго человека и договариваться о пропорции metal или keys.

Market добавил:

- список заявок и предложений;
- наблюдаемую цену;
- ликвидность;
- историю спроса и предложения;
- автоматизированную передачу предмета;
- transaction fees;
- связь выручки с покупкой других товаров Steam.

Однако Steam Wallet funds нельзя автоматически приравнивать к обычным деньгам на банковском счёте. Официальный рынок даёт покупательную способность внутри Steam, но не штатный вывод наличных. Поэтому внешние серые рынки предлагают cash-out и одновременно выносят пользователя за пределы большей части защиты Valve.

### «Центральный банк» — полезная, но ограниченная аналогия

Valve часто сравнивают с центральным банком виртуальной экономики. Аналогия помогает увидеть концентрацию власти. Компания контролирует:

- создание типов предметов;
- правила drops;
- редкость и discontinued supply;
- рецепты и sinks;
- возможность trade и market listing;
- комиссии;
- bans и ограничения аккаунта;
- исправления ошибок, влияющих на supply.

Но это не государственная денежная система. Valve является частным оператором, стороной пользовательского соглашения и коммерческим бенефициаром. Она не обязана поддерживать занятость, ценовую стабильность и права держателей так, как публичный центральный банк. Предмет существует внутри изменяемых правил платформы.

Именно поэтому ошибка loot table может напоминать monetary accident, но права пострадавших определяются не конституцией, а политикой сервиса.

### Crate Depression показывает цену ошибки supply

В 2019 году ошибка в TF2 резко увеличила получение редких Unusual cosmetics из определённых crates. Предметы, чья ценность зависела от низкой вероятности, массово вошли в обращение. Market пришлось ограничивать, а Valve — решать, какие экземпляры можно продавать и как относиться к покупателям, действовавшим до официального объяснения.

Событие получило название **Crate Depression**. Оно показывает, что backend bug уже не является только визуальной или игровой ошибкой. Он меняет воспринимаемое богатство пользователей, уничтожает scarcity и перераспределяет выгоду между теми, кто раньше обнаружил проблему, и теми, кто владел редкостью до неё.

### Dota 2 связывает косметику, community и esports

Dota 2 перенесла модель на гораздо больший roster. Игрок покупает sets, couriers, wards, announcers и другие формы персонализации, тогда как герои и competitive power остаются бесплатными. Workshop позволяет художникам создавать content для конкретных персонажей, а Valve следит, чтобы предметы сохраняли узнаваемость героя.

**Interactive Compendium** для The International 2013 добавил другой слой. Покупатель получал цифровой паспорт турнира, predictions, votes, rewards и evolving content. Четверть стоимости каждого Compendium направлялась в prize pool.

Это блестящая связка:

- фанат покупает игровой объект;
- получает участие в событии;
- коллективные покупки увеличивают масштаб турнира;
- растущий prize pool становится рекламой новых покупок;
- Valve финансирует esport вместе с аудиторией, удерживая остальную долю выручки.

Позднейший battle pass расширил эту логику, включая всё больше progression и ограниченных наград. Подробная критика FOMO относится к общей монетизационной оценке, но происхождение находится именно в Compendium как живом companion турнира.

### Arms Deal превращает оружие Counter-Strike в витрину

В августе 2013 года Arms Deal Update добавил в CS:GO более ста weapon finishes. Их можно было получать drops, открывать из cases ключами, обменивать и продавать на Community Market. StatTrak фиксировал число убийств конкретного экземпляра, а редкие knives заняли вершину иерархии.

Counter-Strike оказался почти идеальной средой для skins:

- оружие постоянно находится перед глазами владельца;
- его видят другие игроки и зрители;
- базовые модели хорошо известны, поэтому редкий finish заметен;
- competitive аудитория создаёт статусный контекст;
- огромная population поддерживает ликвидность;
- rarity и float-like различия делают экземпляры коллекционными;
- Workshop обеспечивает поток дизайнов.

Часть дохода от eSports Weapon Case направлялась на турниры. Так CS:GO повторила связь cosmetics и spectator ecosystem, но добавила гораздо более ликвидный и спекулятивный рынок.

### Экономика меняет то, ради чего запускают игру

В исходной TF2 предмет обслуживал новый способ играть. После появления рынка возможна обратная мотивация: человек запускает игру, чтобы получить предмет, следит за ценой, торгует или открывает контейнеры, даже если сам матч становится вторичным.

Это не обязательно плохо — коллекционирование и торговля тоже формы игры. Но оператор должен различать несколько аудиторий:

- людей, любящих core gameplay;
- коллекционеров;
- художников Workshop;
- traders;
- спекулянтов;
- gamblers;
- мошенников, использующих ликвидность предметов.

Интересы этих групп конфликтуют. Увеличение supply радует обычного игрока и злит владельца редкости. Жёсткое сохранение scarcity поддерживает цену, но делает желанную вещь недоступной. Новый cosmetic приносит выручку, но может разрушить art direction.

### Мнение Кирилла

Косметика сама по себе не проблема. TF2 hats — **нормальная и правильная идея**. Игрок получает способ выразить себя, Valve финансирует бесплатный content, а механическое равенство сохраняется.

Проблема начинается, когда:

- визуальный шум разрушает исходный art direction;
- силуэт класса становится менее чистым;
- предметы сильнее определяют identity продукта, чем сама игра;
- коллекция заменяет интерес к матчу;
- monetization требует постоянного engagement;
- ограниченные награды превращают отдых в расписание;
- психологическая манипуляция важнее прямой продажи желаемой вещи.

Поздняя TF2 в этом смысле потеряла часть элегантности ранней версии. Экономика помогла игре жить невероятно долго, но постепенно изменила объект, который должна была поддерживать.

Главный итог:

> **Valve начала с альтернативного оружия и смешных шляп, а закончила инфраструктурой, где community производит товары, игроки создают спрос и ликвидность, Steam хранит инвентарь и расчёты, а Valve контролирует выпуск, правила и комиссию. Это не побочная монетизация нескольких игр, а один из важнейших технологических продуктов компании.**

---
## 31. Source Filmmaker: как внутренний инструмент Valve превратил игровой мир в съёмочную площадку { #p031 }

Source Filmmaker — один из наиболее буквальных примеров философии Valve «выпустить наружу инструмент, которым мы уже пользуемся сами». Компания не начинала с идеи создать универсальный пакет 3D-анимации для рынка. Ей требовался способ производить трейлеры, сцены и короткометражные фильмы внутри Source, используя готовые игровые модели, карты, анимации, частицы и освещение. Публичный SFM появился потому, что внутренний pipeline оказался достаточно выразительным, чтобы стать отдельной творческой средой.

Главное достижение инструмента — не превосходство над Maya, 3ds Max или профессиональными offline renderers по каждой отдельной функции. SFM сжимает множество этапов в одно пространство и позволяет режиссёру работать непосредственно внутри игрового мира.

### Фильм создаётся там же, где работает игра

Обычный animation pipeline разделён между специализированными инструментами. В одном создают модель, в другом строят rig, в третьем анимируют, в четвёртом освещают и рендерят, в пятом монтируют звук и изображение. Каждый переход требует экспорта, согласования форматов и проверки результата.

SFM использует Source как virtual set:

- карта становится декорацией;
- игровые модели — актёрами и реквизитом;
- particle systems и освещение работают внутри знакомого engine;
- camera существует в той же сцене;
- timeline объединяет записанное действие, анимацию, звук и монтаж;
- hardware renderer показывает результат почти в том виде, в котором его увидит зритель.

Valve описывала эту среду как **what you see is what you get**. Режиссёр не обязан отправлять каждое изменение в долгий offline render, чтобы понять композицию кадра. Он двигает источник света, меняет фокус, переставляет камеру и сразу оценивает сцену в контексте.

Это также объясняет название. Source Filmmaker не является просто video editor с персонажами TF2 и не строит модели с нуля. Он делает фильмы средствами и внутри пространства Source.

### Сначала можно сыграть сцену, затем поставить её заново

Одна из сильнейших идей SFM — запись игрового события с последующим редактированием. Пользователь может разыграть сцену или записать действия, а после завершения take изменить то, что в обычной видеозаписи уже зафиксировано.

```text
записать действие в игровом мире
↓
выбрать другой ракурс
↓
исправить движение персонажа
↓
переанимировать руки и лицо
↓
изменить свет, частицы и depth of field
↓
перемонтировать звук и время
↓
отрендерить фильм
```

Камера не была частью исходного gameplay recording, поэтому её можно поставить после действия. Актёр остаётся манипулируемой моделью, а не набором пикселей. Ракета, выражение лица, поза и момент выстрела продолжают существовать как элементы сцены.

Так SFM соединяет machinima и полноценную character animation. От machinima он наследует готовый мир и возможность быстро получить естественное игровое движение. От animation package — контроль над ключевыми кадрами, позой, лицом, камерой и временем.

### Ограничение становится главным преимуществом

SFM не пытается самостоятельно создавать весь производственный материал. Официальный FAQ прямо сравнивает его с виртуальной площадкой, где уже есть свет, актёры, props и камеры. Новые meshes, textures и sounds обычно готовятся внешними инструментами, а затем импортируются.

Для универсального 3D-пакета это выглядело бы недостатком. Для community вокруг Valve готовая библиотека резко снижала порог входа:

- девять узнаваемых персонажей TF2;
- готовые skeletons и facial controls;
- сотни locations;
- оружие и реквизит;
- particles;
- sounds и реплики;
- уже существующий художественный стиль.

Начинающему автору не требовалось сначала несколько лет строить собственную вселенную. Он мог учиться постановке, комедийному timing и монтажу на готовой сцене. Именно поэтому SFM породил не только технические demos, но огромное количество скетчей, пародий, музыкальных клипов, мемов и фанатских драм.

### Meet the Team показывает, зачем Valve вообще понадобился SFM

Серия **Meet the Team** завершила превращение классов TF2 из функций в персонажей. Silhouette и оружие объясняли роль в матче; короткометражные фильмы показывали темперамент, голос, отношения с насилием и комедийный ритм.

SFM позволял Valve использовать одинаковые assets в игре и фильме. Heavy из ролика не являлся приблизительной рекламной CG-версией игрового персонажа. Он сохранял узнаваемую модель и художественный язык, но получал более точную лицевую анимацию, постановку и свет.

Это уменьшало дистанцию между marketing и product. Ролик не обещал фотореалистичное зрелище, отсутствующее в самой игре. Он расширял характер того, кого игрок уже видел на сервере.

При этом SFM не нужно мифологизировать как единственную причину качества Meet the Team. Инструмент ускоряет итерацию, но не создаёт сценарий, актёрскую подачу, монтажное чувство и хороший visual gag автоматически. Доступность камеры не превращает пользователя в режиссёра — она позволяет режиссуре происходить без огромной студии.

### Replay и Saxxy подготовили community к режиссуре

До открытого выпуска SFM Valve экспериментировала с **Replay** в TF2. Игрок мог сохранить момент матча, выбрать ракурс, смонтировать клип и поделиться им. Replay сохранял связь с произошедшим gameplay: материалом служил реальный бой.

Конкурсы **Saxxy Awards** добавили публичную цель и язык признания. Название награды отсылало к статуе Saxton Hale; community соревновалась в comedy, action, drama, replay и позднее других категориях. Valve показывала победителей, а сами конкурсы создавали deadline, формат и престиж вокруг пользовательского кино.

С появлением SFM автор перестал быть ограничен одним удачным матчем. Он мог полностью поставить сцену, использовать игровую запись только как черновой performance или вообще анимировать всё вручную. Replay culture стала мостом от фиксации игрового момента к созданию самостоятельного фильма.

### Открытая beta 2012 года

10 июля 2012 года Valve открыла beta Source Filmmaker бесплатно для всех. В официальный комплект вошли TF2 assets и материалы двух Meet the Team sessions, чтобы пользователь мог не только посмотреть готовый фильм, но и разобрать его устройство.

Это важный педагогический жест. Исходная session показывает:

- организацию shots;
- расположение камер;
- animation sets;
- работу света;
- facial performance;
- связь звука и действия;
- слои, которые за финальным видео не видны.

Компания выпускала tutorials и сохраняла Steam Community hub для публикации и оценки работ. Инструмент, учебный материал, аудитория и канал распространения находились внутри одной экосистемы.

### Публичный инструмент остаётся продуктом своей внутренней истории

Сила SFM одновременно является его ограничением. Он наследует Source 1, TF2-oriented assumptions и интерфейс внутреннего production tool. Пользователь получает реальную рабочую среду Valve, но вместе с ней — сложность, странные conventions и технические границы, которые профессиональная команда могла обходить благодаря внутреннему знанию.

Standalone SFM годами сохраняет надпись public beta. Это не означает, что программа является бесполезным недоделанным prototype: на ней создано огромное количество законченных работ. Но статус точно отражает приоритет Valve. Компания делилась тем, что требовалось её собственным фильмам, а не строила отдельный конкурентный бизнес с долгосрочным support roadmap для анимационной индустрии.

Лицензия assets также имеет значение. Бесплатный инструмент не автоматически даёт право коммерциализировать персонажей, модели и звуки Valve. Официальный FAQ разрешает свободно делиться фильмами внутри community, но коммерческое использование Valve assets ограничено. Собственные assets автора создают другую ситуацию. Инструмент бесплатен; чужая IP внутри него не становится общественным достоянием.

### Community расширила культурную жизнь игр Valve

SFM дал персонажам TF2, Half-Life, Portal и других игр жизнь за пределами официальных релизов. Пользовательские фильмы продолжали производить новые ситуации даже тогда, когда Valve почти не выпускала сюжетный content.

Это необычная форма долговечности IP. Компания не контролирует каждую шутку и interpretation, но предоставляет исходную сцену и узнаваемых актёров. Community делает то, чего официальная производственная структура не могла бы обеспечить в таком объёме:

- смешивает universes;
- создаёт alternate stories;
- превращает баги и игровые привычки в комедию;
- сохраняет персонажей в интернет-культуре;
- обучает новое поколение аниматоров на знакомом материале.

Некоторые авторы начинали с грубых TF2 sketches, а затем переходили к более сложной анимации и профессиональной работе. SFM в этом смысле стал не только content machine для Valve fandom, но и неформальной школой экранного мышления.

### Source 2 Filmmaker — продолжение идеи, но не простой SFM 2

В инструментах Source 2 существует новое поколение Filmmaker. Dota 2 Reborn уже показывала 64-bit SFM, более крупные миры, live asset updates, новые constraints и прямой H.264/AAC render. Позднее соответствующие инструменты поставлялись в составе toolsets конкретных игр, включая Half-Life: Alyx и Counter-Strike 2.

Но это не стало отдельным универсальным consumer product, который просто заменил приложение SFM в Steam. Source 1 SFM остаётся наиболее доступной самостоятельной средой с огромной накопленной библиотекой content, тогда как Source 2 Filmmaker существует внутри привязанных к продуктам authoring tools.

Разделение повторяет судьбу самого Source 2: внутренняя технология развивается, но внешний доступ организован по играм и Workshop ecosystems, а не как полностью самостоятельная платформа с единым SDK.

### Главный итог

> **Source Filmmaker ценен не тем, что заменил профессиональные 3D-пакеты, а тем, что превратил готовый игровой мир в доступную съёмочную площадку. Valve объединила assets, performance capture, анимацию, камеру, свет, звук и рендер в одном контексте — а затем отдала этот внутренний pipeline аудитории, которая обеспечила персонажам компании культурную жизнь далеко за пределами официальных релизов.**

---

## 32. Source 2: революция производственного pipeline, которую игрок почти не обязан замечать { #p032 }

Source 2 часто воспринимают как «движок Half-Life: Alyx» или как технологию, внезапно появившуюся вместе с Counter-Strike 2. Обе формулы искажают хронологию. Valve официально анонсировала Source 2 в марте 2015 года, через несколько месяцев начала открытую migration Dota 2 Reborn, а уже затем годами переносила на новую основу разные продукты и инструменты.

Source 2 не вышла одной законченной коробкой SDK. Она проявлялась через конкретные игры: Dota 2 проверяла live-service migration и сложный UI, SteamVR-проекты — VR и пользовательские environments, Artifact и Underlords — новые game-specific systems, Half-Life: Alyx — высокодетализированную authored VR-кампанию, Counter-Strike 2 — соревновательный shooter с гигантским наследием карт и инвентарей.

Поэтому правильнее рассматривать Source 2 как долго развивающееся семейство engine systems и tools, а не как единый продукт, который однажды «вышел» и после этого остался неизменным.

### Почему Source 1 нельзя было бесконечно наращивать без цены

Source сам возник эволюционно из технологий GoldSrc и продолжал меняться под конкретные проекты. Half-Life 2, Orange Box, Left 4 Dead, Portal 2, CS:GO и Dota 2 требовали разных renderer features, UI, networking, physics и authoring workflows. В результате слово Source скрывало не один одинаковый engine, а множество веток с общей историей.

Условно:

```text
базовая линия Half-Life 2
├── Orange Box
├── Left 4 Dead
├── Portal 2
├── Counter-Strike: Global Offensive
└── Dota 2
```

Это не точная схема каждого merge и каждой code branch, а объяснение проблемы. Функция, разработанная для одной игры, не обязательно автоматически появлялась во всех остальных. Исправление приходилось переносить, старые assumptions сохранялись ради совместимости, а toolchain нёс решения, восходящие к эпохе Quake, GoldSrc и раннего Source.

Для игрока старый engine может выглядеть нормально благодаря сильному art direction. Для разработчика цена проявляется иначе:

- долгие compile stages;
- устаревшие текстовые contracts между инструментами;
- ограничения brush/BSP-oriented mapping;
- различающиеся branch features;
- сложный импорт assets;
- 32-bit наследие;
- высокая стоимость безопасного изменения live products.

Source 2 требовалась прежде всего не для одного красивого эффекта, а чтобы сократить стоимость дальнейшего производства.

### Анонс 2015 года говорил о creators, а не о числе полигонов

3 марта 2015 года Valve официально представила Source 2. В заявлении Джея Стелли центральной формулировкой было повышение **creator productivity**. Компания связывала новое поколение движка с user-generated content и обещала сделать технологию бесплатной для content developers.

Это очень показательный выбор акцента. Маркетинг графических движков часто строится вокруг фотореалистичного персонажа, разрушения или света. Valve продавала идею более короткого feedback loop:

- быстрее создать asset;
- увидеть его в контексте;
- изменить без длинной цепочки экспорта;
- дать доступ не только внутреннему специалисту, но и community creator;
- использовать один набор tools для игры и Workshop ecosystem.

Такой приоритет логично продолжал SFM, Hammer, Portal editor и Workshop. Valve рассматривала engine как средство производства не только собственного content, но и бесконечного количества пользовательского.

### Dota 2 Reborn стала первым массовым испытанием

В июне 2015 года Valve открыла beta **Dota 2 Reborn** с новым dashboard, новым engine и Custom Games. В сентябре migration стала основной версией Dota 2, а прежний Source 1 client был выведен из нормального использования.

Перенос действующей Dota был гораздо более рискованным испытанием, чем небольшая новая demo:

- миллионы игроков ожидали сохранения поведения героев и items;
- input latency влияет на last hitting и competitive timing;
- UI содержит огромное количество экранов и состояний;
- replays, spectators и турниры зависят от networking;
- Workshop assets должны продолжать работать;
- backend и matchmaking нельзя остановить на годы переписывания;
- custom games требуют script и authoring environment.

Reborn показала, что Source 2 — не только renderer. Официальные материалы подчёркивали более отзывчивый input, новую сетевую основу, 64-bit, native graphics APIs, redesigned UI, tile-based authoring, complex mesh geometry, новые physics и cloth systems.

Первая массовая Source 2-game при этом не выглядела как радикально другая визуальная эпоха. Valve прямо отмечала, что Dota использует лишь часть новых rendering features. Это важный контраргумент ожиданию, будто каждый engine transition обязан немедленно производить screenshot революцию.

### Переезд live game важнее чистого старта

Новая игра может проектировать assets и правила под новый engine с нуля. Migration должна сохранить накопленное:

- персонажей;
- анимации;
- cosmetics;
- карты;
- пользовательский content;
- ощущение управления;
- competitive edge cases;
- экономическую собственность аккаунтов.

Поэтому перенос Dota 2 и позднее CS:GO на Source 2 является не только технологическим обновлением, но и задачей совместимости. Чем успешнее сервис, тем больше наследия запрещено случайно потерять. Новый engine должен доказать ценность, не уничтожив многолетнюю память игры.

Counter-Strike 2 особенно ясно показывает эту цену. Valve перенесла инвентари CS:GO, карты и core gunplay, одновременно введя новый renderer, dynamic smokes, subtick architecture и обновлённые tools. Подробные достоинства и проблемы самого CS2 относятся к пункту 54; здесь важно, что Source 2 стал основой не новой экспериментальной игры, а замены одного из крупнейших competitive products мира.

### Новый resource pipeline

Source 1 опирается на знакомую моддерам систему форматов и compile steps:

- `.vmf` как исходная карта;
- BSP-компиляция;
- `.vmt` и `.vtf` для материалов и текстур;
- `.qc` как инструкция компиляции модели;
- `.mdl` и связанные runtime-файлы.

В Source 2 появились новые resource families:

- `.vmap` для карт;
- `.vmat` для материалов;
- `.vmdl` для моделей;
- compiled runtime variants с окончанием наподобие `_c`;
- GUI-oriented editors для разных типов content.

Смысл не в добавлении буквы `v`. Source 2 лучше разделяет authoring source и compiled runtime resource, поддерживает live preview и связывает инструменты в более единую среду. Разработчик сильнее ощущает этот переход, чем игрок, сравнивающий два скриншота.

Migration при этом не становится автоматической. Старые карты, модели и материалы построены на других assumptions. Valve имеет внутренние conversion tools и опыт, но community часто приходится исправлять результат вручную. «Один и тот же asset» между Source 1 и Source 2 может потребовать нового материала, collision, освещения и настройки.

### Hammer перестаёт быть прежде всего редактором герметичных brushes

Классический Hammer исторически мыслит архитектуру через convex brushes и BSP. Такая модель прекрасно подходит коридорам, комнатам и уровневой геометрии эпохи Half-Life, но становится неудобной для современных детализированных пространств. Художники всё чаще строят сложные части во внешних 3D-пакетах и используют Hammer для assembly.

Source 2 Hammer получает более современную mesh-oriented работу:

- редактирование faces, edges и vertices;
- сложную геометрию без прежнего требования convex brushes;
- улучшенный viewport;
- интеграцию материалов и освещения;
- быстрый preview;
- game-specific entities и VR components;
- связь с Workshop publishing.

Это не превращает Hammer в полную замену Blender или Maya. Но граница между blockout, level geometry и художественной сборкой становится менее болезненной.

Half-Life: Alyx поставляется с набором Source 2 tools и обновлённым Hammer, включающим VR gameplay components. Community может строить environments и публиковать их через Workshop. Таким образом, заявленный в 2015 году creator focus реализовался — но через конкретный продукт, а не через единый независимый Source 2 SDK.

### Инструменты становятся отдельными представлениями одного content world

Source 2 toolset включает несколько специализированных сред:

- Hammer для levels;
- Material Editor;
- ModelDoc для моделей и их compile graph;
- Particle Editor;
- AnimGraph для animation state logic;
- Source 2 Filmmaker;
- Panorama tools для UI;
- asset browser и resource compiler.

Основное улучшение — не количество названий, а возможность быстрее видеть взаимное влияние изменений. Dota 2 Reborn отдельно подчёркивала live update assets в SFM viewport, более крупные миры и быстрый render. Когда материал, модель и сцена существуют внутри связанного toolchain, iteration loop сокращается.

### Panorama важнее, чем кажется по скриншоту

Для Dota 2 и Counter-Strike интерфейс является огромной частью продукта. Dashboard, inventory, spectator panels, tournament information, loadouts, post-match data и множество режимов меняются намного чаще, чем в линейной одиночной игре.

Panorama предоставляет декларативную, web-подобную модель построения UI с разметкой, стилями и scripting. Конкретный язык и API зависят от продукта, но архитектурная идея позволяет отделить интерфейс от старого монолитного game UI и быстрее производить новые экраны.

Игрок может не считать новый menu достижением engine. Для live service способность безопасно менять интерфейс каждую неделю иногда важнее дорогого shader effect.

### Rubikon возвращает физику под контроль Valve

Source 1 использовал Havok через собственный VPhysics layer. Source 2 перешёл к внутренней physics system, известной как **Rubikon**. Это даёт Valve контроль над интеграцией, determinism-related поведением, authoring tools, licensing и развитием технологии под собственные игры.

Значение проявляется не обязательно в более эффектном падении коробки. Собственная физика теснее связывается с gameplay, collision, animation, VR interaction и engine debugging. Half-Life: Alyx особенно требовала предсказуемого взаимодействия рук, объектов и окружения: в VR небольшая физическая неправдоподобность заметнее, потому что игрок сам выполняет движение.

### Half-Life: Alyx демонстрирует не только графику, но весь pipeline

В 2020 году Alyx стала первым большим single-player showcase Source 2. Высокодетализированные материалы, объёмный свет, частицы, интерактивные props и анимация рук создают чрезвычайно убедительный мир. Но результат нельзя приписать одной абстрактной мощности engine.

Качество складывается из:

- сильного art direction;
- тщательного asset production;
- ограниченного VR performance budget;
- baked и precomputed решений там, где они выгодны;
- физической интерактивности;
- внимания к масштабу и читаемости предметов;
- многолетнего playtesting;
- инструментов, позволявших быстро переделывать сцены.

Именно последний пункт соответствует исходному обещанию Source 2. Движок ценен не только финальным кадром, но числом итераций, которые команда успела сделать до него.

### Почему Source 2 не стала новым Unreal Engine

Анонс 2015 года создавал ожидание полноценного бесплатного engine для внешних разработчиков. Однако Source 2 так и не сформировалась в массовый generic middleware product уровня Unreal или Unity.

На практике доступ приходил фрагментами:

- Dota 2 Workshop Tools;
- Destinations и SteamVR-related tools;
- Half-Life: Alyx Workshop Tools;
- Counter-Strike 2 Workshop Tools;
- game-specific runtimes и API.

Этого достаточно для mods, maps, custom games и некоторых крупных внешних проектов, но не равно универсальному self-contained SDK с единым launcher, полным documentation corpus, predictable licensing, marketplace и масштабной technical support organization.

Причина не обязательно в технической неспособности. Engine licensing не является главным бизнесом Valve. Unreal существует как стратегическая платформа Epic; Unity строит компанию вокруг authoring environment. Valve в первую очередь делает собственные игры, Steam и hardware. Подготовка каждого внутреннего system к произвольным чужим pipelines могла бы снижать именно ту productivity, ради которой Source 2 создавалась.

Поэтому обещание «available for free to content developers» реализовалось уже и осторожнее, чем многие поняли в 2015 году. Бесплатные инструменты появились; универсальная независимая engine ecosystem — нет.

### L4D3 и Plantation: evidence прототипа, а не готовой игры

Кирилл помнит показанные или утёкшие примерно в 2013–2014 годах изображения заросшего здания и Plantation-like окружения. Они ассоциировались с L4D3 и ранними экспериментами Source 2, а по атмосфере напоминали заброшенный американский Юг или The Last of Us.

Такие материалы полезны как свидетельство:

- Valve тестировала новое поколение tools на знакомом content;
- Left 4 Dead environments подходили для проверки растительности, света, материалов и сложной геометрии;
- внутри компании существовали L4D-related prototypes или technology exercises.

Но screenshots не доказывают, что существовала почти готовая L4D3 с полной кампанией, утверждённым составом команды и близкой датой релиза. Engine test, greybox, art target и production game — разные стадии. Без прямого подтверждения участников правильная формулировка остаётся осторожной.

### Мнение Кирилла: визуальный скачок оказался слабее Source 1

Главный тезис:

> **Source 2 — слабый визуальный скачок относительно того, каким революционным ощущался Source 1.**

В 2004 году Source демонстрировала игроку физические объекты, facial animation, материалы, воду и персонажей как обещание нового поколения. Half-Life 2 строила сцены вокруг технологии, поэтому engine был заметен непосредственно в gameplay и маркетинге.

Source 2 пришла в другую эпоху. К середине 2010-х physically based rendering уже становился стандартом поколения PlayStation 4 и Xbox One. Само наличие современных материалов не производило эффекта, сопоставимого с Half-Life 2.

#### Старые движки могли выглядеть великолепно

Кирилл приводит **Dishonored 2012 года на Unreal Engine 3**:

> до сих пор выглядит ахуенно благодаря art direction.

Это хороший контраргумент технологическому фетишизму. Возраст engine не определяет автоматически итоговую картинку. Художественная иерархия, форма, свет, цвет и качество assets способны стареть лучше набора headline features.

#### Нельзя требовать технологии из будущего в 2015 году

На момент анонса Source 2 невозможно честно критиковать за отсутствие потребительских RTX, DLSS, Nanite или Lumen в современном виде. Эти технологии либо ещё не существовали публично, либо не сформировались как массовые продукты.

Но к 2020–2023 годам Source 2 уже не выглядела engine, который единолично задаёт графическую повестку. Nvidia продвигала hardware ray tracing и DLSS; Epic демонстрировала Nanite и Lumen как ясные публичные тезисы Unreal Engine 5. У Valve не появилось столь же легко объяснимой headline technology.

#### Alyx прекрасна, но не доказывает универсальное превосходство engine

Half-Life: Alyx выглядит великолепно благодаря art, материалам, свету, VR-масштабу, интерактивности и polish. Из этого не следует, что любой проект на Source 2 автоматически визуально превосходит конкурентов.

Точно так же Counter-Strike 2 демонстрирует сильные dynamic smokes, освещение и материалы, но его главная задача — сохранить высокочастотный competitive shooter, а не победить single-player blockbusters в screenshot contest.

### Source 1 продавала эффект, Source 2 — возможность итерации

Итоговую разницу лучше формулировать не как «старый engine хороший, новый плохой», а как смену адресата революции.

Source 1 громко показывала будущее игроку:

- физическая сцена;
- лицо персонажа;
- вода и материалы;
- постановка без традиционных cutscenes.

Source 2 в первую очередь меняет ежедневную работу автора:

- быстрее импортировать и пересобирать;
- редактировать более сложную геометрию;
- видеть материал и свет в контексте;
- обслуживать огромный UI;
- переносить live products;
- связывать Workshop с официальным pipeline;
- развивать собственную physics и networking foundation.

Формула Кирилла остаётся точной:

> **Source 1 продавал будущее игроку. Source 2 в первую очередь продаёт удобство разработчику Valve.**

Это не делает Source 2 слабым движком. Это объясняет, почему его главное достижение труднее показать одним трейлером.

### Главный итог

> **Source 2 не была одним моментом смены поколений. Valve сначала переписала под неё живую Dota 2, затем годами проверяла VR, authoring tools и новые продукты, после чего перенесла Counter-Strike. Движок не стал массовым конкурентом Unreal и не повторил визуальный шок Half-Life 2, зато решил более фундаментальную для современной Valve задачу: сократил стоимость создания, изменения и многолетнего обслуживания content.**

---
