# Гейб Ньюэлл — Глава 7. Независимость: Windows, Linux, VR и собственное железо

> 2012–2020-е: период, когда Ньюэлл окончательно перестаёт воспринимать Windows, чужое железо и обычный монитор как неизбежные фундаментальные слои PC. Его главный страх — зависимость Valve от чужого gatekeeper. Из этого рождаются Linux, SteamOS, Steam Machines, Proton, Steam Controller, Vive, Index и Steam Deck. Большинство этих направлений нельзя понять как отдельные продукты: для Ньюэлла это одна длинная попытка уменьшить зависимость Steam от слоёв, которые Valve не контролирует.

---

## 1. После Steam Ньюэлл впервые оказался в странной позиции

К началу 2010-х Valve уже была совсем не той компанией, которая существовала в 1998 году.

Тогда:

```text
Valve
=
game developer
```

Теперь:

```text
Valve
=
game developer
+
publisher
+
store
+
account system
+
update infrastructure
+
community platform
+
payments
+
developer services
```

Steam стал огромным активом.

Но именно успех Steam создавал новую проблему.

Он работал в основном поверх **Windows**.

Упрощённо:

```text
USER
↓
STEAM
↓
WINDOWS
↓
HARDWARE
```

Valve могла контролировать:

- Steam client;
- store;
- library;
- updates;
- Steamworks;
- account system.

Но фундаментальный нижний слой принадлежал Microsoft.

И это означало:

# Valve построила платформу поверх чужой платформы.

Для Ньюэлла это очень неудобная архитектура.

---

## 2. Он уже видел этот тип зависимости раньше

В 1990-х Valve зависела от publisher.

```text
GAME
↓
PUBLISHER
↓
RETAIL
↓
CUSTOMER
```

Сначала publisher был полезным слоем.

Sierra давала:

- retail access;
- marketing;
- manufacturing;
- distribution.

Потом dependency стала source of conflict.

Steam в значительной степени был попыткой убрать посредника:

```text
VALVE
↓
CUSTOMER
```

Но теперь появился ещё более глубокий layer:

```text
VALVE
↓
WINDOWS
↓
CUSTOMER'S PC
```

Publisher можно обойти собственной digital distribution.

Operating system обойти намного сложнее.

Именно поэтому Windows risk Ньюэлл воспринимал намного серьёзнее обычного business competition.

---

## 3. Windows 8 как trigger, а не вся причина

В 2012 году Ньюэлл публично назвал Windows 8:

> **a catastrophe for everyone in the PC space.**

Формулировка была резкой.

И, как мы уже разобрали в предыдущей главе, ближайший катастрофический сценарий в таком масштабе не реализовался.

Windows 8:

- не запретила обычные Win32 applications;
- не уничтожила Steam;
- не закрыла desktop PC;
- не превратила мгновенно Windows в iOS-подобную систему.

Но для Ньюэлла важнее был не конкретный release.

Его пугал **direction of travel**.

Microsoft одновременно контролировала:

```text
OS
+
application model
+
Store
+
payments
+
certification
```

Windows RT особенно хорошо показывала, как может выглядеть более закрытая версия будущего.

То есть question Newell:

# что произойдёт, если владелец нижнего слоя однажды решит, что competing store наверху ему не нужен?

---

## 4. Platform-on-platform risk

Это одна из центральных концепций зрелого Ньюэлла.

Условно:

```text
STEAM
=
platform
```

Но:

```text
STEAM
работает
внутри другой platform
```

Следовательно, абсолютной независимости нет.

Если нижний owner меняет rules:

```text
Steam
может пострадать
```

Даже если этого никогда не произойдёт, existence такого risk влияет на strategy.

Newell не обязан считать:

```text
Microsoft завтра
запретит Steam
```

Достаточно:

```text
Valve не должна
существовать
только с разрешения Microsoft
```

Это очень сильная долгосрочная мотивация.

---

## 5. Linux как insurance policy

Из этого рождается один из самых странных bets Valve начала 2010-х.

**Linux.**

На тот момент desktop Linux занимает tiny долю gaming market.

Большинство PC games:

```text
Windows-first
```

GPU drivers проблемнее.

Commercial support ограничен.

Developers не хотят портировать game ради маленькой audience.

С точки зрения short-term ROI идея выглядит почти нелепо.

Newell и сам описывал её как **hedging strategy**.

То есть:

```text
не:
Linux завтра
победит Windows

а:
у Valve должен
существовать технически
реальный альтернативный путь
```

Это очень важное различие.

---

## 6. Hedge ценен даже если catastrophe не происходит

Страховка не обязана превращаться в основной дом.

Если:

```text
P(опасность)
не очень велика
```

но:

```text
Impact
экзистенциальный
```

то investment всё равно может быть рациональным.

В этом смысле Newell не обязан был оказаться прав насчёт Windows 8 как ближайшей catastrophe.

