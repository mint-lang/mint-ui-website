component Documentation.Navigation {
  fun render {
    <>
      <Ui.Box title=<{ "Navigation" }>>
        <p>
          "In other component libraries navigation is rendered dire" \
          "ctly with elements, in Mint UI it is rendered from data " \
          "which enables adapting the view to the screen size."
        </p>

        <p>
          "For example the navigation in "

          <a href="/components/ui-header">
            "Ui.Header"
          </a>

          " component on desktop is displayed as a navigation list," \
          " but on mobile since there is no screen estate it's disp" \
          "laid as an "

          <a href="/components/ui-action-sheet">
            "Ui.ActionSheet"
          </a>

          "."
        </p>

        <video
          src={@asset(../../assets/videos/navitem.mp4)}
          controls="true"/>
      </Ui.Box>

      <DocBox
        title="Ui.NavItem"
        content=<{
          "The "
          <code>"Ui.NavItem"</code>
          " enum is used to describe navigation items, currently it consists of:"

          <ul>
            <li>
              <code>"Ui.NavItem::Link"</code>
              " - a link to an other page."
            </li>

            <li>
              <code>"Ui.NavItem::Item"</code>
              " - a link like item which can be clicked."
            </li>

            <li>
              <code>"Ui.NavItem::Group"</code>
              " - a group of other navigation items."
            </li>

            <li>
              <code>"Ui.NavItem::Divider"</code>
              " - a divider between navigation items."
            </li>
          </ul>
        }>
        example={
          <Hljs
            code={
              @format {
                [
                  Ui.NavItem::Link(
                    iconBefore = Ui.Icons:HOME,
                    iconAfter = <></>,
                    label = "Home",
                    target = "",
                    href = "/"),
                  Ui.NavItem::Item(
                    action = (event : Html.Event) { Ui.Notifications.notifyDefault(<{ "Item clicked!" }>) },
                    iconBefore = Ui.Icons:PUZZLE,
                    iconAfter = <></>,
                    label = "Components"),
                  Ui.NavItem::Divider,
                  Ui.NavItem::Group(
                    iconBefore = Ui.Icons:BRIEFCASE,
                    iconAfter = <></>,
                    label = "Group",
                    items =
                      [
                        Ui.NavItem::Link(
                          iconBefore = Ui.Icons:HOME,
                          iconAfter = <></>,
                          label = "Sub Item",
                          target = "",
                          href = "/")
                      ])
                ]
              }[1]
            }/>
        }/>
    </>
  }
}
