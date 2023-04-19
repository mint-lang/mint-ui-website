component Reference.ActionSheet {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.ActionSheet" }>>
        <p>"A panel which comes up from the bottom of the screen and displays actions a user can take."</p>

        <p>"Some of its features:"</p>

        <ul>
          <li>"Showing the component returns a promise which is resolved when its closed."</li>

          <li>
            "The keyboard focus is trapped in the list ("
            <kbd>"Tab"</kbd>
            " and "
            <kbd>"Shift-Tab"</kbd>
            " cyles focusable elements)."
          </li>

          <li>"When closed the focus is returned to the last focused element before opening (which is usually the one that opened the action sheet)."</li>

          <li>
            "When open pressing "
            <kbd>"Esc"</kbd>
            " closes it."
          </li>

          <li>"After opened it will focus the first focusable item."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Basic Usage"
        content=<{
          <p>
            "Since the action-sheet is a global component you can just call "

            <code>"Ui.ActionSheet.show(items)"</code>

            " to show it."
          </p>
        }>
        example={
          <Example
            data={
              @format {
                let clickHandler =
                  (event : Html.Event) {
                    Ui.ActionSheet.show(
                      [
                        Ui.NavItem::Group(
                          iconBefore: Ui.Icons:CHECKLIST,
                          iconAfter: <></>,
                          label: "Group",
                          items:
                            [
                              Ui.NavItem::Link(
                                iconBefore: Ui.Icons:CHECK,
                                iconAfter: <></>,
                                label: "Subitem",
                                target: "",
                                href: "/"),
                              Ui.NavItem::Divider,
                              Ui.NavItem::Link(
                                iconBefore: Ui.Icons:CHECK,
                                iconAfter: <></>,
                                label: "Subitem 2",
                                target: "",
                                href: "/"),
                              Ui.NavItem::Group(
                                iconBefore: Ui.Icons:CHECKLIST,
                                iconAfter: <></>,
                                label: "Sub Group",
                                items:
                                  [
                                    Ui.NavItem::Link(
                                      iconBefore: Ui.Icons:CHECK,
                                      iconAfter: <></>,
                                      label: "Subitem 3",
                                      target: "",
                                      href: "/"),
                                    Ui.NavItem::Divider,
                                    Ui.NavItem::Link(
                                      iconBefore: Ui.Icons:CHECK,
                                      iconAfter: <></>,
                                      label: "Subitem 4",
                                      target: "",
                                      href: "/")
                                  ])
                            ]),
                        Ui.NavItem::Link(
                          iconBefore: Ui.Icons:HOME,
                          iconAfter: <></>,
                          label: "Home",
                          target: "",
                          href: "/"),
                        Ui.NavItem::Divider,
                        Ui.NavItem::Item(
                          iconBefore: Ui.Icons:DESKTOP_DOWNLOAD,
                          label: "Download",
                          iconAfter: <></>,
                          action:
                            (event : Html.Event) {
                              Ui.Notifications.notifyDefault(<{ "Download!" }>)
                            })
                      ])
                  }

                <Ui.Button
                  label="Show Action Sheet"
                  onClick={ clickHandler }/>
              }
            }/>
        }/>

      <DocBox
        title="Advanced Usage"
        content={
          <p>
            "If you need more control over the size can call: "

            <code>"Ui.ActionSheet.showWithOptions(size, items)"</code>
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.Button
                  label="Show Action Sheet"
                  onClick={
                    (event : Html.Event) {
                      Ui.ActionSheet.showWithOptions(
                        Ui.Size::Px(30),
                        [
                          Ui.NavItem::Link(
                            iconBefore: Ui.Icons:HOME,
                            iconAfter: <></>,
                            label: "Home",
                            target: "",
                            href: "/"),
                          Ui.NavItem::Divider,
                          Ui.NavItem::Item(
                            iconBefore: Ui.Icons:DESKTOP_DOWNLOAD,
                            iconAfter: <></>,
                            label: "Download",
                            action:
                              (event : Html.Event) {
                                Ui.Notifications.notifyDefault(<{ "Download!" }>)
                              })
                        ])
                    }
                  }/>
              }
            }/>
        }/>

      <DocBox
        title="On Close"
        content={
          <p>
            "Both "

            <code>"show"</code>

            " and "

            <code>"showWithOptions"</code>

            " returns a "

            <code>"Promise"</code>

            " which resolves when the action-sheet is closed."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.Button
                  label="Show Action Sheet"
                  onClick={
                    (event : Html.Event) {
                      await Ui.ActionSheet.show(
                        [
                          Ui.NavItem::Link(
                            iconBefore: Ui.Icons:HOME,
                            iconAfter: <></>,
                            label: "Home",
                            target: "",
                            href: "/"),
                          Ui.NavItem::Divider,
                          Ui.NavItem::Item(
                            iconBefore: Ui.Icons:DESKTOP_DOWNLOAD,
                            label: "Download",
                            iconAfter: <></>,
                            action:
                              (event : Html.Event) {
                                Ui.Notifications.notifyDefault(<{ "Download!" }>)
                              })
                        ])

                      Ui.Notifications.notifyDefault(<{ "Closed!" }>)
                    }
                  }/>
              }
            }/>
        }/>
    </>
  }
}