Ему было достаточно оказаться правым в другом:

```text
одна external dependency
слишком сильна
для strategic comfort
```

Linux уменьшал зависимость.

Даже если 90% Steam users оставались на Windows.

---

## 7. Первые Linux-порты — проверить, что фундамент вообще жизнеспособен

Valve начинает переносить Steam и собственные games на Linux.

Одним из ключевых early experiments становится **Left 4 Dead 2**.

Цель была не только:

```text
продать L4D2
Linux users
```

Инженеры исследовали весь stack:

```text
GAME
↓
ENGINE
↓
GRAPHICS API
↓
DRIVER
↓
LINUX
↓
HARDWARE
```

Valve работала с:

- NVIDIA;
- AMD;
- Intel;
- graphics-driver ecosystem.

В одном из известных внутренних performance experiments optimized Linux/OpenGL build L4D2 на конкретной test machine показывал результаты выше Windows/Direct3D 9.

Это часто превращали в headline:

> Linux быстрее Windows.

Такой вывод слишком сильный.

Для Newell важен был более скромный proof:

# Linux не обязан быть performance dead end для high-end PC gaming.

---

## 8. Главная проблема была не FPS

Даже если Source game прекрасно работает на Linux, остаётся намного большая проблема.

Steam value создаётся не только Valve games.

Она создаётся всей library.

```text
Valve portирует
свои titles
↓
хорошо

НО

что делать
с тысячами Windows games
других studios?
```

Появляется classic chicken-and-egg:

```text
мало Linux users
↓
developers
не портируют games
↓
мало games
↓
users
не переходят на Linux
↓
мало Linux users
```

Нативные ports полезны.

Но стратегически они не решают scale problem.

---

## 9. SteamOS — попытка контролировать больше stack

В 2013 году Valve объявляет **SteamOS**.

Важно понимать, зачем Newell вообще нужна operating system.

На Windows Valve контролирует:

```text
Steam
```

На собственной Linux-based environment она потенциально может влиять на:

- compositor;
- update model;
- input stack;
- graphics stack;
- performance;
- system UX;
- driver collaboration;
- game compatibility.

То есть:

```text
GAME
↓
STEAM
↓
STEAMOS
↓
LINUX
↓
HARDWARE
```

даёт Valve значительно больше control над end-to-end experience.

Но Newell не хотел превращать SteamOS в закрытую console OS.

И здесь начинается одна из главных tensions всей стратегии:

# как получить integrated product control, не превратив систему в новый closed gatekeeper?

---

## 10. Steam Machines — первый ответ оказался слишком идеологическим

Valve не хотела сделать одну собственную console.

Вместо этого идея была:

```text
STEAMOS
+
много OEM
+
конкуренция hardware vendors
```

Alienware.

Zotac.

CyberPower.

Falcon Northwest.

Другие manufacturers.

В теории Newell model выглядела очень знакомо.

Windows ecosystem:

```text
одна software platform
+
много PC makers
```

Steam Machines должны были повторить это в living room.

---

## 11. Почему идея выглядела логично именно Ньюэллу

Человек после Microsoft естественно мог верить:

```text
multiple manufacturers
↓
competition
↓
разные price points
↓
innovation
↓
user choice
```

То есть Newell пытался получить преимущества PC ecosystem без Windows dependency.

Это не была случайная hardware whim.

Это прямое продолжение его platform theory.

Проблема в том, что living-room consumer хотел совсем другую value.

---

## 12. Consumer не покупает ecosystem theory

Console buyer задаёт очень простой вопрос:

```text
что купить?
```

Для PlayStation:

```text
PlayStation
```

Для Xbox:

```text
Xbox
```

Для Steam Machine:

```text
какого vendor?

какой CPU?

какой GPU?

сколько RAM?

какая цена?

почему эта стоит $500,
а эта $1500?

какие games работают?
```

То есть product promise:

```text
PC gaming
с console convenience
```

стал:

```text
PC complexity
на телевизоре
```

Это фундаментальный product failure.

---

## 13. Openness не превратилась автоматически в customer value

Newell долго воспринимал openness как structural advantage.

И часто это правда.

Но Steam Machines дали неприятный lesson:

```text
OPENNESS
≠
SIMPLICITY
```

И:

```text
CHOICE
≠
CLARITY
```

Если user должен изучить architecture ecosystem, чтобы понять, что купить, freedom превращается во friction.

Это один из самых важных conceptual steps от Steam Machines к Steam Deck.

---

## 14. Вторая проблема — library

В 2015 году Proton ещё нет.

Если game существует только как Windows binary:

```text
SteamOS
↓
не гарантирует,
что она запустится
```

То есть Newell фактически предлагал Steam user:

```text
купи новое device
для Steam

↓

но часть
твоей Steam library
на нём не работает
```

Для platform, чья главная value — огромная накопленная library, это почти смертельная contradiction.

