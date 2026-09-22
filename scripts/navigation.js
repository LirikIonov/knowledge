document$.subscribe(() => {
  const root = document.querySelector(".md-nav--primary");

  if (!root) return;

  const topLevel = root.querySelector(":scope > .md-nav__list");

  if (!topLevel) return;

  for (const level1 of topLevel.children) {
    const level1Nav = level1.querySelector(":scope > nav");

    if (!level1Nav) continue;

    for (const level2 of level1Nav.querySelector(":scope > .md-nav__list")?.children ?? []) {
      const toggle = level2.querySelector(":scope > .md-nav__toggle");

      if (toggle) {
        toggle.checked = true;
      }
    }
  }
});