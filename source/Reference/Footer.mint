component Reference.Footer {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Footer" }>>
        <p>
          "A simple footer element which displays site information " \
          "on the left and categorized navigation items on the righ" \
          "t."
        </p>

        <p>
          "The navigation items adapt to the available screen size " \
          "by arranging themselves into a grid."
        </p>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={
          <p>
            "You can see a demo of a "

            <code>"Ui.Footer"</code>

            " below."
          </p>
        }
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:NOTE}
            type="primary">

            "Also you can check out a live version of it at the bottom of this page."

          </Ui.ContentHint>
        }
        example={
          <Example
            fullWidth={true}
            data={
              @format {
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
              }
            }/>
        }/>
    </>
  }
}