---

## 15. Native ports не могли решить проблему масштаба

Чтобы сделать SteamOS полноценной platform через native support, нужно было:

```text
Developer 1
→ Linux port

Developer 2
→ Linux port

Developer 3
→ Linux port

...

Developer 10000
→ Linux port
```

Valve не контролирует эти decisions.

Особенно если Linux audience маленькая.

То есть strategic problem оказывается не столько technical, сколько organizational:

# как убедить тысячи независимых компаний сделать работу, economic incentive для которой пока слабый?

Это очень плохой type problem для Valve.

Newell гораздо комфортнее там, где dependency можно превратить в engineering problem.

---

## 16. Wine меняет форму вопроса

Wine существовал задолго до Valve.

Его фундаментальная идея:

```text
WINDOWS APPLICATION
↓
ожидает Windows APIs

WINE
↓
реализует эти APIs
на другой OS
```

Для games этого недостаточно.

Нужны:

- graphics translation;
- compatibility patches;
- game-specific fixes;
- launcher handling;
- input;
- multimedia;
- anti-cheat cooperation.

Но conceptual opportunity огромна.

Вместо:

```text
убедить каждого developer
сделать Linux port
```

можно спросить:

# можно ли сделать Linux достаточно совместимым с Windows software, чтобы existing library работала сама?

Это совершенно другой scale of leverage.

---

## 17. Proton — организационная проблема превращается в engineering problem

В **2018 году** Valve выпускает **Proton** внутри Steam Play.

Упрощённо:

```text
WINDOWS GAME
↓
Win32 / DirectX expectations
↓
PROTON / WINE
+
DXVK / vkd3d-proton
↓
LINUX / VULKAN
↓
GPU
```

Для Newell это почти идеальный стратегический move.

До Proton:

```text
тысячи developers
должны принять
тысячи business decisions
```

После:

```text
Valve + open-source ecosystem
решают compatibility
на common layer
```

Один improvement в layer способен помочь множеству games.

Это чистый leverage.

---

## 18. Анти-NIH снова оказывается критическим

Важно, что Valve не пишет всю compatibility technology сама с нуля.

Она работает с:

- Wine;
- CodeWeavers;
- DXVK;
- open-source contributors;
- graphics ecosystem;
- Linux communities.

То есть снова работает старый principle Newell:

```text
если сильный foundation
уже существует

↓

усиль его

а не переписывай
ради ownership ego
```

Quake engine в 1996.

Wine/Proton ecosystem в 2010-х.

Логика удивительно последовательна.

---

## 19. Vulkan как strategic bridge

DirectX исторически тесно связан с Windows.

Linux-compatible gaming нуждается в другом graphics route.

Vulkan становится важной частью stack.

Не потому, что Newell хочет уничтожить DirectX как technology.

А потому что:

```text
WINDOWS GAME
↓
DirectX assumptions
↓
translation
↓
Vulkan
↓
Linux
```

уменьшает hard binding:

```text
game binary
=
Windows OS
```

Again:

# задача не обязательно заменить весь software ecosystem; достаточно уменьшить switching cost нижнего layer.

---

## 20. Proton важнее Steam Machines

Коммерческий hardware product Steam Machines исчез.

Proton меняет гораздо более глубокий constraint.

Steam Machines пытались убедить пользователя:

```text
прими Linux box
с ограниченной library
```

Proton пытается сделать так:

```text
user вообще
не обязан думать,
что игра Windows-oriented
```

Это принципиально сильнее.

Openness перестаёт быть homework пользователя.

Она становится implementation detail.

Именно это будет одной из главных побед Steam Deck.

---

## 21. Но до Deck Valve ещё должна научиться делать hardware

Newell постепенно понимает ещё одну проблему.

Если company контролирует software, но consumer device делает external OEM:

```text
кто отвечает
за final experience?
```

Vendor отвечает за:

- thermals;
- noise;
- component choice;
- industrial design.

Valve:

- OS;
- Steam;
- input;
- compatibility.

Driver vendor:

- graphics stack.

Game developer:

- performance.

Когда всё ломается:

```text
user всё равно
видит один product
```

Но ownership качества размазан.

Steam Machines показали цену такой architecture.

---

## 22. Steam Controller — неудачный product и важный R&D project одновременно

Valve пыталась решить фундаментальную input problem PC gaming.

PC library исторически предполагает:

```text
mouse
+
keyboard
```

Living room предполагает:

```text
controller
```

Обычный Xbox-style pad прекрасно работает для:

- action;
- racing;
- platformers;
- many shooters.

Но плохо заменяет mouse-heavy interfaces:

- strategy;
- old PC games;
- cursor-based UI.

Valve делает **Steam Controller**.

Trackpads.

Gyro.

Haptics.

Rear inputs.

Software remapping.

---

## 23. Сильная сторона Steam Controller стала его слабостью

Device был чрезвычайно flexible.

