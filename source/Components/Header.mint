component Header {
  connect Ui exposing { mobile, darkMode, toggleDarkMode }

  get darkModeToggle : Ui.NavItem {
    if mobile {
      let label =
        if darkMode {
          "Light Mode"
        } else {
          "Dark Mode"
        }

      let iconBefore =
        if darkMode {
          Ui.Icons.SUN
        } else {
          Ui.Icons.MOON
        }

      Ui.NavItem.Item(
        action: (event : Html.Event) { toggleDarkMode() },
        iconBefore: iconBefore,
        iconAfter: <></>,
        label: label)
    } else {
      Ui.NavItem.Html(<Ui.DarkModeToggle/>)
    }
  }

  fun render : Html {
    <Ui.Header
      brand={<Logo size={Ui.Size.Em(1.25)} href="/"/>}
      gap={Ui.Size.Em(1.5)}
      items=[
        NavItems.INSTALL,
        NavItems.PRICING,
        NavItems.COMPONENTS,
        NavItems.DOCUMENTATION,
        NavItems.EXAMPLES,
        Ui.NavItem.Divider,
        NavItems.GITHUB,
        Ui.NavItem.Divider,
        darkModeToggle
      ]
    />
  }
}
