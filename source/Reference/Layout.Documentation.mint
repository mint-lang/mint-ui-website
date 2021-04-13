component Reference.Layout.Documentation {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Layout.Documentation" }>>
        <p>"A layout for displaying documentation:"</p>

        <ul>
          <li>"The left side is the navigation."</li>
          <li>"The center part contains the the content (with anchors)."</li>
          <li>"The right part is the table of contents (using the anchors in the center)."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Demo"
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:NOTE}
            type="primary">

            "This page is using this component."

          </Ui.ContentHint>
        }
        content={
          <p>
            "You can see a demo of a "

            <code>"Ui.Layout.Documentation"</code>

            " below."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            data={
              @format {
                <Ui.Layout.Documentation
                  items=[
                    Ui.NavItem::Link(
                      iconBefore = Ui.Icons:HOME,
                      iconAfter = <></>,
                      label = "Home",
                      target = "",
                      href = "/"),
                    Ui.NavItem::Divider,
                    Ui.NavItem::Group(
                      iconBefore = Ui.Icons:CHECKLIST,
                      iconAfter = <></>,
                      label = "Group",
                      items =
                        [
                          Ui.NavItem::Link(
                            iconBefore = Ui.Icons:CHECK,
                            iconAfter = <></>,
                            label = "Subitem",
                            target = "",
                            href = "/"),
                          Ui.NavItem::Link(
                            iconBefore = Ui.Icons:CHECK,
                            iconAfter = <></>,
                            label = "Subitem 2",
                            target = "",
                            href = "/"),
                          Ui.NavItem::Group(
                            iconBefore = Ui.Icons:CHECKLIST,
                            iconAfter = <></>,
                            label = "Sub Group",
                            items =
                              [
                                Ui.NavItem::Link(
                                  iconBefore = Ui.Icons:CHECK,
                                  iconAfter = <></>,
                                  label = "Subitem 3",
                                  target = "",
                                  href = "/"),
                                Ui.NavItem::Link(
                                  iconBefore = Ui.Icons:CHECK,
                                  iconAfter = <></>,
                                  label = "Subitem 4",
                                  target = "",
                                  href = "/")
                              ])
                        ]),
                    Ui.NavItem::Item(
                      action = (event : Html.Event) { Window.alert("Download!") },
                      iconBefore = Ui.Icons:DESKTOP_DOWNLOAD,
                      label = "Download",
                      iconAfter = <></>)
                  ]>

                  <Ui.Box title=<{ "Documentation" }>>
                    <a name="topic-1">
                      <h2>"Topic 1 (H2)"</h2>
                    </a>

                    <p>"Some Content..."</p>

                    <a name="topic-2">
                      <h2>"Topic 2 (H2)"</h2>
                    </a>

                    <p>"Some Content..."</p>
                  </Ui.Box>

                </Ui.Layout.Documentation>
              }
            }/>
        }/>
    </>
  }
}