Trackpad мог быть:

- mouse;
- trackball;
- joystick;
- directional input.

Gyro можно было включать отдельно.

Community делала configs.

Steam Input abstraction позволяла адаптировать огромное количество games.

Но:

```text
FLEXIBILITY
↑

↓

LEARNING COST
↑
```

Для enthusiast это интересный instrument.

Для человека, который хочет:

```text
взял controller
↓
играю
```

может быть лишней работой.

Newell снова получает lesson:

# powerful system должна иметь сильный default.

Поздний Steam Deck буквально встроит этот вывод в hardware.

---

## 24. Не заменить привычное, а добавить новое

Steam Controller пытался сделать trackpads центральным элементом устройства.

Deck позже выберет более консервативный design.

Он сохраняет:

- sticks;
- D-pad;
- ABXY;
- triggers.

И добавляет:

- trackpads;
- gyro;
- rear buttons.

То есть:

```text
старое muscle memory
остаётся

+

новые possibilities
добавляются
```

Это очень важный product maturation.

Newell не отказывается от experimental input thesis.

Он перестаёт заставлять mass user принимать её как обязательный новый baseline.

---

## 25. Steam Link — намного более ясная problem statement

В 2015 году рядом со Steam Machines появляется **Steam Link**.

Его proposition очень понятный:

```text
у тебя уже есть gaming PC

↓

хочешь играть
на TV в другой комнате?

↓

stream туда
```

Это намного проще, чем:

```text
купи второй PC
под SteamOS
```

И в каком-то смысле Steam Link конкурировал с самой Steam Machine.

Для многих users:

```text
Steam Link
≈ $50
```

решал living-room problem лучше, чем:

```text
новая Steam Machine
≈ сотни долларов
```

Это ещё один lesson:

# иногда best solution находится выше stack и требует меньше нового hardware.

Physical Steam Link потом исчезнет.

Streaming technology останется.

Again:

```text
PRODUCT
может умереть

CAPABILITY
остаётся
```

---

## 26. VR — другая линия той же obsession

На первый взгляд VR не связан с Windows/Linux strategy.

Но для Newell связь глубже.

Его интересует любой layer, который ограничивает взаимодействие человека и software.

Обычная PC architecture:

```text
HUMAN
↓
mouse / keyboard / controller
↓
monitor / speakers
↓
SOFTWARE
```

VR меняет сразу несколько links.

```text
HEAD
HANDS
BODY
↓
TRACKING
↓
VIRTUAL WORLD
```

То есть problem уже не:

```text
какая OS?
```

А:

# почему компьютер вообще обязан взаимодействовать с человеком через прямоугольный экран и несколько buttons?

Это следующий слой abstraction.

---

## 27. Michael Abrash возвращается

В 2011 году **Michael Abrash** приходит в Valve.

Человек, который:

```text
Microsoft
↓
id / Quake
↓
помог рождению Valve
```

теперь возвращается на следующем frontier.

```text
Valve
↓
VR research
```

Для биографии Newell это почти идеальный circle.

Abrash снова оказывается человеком, который способен объяснить организации:

```text
вот новый technological space,
который может
радикально изменить computing
```

---

## 28. VR интересует Ньюэлла не как accessory

Newell не воспринимал headset как:

```text
ещё один gaming peripheral
```

Гораздо ближе:

```text
новый human-computer interface
```

Если monitor ограничивает:

- field of view;
- spatial presence;
- natural movement;

VR потенциально меняет сам relationship:

```text
user
↔
software
```

Именно поэтому Valve инвестировала в:

- latency;
- tracking;
- optics;
- low persistence;
- spatial interaction;
- controller design.

Не просто в:

```text
больше resolution
```

---

## 29. Presence — новая версия старого player acknowledgment

Первая Half-Life спрашивала:

```text
world
замечает player?
```

VR радикально усиливает expectation.

Если человек:

```text
физически
протянул руку
```

и virtual object не реагирует правдоподобно:

```text
illusion рушится
```

То есть старый Newell principle:

```text
ACTION
↓
SYSTEM RESPONSE
```

становится ещё более требовательным.

Это одна из причин, почему Half-Life philosophy так хорошо подходит VR.

---

## 30. Oculus сначала был партнёром, а не врагом

Ранняя современная VR scene была маленькой.

Valve и Oculus обменивались knowledge.

John Carmack экспериментировал с Doom 3 VR.

Palmer Luckey строил Oculus prototypes.

Newell публично поддерживал Oculus Kickstarter.

Valve показывала собственные research systems.

Это был период:

```text
frontier
ещё важнее
market competition
```

И опять Newell предпочитал расширять общий possibility space, а не просто закрывать весь research внутри Valve.

---

## 31. Valve Room показывает, насколько глубоко company ушла в problem

Valve экспериментировала с очень точным room-scale tracking.

Большая test environment позволяла исследовать:

