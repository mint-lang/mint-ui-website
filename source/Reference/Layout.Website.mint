component Reference.Layout.Website {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Layout.Website" }>>
        <p>"A layout for websites, with slots for:"</p>

        <ul>
          <li>
            <code>"notification"</code>
            "- Content for notifications like alerts."
          </li>

          <li>
            <code>"header"</code>
            "- The header of the site usually with a logo and navigation."
          </li>

          <li>
            <code>"breadcrumbs"</code>
            "- Breadcrumb navigation so the user can track where they are."
          </li>

          <li>
            <code>"content"</code>
            "- The content for the page."
          </li>

          <li>
            <code>"footer"</code>
            "- The footer of the website."
          </li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Demo"
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:NOTE}
            type="primary">

            "The component has a miniumum height of the screen!"

          </Ui.ContentHint>
        }
        content={
          <p>
            "You can see a demo of a "

            <code>"Ui.Layout.Website"</code>

            " below."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            data={
              @format {
                <Ui.Layout.Website
                  notification=<{ "Notification slot..." }>
                  header={
                    <Ui.Header
                      brand={
                        <Ui.Icon
                          size={Ui.Size::Em(1.2)}
                          icon={Ui.Icons:BEAKER}/>
                      }
                      items=[
                        Ui.NavItem::Link(
                          iconBefore = Ui.Icons:HOME,
                          iconAfter = <></>,
                          label = "Home",
                          target = "",
                          href = "/")
                      ]/>
                  }
                  breadcrumbs={
                    <Ui.Breadcrumbs
                      items=[
                        {"/", <{ "Home" }>},
                        {"/components", <{ "Components" }>},
                        {"", <{ "Ui.Breadcrumbs" }>}
                      ]/>
                  }
                  content={
                    <Ui.Box title=<{ "Content" }>>
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit," \
                      " sed do eiusmod tempor incididunt ut labore et dolore ma" \
                      "gna aliqua. Ut enim ad minim veniam, quis nostrud exerci" \
                      "tation ullamco laboris nisi ut aliquip ex ea commodo con" \
                      "sequat. Duis aute irure dolor in reprehenderit in volupt" \
                      "ate velit esse cillum dolore eu fugiat nulla pariatur. E" \
                      "xcepteur sint occaecat cupidatat non proident, sunt in c" \
                      "ulpa qui officia deserunt mollit anim id est laborum."
                    </Ui.Box>
                  }
                  footer={
                    <Ui.Footer
                      infos={<p>"Infos content"</p>}
                      navitems=[
                        {
                          "Site", [
                            Ui.NavItem::Link(
                              iconBefore = Ui.Icons:HOME,
                              iconAfter = <></>,
                              label = "Home",
                              target = "",
                              href = "/"),
                            Ui.NavItem::Link(
                              iconBefore = Ui.Icons:PUZZLE,
                              iconAfter = <></>,
                              href = "/components",
                              label = "Components",
                              target = "")
                          ]
                        },
                        {
                          "Social", [
                            Ui.NavItem::Link(
                              iconBefore = @svg(../../assets/svgs/discord-icon.svg),
                              iconAfter = <></>,
                              href = "https://discord.gg/NXFUJs2",
                              target = "_blank",
                              label = "Discord"),
                            Ui.NavItem::Link(
                              iconBefore = @svg(../../assets/svgs/twitter-icon.svg),
                              iconAfter = <></>,
                              href = "https://twitter.com/mint_lang",
                              target = "_blank",
                              label = "Twitter")
                          ]
                        }
                      ]/>
                  }/>
              }
            }/>
        }/>
    </>
  }
}
