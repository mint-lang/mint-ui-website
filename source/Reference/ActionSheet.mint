component Reference.ActionSheet {
  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.ActionSheet"</>>
        <<#MARKDOWN
        A panel which comes up from the bottom of the screen and displays
        actions a user can take.

        Some of its features:

        * Showing the component returns a promise which is resolved when its
          closed.
        * The keyboard focus is trapped in the list (`Tab` and `Shift-Tab`
          cyles focusable elements).
        * When closed the focus is returned to the last focused element before
          opening (which is usually the one that opened the action sheet).
        * When open pressing `Esc` closes it.
        * After opened it will focus the first focusable item.
        MARKDOWN
      </Ui.Box>

      <DocBox
        title="Basic Usage"
        content={
          <<#MARKDOWN
          Since the action-sheet is a global component you can just call
          `Ui.ActionSheet.show(items)` to show it.
          MARKDOWN
        }
        example={
          <Example
            data={
              @format {
                let clickHandler =
                  (event : Html.Event) {
                    Ui.ActionSheet.show(
                      [
                        Ui.NavItem.Group(
                          iconBefore: Ui.Icons.CHECKLIST,
                          iconAfter: <></>,
                          label: "Group",
                          items:
                            [
                              Ui.NavItem.Link(
                                iconBefore: Ui.Icons.CHECK,
                                iconAfter: <></>,
                                label: "Subitem",
                                target: "",
                                href: "/"),
                              Ui.NavItem.Divider,
                              Ui.NavItem.Link(
                                iconBefore: Ui.Icons.CHECK,
                                iconAfter: <></>,
                                label: "Subitem 2",
                                target: "",
                                href: "/"),
                              Ui.NavItem.Group(
                                iconBefore: Ui.Icons.CHECKLIST,
                                iconAfter: <></>,
                                label: "Sub Group",
                                items:
                                  [
                                    Ui.NavItem.Link(
                                      iconBefore: Ui.Icons.CHECK,
                                      iconAfter: <></>,
                                      label: "Subitem 3",
                                      target: "",
                                      href: "/"),
                                    Ui.NavItem.Divider,
                                    Ui.NavItem.Link(
                                      iconBefore: Ui.Icons.CHECK,
                                      iconAfter: <></>,
                                      label: "Subitem 4",
                                      target: "",
                                      href: "/")
                                  ])
                            ]),
                        Ui.NavItem.Link(
                          iconBefore: Ui.Icons.HOME,
                          iconAfter: <></>,
                          label: "Home",
                          target: "",
                          href: "/"),
                        Ui.NavItem.Divider,
                        Ui.NavItem.Item(
                          iconBefore: Ui.Icons.DESKTOP_DOWNLOAD,
                          label: "Download",
                          iconAfter: <></>,
                          action:
                            (event : Html.Event) {
                              Ui.Notifications.notifyDefault(<>"Download!"</>)
                            })
                      ])
                  }

                <Ui.Button label="Show Action Sheet" onClick={clickHandler}/>
              }
            }
          />
        }
      />

      <DocBox
        title="Advanced Usage"
        content={
          <<#MARKDOWN
          If you need more control over the size can call:
          `Ui.ActionSheet.showWithOptions(size, items)`
          MARKDOWN
        }
        example={
          <Example
            data={
              @format {
                <Ui.Button
                  label="Show Action Sheet"
                  onClick={
                    (event : Html.Event) {
                      Ui.ActionSheet.showWithOptions(Ui.Size.Px(30),
                        [
                          Ui.NavItem.Link(
                            iconBefore: Ui.Icons.HOME,
                            iconAfter: <></>,
                            label: "Home",
                            target: "",
                            href: "/"),
                          Ui.NavItem.Divider,
                          Ui.NavItem.Item(
                            iconBefore: Ui.Icons.DESKTOP_DOWNLOAD,
                            iconAfter: <></>,
                            label: "Download",
                            action:
                              (event : Html.Event) {
                                Ui.Notifications.notifyDefault(<>"Download!"</>)
                              })
                        ])
                    }
                  }
                />
              }
            }
          />
        }
      />

      <DocBox
        title="On Close"
        content={
          <<#MARKDOWN
            Both `show` and `showWithOptions` returns a `Promise` which
            resolves when the action-sheet is closed.
          MARKDOWN
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
                          Ui.NavItem.Link(
                            iconBefore: Ui.Icons.HOME,
                            iconAfter: <></>,
                            label: "Home",
                            target: "",
                            href: "/"),
                          Ui.NavItem.Divider,
                          Ui.NavItem.Item(
                            iconBefore: Ui.Icons.DESKTOP_DOWNLOAD,
                            label: "Download",
                            iconAfter: <></>,
                            action:
                              (event : Html.Event) {
                                Ui.Notifications.notifyDefault(<>"Download!"</>)
                              })
                        ])

                      Ui.Notifications.notifyDefault(<>"Closed!"</>)
                    }
                  }
                />
              }
            }
          />
        }
      />
    </>
  }
}