- head tracking;
- latency;
- low persistence;
- positional accuracy;
- presence.

Это снова типичный Newell pattern:

```text
не спрашивать:
как улучшить существующий headset?

а:
какие bottlenecks
вообще мешают brain
поверить virtual world?
```

То есть problem decomposes по слоям.

---

## 32. Уход Abrash и Binstock в Oculus — ещё один тест philosophy

После покупки Oculus Facebook часть ключевых людей Valve VR переходит туда.

Michael Abrash.

Atman Binstock.

Для обычной company это может вызвать вывод:

```text
зря делились knowledge
```

Valve не закрывает направление.

Она продолжает SteamVR и строит partnership с HTC.

Это важная характеристика Newell.

Он часто предпочитает:

```text
ecosystem grows
```

даже если часть созданной value уходит другим companies.

Логика platform owner отличается от логики single-product vendor.

---

## 33. HTC Vive — Valve снова строит platform layer, а не только device

В 2015 году объявляется **HTC Vive**.

HTC приносит:

- hardware manufacturing;
- consumer electronics experience.

Valve:

- SteamVR;
- tracking;
- input research;
- software ecosystem.

Newell снова использует partnership:

```text
мы не обязаны
делать весь stack сами
```

Но Steam Machines уже показали, что external hardware partner ограничивает end-to-end control.

Поэтому Vive станет промежуточным этапом, а не финальной формой Valve hardware.

---

## 34. Lighthouse — очень ньюэлловская technology

SteamVR Tracking / Lighthouse интересна не только как способ трекать headset.

Valve пыталась создать reusable infrastructure:

```text
TRACKING SYSTEM
↓
headsets
controllers
other devices
```

И лицензировать/открывать её для других manufacturers.

Again:

```text
не один product

а

layer,
на котором
могут строить другие
```

Это тот же instinct:

```text
Windows
Steam
Steamworks
Workshop
```

только применённый к пространственному tracking.

---

## 35. Ньюэлл спокойно допускал, что VR вообще провалится

Это одна из наиболее зрелых его публичных позиций.

В 2017 году Newell говорил примерно:

```text
VR может
не стать mass market

и это нормально
```

Почему Valve всё равно инвестирует?

Потому что potential upside достаточно большой, а experiment достаточно informative.

То есть зрелый Newell уже не говорит:

```text
это неизбежное будущее
```

Скорее:

```text
это hypothesis
с огромным upside

↓

её стоит проверить
```

После Steam Machines и других failures такой язык особенно важен.

---

## 36. Дешёвый VR сам по себе ничего не решает

Newell также критиковал упрощённую market logic:

```text
снизим price
↓
VR станет массовым
```

Для него главный question:

# есть ли experience, ради которого человек вообще хочет надеть headset?

Если ответ:

```text
не особо
```

то более дешёвый mediocre VR не создаёт автоматически giant market.

Это всё тот же product principle:

```text
ACCESSIBILITY
не заменяет
REASON TO EXIST
```

Именно поэтому Valve eventually концентрирует game effort вокруг Half-Life: Alyx.

---

## 37. Valve Index — когда external hardware уже недостаточно

В **2019 году** появляется **Valve Index**.

Это принципиальный шаг.

Vive:

```text
Valve + HTC
```

Index:

```text
Valve
берёт гораздо больше
end-to-end responsibility
```

Теперь company отвечает за:

- optics;
- audio;
- controllers;
- tracking integration;
- ergonomics;
- manufacturing decisions.

То есть после Steam Machines Newell не делает вывод:

```text
hardware нам не нужен
```

Он делает почти противоположный:

# чтобы контролировать customer experience, нужно научиться hardware самим.

---

## 38. Index Controllers продолжают старую obsession с intent

Knuckles / Index Controllers пытались уменьшить distance:

```text
человек хочет
схватить предмет

↓

нажимает abstract trigger

↓

virtual hand "хватает"
```

к:

```text
человек
физически сжимает пальцы

↓

virtual hand
повторяет действие
```

Again:

```text
HUMAN INTENTION
↓
SYSTEM RESPONSE
```

Это тот же core pattern, который тянется от раннего player acknowledgment.

Только interface становится всё ближе к телу.

---

## 39. VR естественно ведёт Ньюэлла к BCI

Если идти по layers:

```text
keyboard
↓
mouse
↓
controller
↓
tracked hands
↓
body
↓
eye tracking
↓
physiological signals
↓
nervous system
```

становится понятно, почему BCI не возникает в биографии Newell как случайное billionaire hobby.

VR задаёт вопрос:

```text
как computer
лучше понимает,
что делает человек?
```

BCI радикализирует его:

```text
может ли computer
понимать state
человека напрямую?
```

И:

```text
может ли interface
работать не только
через muscles?
```

Эту линию полноценно разберём в поздней главе про Starfish.

Но intellectually она начинается здесь.

---

