document$.subscribe(() => {
  const root = document.querySelector(".md-nav--primary");
  if (!root) return;

  const toggles = root.querySelectorAll(
    ".md-nav__item--nested > .md-nav__toggle"
  );

  toggles.forEach(toggle => {
    let depth = 0;
    let element = toggle.parentElement;

    while (element && element !== root) {
      if (element.classList.contains("md-nav__item--nested")) {
        depth++;
      }

      element = element.parentElement;
    }

    toggle.checked = depth <= 2;
  });
});