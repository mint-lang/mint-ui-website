/* A store for the navigation items used on the site. */
store NavItems {
  const HOME =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:HOME,
      iconAfter = <></>,
      label = "Home",
      target = "",
      href = "/")

  const INSTALL =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:DESKTOP_DOWNLOAD,
      iconAfter = <></>,
      href = "/documentation/installation",
      label = "Install",
      target = "")

  const COMPONENTS =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:PUZZLE,
      iconAfter = <></>,
      href = "/components",
      label = "Components",
      target = "")

  const DOCUMENTATION =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:BOOK,
      iconAfter = <></>,
      href = "/documentation",
      label = "Documentation",
      target = "")

  const EXAMPLES =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:REPO,
      iconAfter = <></>,
      label = "Examples",
      href = "/examples",
      target = "")

  const GITHUB =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:MARK_GITHUB,
      iconAfter = <></>,
      href = "https://github.com/mint-lang/mint-ui",
      target = "_blank",
      label = "Github")

  const SOURCE =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:REPO,
      iconAfter = <></>,
      href = "https://github.com/mint-lang/mint-ui",
      target = "_blank",
      label = "Source")

  const WEBSITE_SOURCE =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:REPO,
      iconAfter = <></>,
      href = "https://github.com/mint-lang/mint-ui-website",
      label = "Website Source",
      target = "_blank")

  const RELEASES =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:TAG,
      iconAfter = <></>,
      href = "https://github.com/mint-lang/mint-ui/releases",
      label = "Releases",
      target = "_blank")

  const GITTER =
    Ui.NavItem::Link(
      label = "Gitter",
      iconBefore = @svg(../../assets/svgs/gitter-icon.svg),
      iconAfter = <></>,
      href = "https://gitter.im/mint-lang/Lobby",
      target = "_blank")

  const DISCORD =
    Ui.NavItem::Link(
      iconBefore = @svg(../../assets/svgs/discord-icon.svg),
      iconAfter = <></>,
      href = "https://discord.gg/NXFUJs2",
      label = "Discord",
      target = "_blank")

  const TELEGRAM =
    Ui.NavItem::Link(
      iconBefore = @svg(../../assets/svgs/telegram-icon.svg),
      iconAfter = <></>,
      href = "https://web.telegram.org/#/im?p=@mintlang",
      label = "Telegram",
      target = "_blank")

  const TWITTER =
    Ui.NavItem::Link(
      iconBefore = @svg(../../assets/svgs/twitter-icon.svg),
      iconAfter = <></>,
      href = "https://twitter.com/mint_lang",
      label = "Twitter",
      target = "_blank")

  const PRICING =
    Ui.NavItem::Link(
      iconBefore = Ui.Icons:CART,
      iconAfter = <></>,
      href = "/pricing",
      label = "Pricing",
      target = "")
}