## 40. Steam Deck — место, где десятилетие неудач наконец собирается в один coherent product

**Steam Deck** нельзя понять как внезапную идею:

```text
Nintendo Switch популярен
↓
Valve сделала handheld
```

У продукта огромная предыстория.

```text
STEAM MACHINES
↓
SteamOS / Linux lessons

STEAM CONTROLLER
↓
Steam Input
trackpads
gyro

STEAM LINK
↓
streaming / living-room experience

PROTON
↓
Windows game compatibility

INDEX
↓
hardware engineering
manufacturing
support

↓

STEAM DECK
```

Deck — почти музей переработанных ошибок Valve.

Именно поэтому он настолько важен для биографии Newell.

---

## 41. Deck — анти-Steam Machine

Сравнение особенно чистое.

### Steam Machines

```text
много OEM
↓
много configurations
↓
неясный performance target
↓
неполная library
↓
непонятная identity
```

### Steam Deck

```text
один reference device
↓
ясный performance envelope
↓
SteamOS
↓
Proton
↓
Steam Input
↓
единый default UX
```

Valve сохраняет openness.

Но больше не outsourcing coherence.

Это зрелый ответ на предыдущий failure.

---

## 42. End-to-end control ≠ lock-in

Это, возможно, одна из самых зрелых форм Newell philosophy.

Steam Machines пытались получить openness через fragmentation.

Deck получает coherence через Valve-controlled product.

Но user всё ещё может:

- войти в desktop mode;
- устанавливать сторонний software;
- использовать другие stores;
- модифицировать system;
- даже поставить другую OS.

Получается:

```text
STRONG DEFAULT
+
USER OPTIONALITY
```

Это гораздо более тонкая architecture, чем старое:

```text
more vendors
=
more freedom
```

Newell научился разделять два понятия:

```text
PRODUCT CONTROL
```

и:

```text
USER CONTROL
```

Они не обязаны быть противоположностями.

---

## 43. Openness становится option, а не обязанностью

Steam Machines в каком-то смысле заставляли user столкнуться с platform ideology.

Deck делает наоборот.

Обычный человек:

```text
POWER
↓
STEAM
↓
PLAY
```

Advanced user:

```text
desktop
terminal
other software
mods
alternative stores
```

Это ключевой product maturation.

Freedom существует.

Но user не обязан быть Linux enthusiast, чтобы ею воспользоваться.

То есть:

# хороший open system не должен заставлять обычного пользователя страдать ради openness.

Это очень сильный вывод из десятилетней серии experiments.

---

## 44. Proton превращает platform independence в invisible consumer feature

До Deck Linux work выглядела абстрактно:

- Mesa;
- Vulkan;
- Wine;
- DXVK;
- drivers;
- kernel;
- compositor.

Deck превращает всё это в простое user value:

```text
нажал Install
↓
Windows-oriented game
↓
работает
на Linux handheld
```

User может вообще не знать:

```text
что под ним
не Windows
```

Это почти идеальное воплощение Newell philosophy:

# infrastructure должна уменьшать complexity для человека, а не демонстрировать собственную сложность.

---

## 45. Deck доказывает, что Steam Machines были не обязательно «неправильной идеей»

Ретроспективно линия выглядит так:

```text
THESIS:
Valve нужна
собственная PC environment

↓

IMPLEMENTATION 1:
Steam Machines
→ плохо

↓

technology / lessons
сохраняются

↓

IMPLEMENTATION 2:
Steam Deck
→ значительно сильнее
```

Это важнейшее подтверждение любимого distinction Newell:

```text
bad implementation
≠
bad thesis
```

Но есть важная оговорка.

Мы знаем это только потому, что вторая попытка действительно сработала.

Если бы Deck тоже провалился, narrative выглядел бы намного менее красиво.

---

## 46. Painful pricing — hardware как platform investment

При запуске Deck Newell называл стартовую цену **$399** painful.

Это важная формулировка.

Valve могла сделать:

```text
дорогой enthusiast device
```

с более комфортной margin.

Но если цель:

```text
создать новую
PC gaming category
```

цена становится частью platform strategy.

```text
больше users
↓
больше developer attention
↓
лучше compatibility
↓
category сильнее
↓
Steam полезнее
```

То есть hardware unit margin не обязательно главный economic metric.

Valve выигрывает ещё и через ecosystem.

Это очень Microsoft/Steam-like thinking, применённое к физическому устройству.

---

## 47. Hardware для Ньюэлла становится способом защитить software freedom

На раннем этапе:

```text
Valve
делает software
для чужих PCs
```

После Deck:

```text
Valve
может определить
reference hardware,
OS,
input,
store,
compatibility stack
```

Это почти полная вертикальная интеграция.

Но Newell пытается оставить открытым final user layer.

То есть зрелая architecture:

```text
Valve контролирует
достаточно stack,
чтобы гарантировать
coherent default

НО

не пытается
запретить user
уйти за пределы default
```

Именно это отличает Deck от обычной console philosophy.

---

## 48. Почему Ньюэлл не хочет стать новым Microsoft

Здесь появляется интересный парадокс.

В 2012 он боится:

```text
Microsoft
контролирует OS
+
Store
```

К 2022 Valve сама контролирует на Deck:

```text
hardware
+
OS
+
store
+
input
+
compatibility
```

Почему это для Newell не противоречие?

Потому что его definition openness не равно:

```text
никто ничего
не контролирует
```

Скорее:

# user и competing software не должны зависеть от единственного permission gate.

Deck default — Steam.

Но system не требует:

```text
только Steam
```

В его worldview difference именно здесь.

---

## 49. Конечно, Valve всё равно является gatekeeper в других слоях

Не надо принимать self-image Newell без критики.

Steam:

- proprietary;
- централизованный marketplace;
- управляет store rules;
- контролирует discovery systems;
- владеет account infrastructure;
- имеет огромную market power.

То есть:

```text
Valve
не является
абсолютно open actor
```

Newell's openness всегда практическая и селективная.

Он особенно защищает:

```text
право конкурирующего software
существовать на machine
```

Это не означает:

```text
все технологии Valve
должны быть open-source
```

или:

```text
platform power не существует
```

Это важное ограничение.

---

## 50. Steam Deck одновременно завершает и не завершает Windows hedge

После Deck можно сказать:

```text
Valve доказала,
что способна продавать
массовое gaming device,
не использующее Windows
```

Это огромный strategic achievement.

Но:

```text
основной PC Steam market
всё ещё преимущественно Windows
```

То есть цель не:

```text
победить Microsoft
```

А:

```text
иметь credible alternative
```

В этом смысле hedge уже работает.

Valve больше не должна теоретически начинать с нуля, если Windows relationship когда-нибудь станет проблемой.

У неё есть:

- SteamOS;
- Proton;
- Linux graphics stack experience;
- hardware;
- installed devices;
- developer relationships.

Optionality стала реальной, а не PowerPoint.

---

## 51. Главная победа — dependency перестала быть binary

До Linux work architecture была почти:

```text
Steam
→ Windows
```

После:

```text
Steam
├─ Windows
└─ Linux / SteamOS
```

Это не требует, чтобы Linux стала majority.

Главное:

```text
external dependency
перестала быть
единственной возможностью
```

Для человека, вся карьера которого состоит из удаления bottlenecks, это очень глубокая победа.

---

## 52. От Windows к BCI — одна и та же привычка спускаться на слой ниже

Если посмотреть на эту фазу карьеры без product names:

```text
Steam ограничен OS
↓
работаем с OS

OS ограничена hardware ecosystem
↓
делаем hardware

hardware interaction
ограничена controller/monitor
↓
исследуем VR

VR interaction
ограничена sensory/motor interface
↓
интересуемся BCI
```

Это почти идеальная реализация основной формулы Newell:

# если верхний layer ограничен нижним, спускайся ниже.

Именно поэтому Linux, Deck и BCI не выглядят совершенно разными chapters его жизни.

Они логически связаны.

---

## 53. Что Ньюэлл понял за десятилетие platform independence

Можно выделить несколько lessons.

### 1. Нельзя строить критический business на единственной external permission

```text
DEPENDENCY
=
strategic risk
```

### 2. Hedge не обязан заменить основной platform

Linux полезна даже без победы над Windows.

### 3. Native support не масштабируется, если ecosystem incentive слабый

Compatibility layer может иметь больший leverage.

### 4. Openness без coherent default создаёт friction

Steam Machines.

### 5. Powerful input без familiar baseline ограничивает mass adoption

Steam Controller.

### 6. Hardware quality требует clear ownership

Index и Deck.

### 7. Integrated product не обязан быть closed product

Steam Deck.

### 8. Неудачный product может оставить valuable infrastructure

Steam Machines → SteamOS.

Steam Controller → Steam Input.

Steam Link → Remote Play.

### 9. User не должен изучать идеологию architecture

Лучший infrastructure исчезает под хорошим UX.

---

## 54. В этой линии особенно хорошо видно, как Newell изменился после прежних ошибок

Ранняя версия Newell могла думать:

```text
open ecosystem
сам по себе
создаст лучший result
```

Steam Machines показали:

```text
нет
```

Зрелая версия:

```text
нужен
strong integrated default

+

право пользователя
уйти за его пределы
```

Это очень значимая интеллектуальная коррекция.

Он не отказался от исходной ценности.

Он изменил её implementation.

---

## 55. И всё же привычка делать большие ставки никуда не исчезла

Linux в 2012 выглядела почти безумно как business priority.

VR мог полностью провалиться.

Steam Machines действительно провалились.

Index был дорогим niche hardware.

Deck требовал:

- custom hardware;
- OS;
- compatibility;
- manufacturing;
- distribution;
- support.

То есть Newell не стал conservative.

Он просто научился строить long-term technology stack так, чтобы:

```text
неудача одного product
не убивала
всю стратегию
```

Это одна из самых важных зрелых capabilities Valve.

---

# Итог главы

В начале этой фазы Ньюэлл обнаруживает неприятную архитектуру:

```text
STEAM
↓
WINDOWS
↓
MICROSOFT
```

То есть крупнейший актив Valve зависит от layer, который контролирует другая компания.

Его ответ растягивается больше чем на десятилетие:

```text
WINDOWS 8 FEAR
↓
LINUX
↓
STEAM FOR LINUX
↓
STEAMOS
↓
STEAM MACHINES
↓
FAILURE
↓
STEAM INPUT
↓
WINE / PROTON
↓
VR
↓
INDEX
↓
STEAM DECK
```

Самый важный результат даже не конкретный device.

Newell постепенно учится совмещать две вещи, которые раньше часто конфликтовали:

```text
COHERENT DEFAULT
+
OPEN EXIT
```

Steam Machines слишком сильно полагались на openness и ecosystem fragmentation.

Traditional consoles дают coherent default ценой closed platform.

Deck пытается взять:

```text
console-like clarity
```

и:

```text
PC-like permission
```

одновременно.

Это одна из самых зрелых product formulations всей его карьеры.

И параллельно VR снова сдвигает его внимание ниже по stack:

```text
OS
↓
hardware
↓
input
↓
body
↓
nervous system
```

Поэтому следующая личная фаза Ньюэлла уже не укладывается в рамки «руководителя игровой компании».

Чтобы её понять, надо наконец отойти от Valve как business и посмотреть на самого человека:

- семью;
- детей;
- здоровье;
- игровую привычку;
- отношение к образованию;
- foundry10;
- публичный email;
- GabeN;
- личный стиль общения;
- опыт потери зрения.

Следующая глава — **Сам Ньюэлл: семья, игры, здоровье, образование и публичный образ**.

---

# Опорные источники

## Исходное исследование

- `Gabe Newell.md` — исходная пользовательская база, прежде всего главы о Windows 8, Linux, SteamOS, Proton, Steam Machines, Steam Controller, VR, Index и Steam Deck.

## Windows 8 / Linux

- Ars Technica — **Valve’s Newell: Windows 8 “catastrophe” driving Valve to embrace Linux**
  https://arstechnica.com/gaming/2012/07/steams-newell-windows-8-catastrophe-driving-valve-to-embrace-linux/

- Valve / Steam for Linux materials — ранние Linux-порты, Steam client и SteamOS.

## Proton / compatibility

- Valve — **Steam Play / Proton**
  https://github.com/ValveSoftware/Proton

- CodeWeavers / Wine ecosystem materials — участие в compatibility development.

- DXVK / vkd3d-proton open-source projects — graphics translation layer, используемый Proton.

## Steam Machines / Steam Controller

- Valve — **Steam Universe announcements**, 2013.
- Valve — Steam Controller documentation / Steam Input documentation.
- Материалы Valve и hardware partners о Steam Machines 2013–2015.

## VR

- Valve / SteamVR materials.
- Michael Abrash — публичные Valve VR talks.
- Oculus Kickstarter / раннее публичное взаимодействие Valve и Oculus.
- HTC Vive launch materials.
- Valve Index documentation.

## Steam Deck

- Valve — **Steam Deck Booklet**
  https://cdn.steamstatic.com/steamdeck/images/press/book/steamDeck_booklet_EN.pdf

- Valve — Steam Deck / SteamOS documentation.

---

# Фактологические оговорки

### Windows 8

Ньюэлл критиковал направление развития Windows и возможный рост platform control. Windows 8 не запретила обычный Win32 desktop и не заблокировала Steam. В этой главе разделены его реальный structural concern и слишком драматичная near-term формулировка.

### L4D2 Linux performance

Известный Linux-vs-Windows benchmark Valve демонстрировал результаты конкретной оптимизированной конфигурации и не является универсальным доказательством, что Linux всегда быстрее Windows.

### Steam Machines

Steam Machines не были одной стандартной консолью Valve. Это была категория устройств нескольких OEM под SteamOS, и именно fragmentation была одной из ключевых consumer problems.

### Proton

Valve не «изобрела Wine». Proton строится на существующей open-source ecosystem и включает/использует работу Wine, DXVK, vkd3d-proton и других компонентов и contributors.

### VR

Valve и Oculus в ранний период активно обменивались knowledge и research; позднюю конкуренцию не следует ретроспективно переносить на весь ранний этап.

### Steam Deck

Deck не доказывает, что изначальная реализация Steam Machines была правильной. Он показывает, что часть underlying thesis и накопленной infrastructure оказалась полезной в принципиально другой product architecture.
