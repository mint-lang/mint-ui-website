component Documentation.Surfaces {
  fun render {
    <>
      <Ui.Box title=<{ "Surfaces" }>>
        <p>"This document describes what are surfaces and how to use them."</p>
      </Ui.Box>

      <DocBox
        title="Surface"
        content=<{
          <p>
            "A surface is a "
            <strong>"container"</strong>
            " which holds "
            <strong>"content. "</strong>
            "It should use a different color from the background which is good for readability."
          </p>

          <p>
            "The main surface component is "

            <a href="/components/ui-box">
              "Ui.Box"
            </a>

            "."
          </p>
        }>
        example={
          <Example
            data={
              @format {
                <Ui.Box>"👋 I am on a surface!"</Ui.Box>
              }
            }/>
        }/>

      <DocBox
        title="Multiple Surfaces"
        content=<{
          <p>
            "You can arrange any number of surfaces on a screen in an" \
            "y number of ways just always make sure that there are ga" \
            "ps between the surfaces."
          </p>

          <p>"This gap between signifies the relation between them:"</p>

          <ul>
            <li>"Small gaps between surfaces means that they are connected in some way."</li>
            <li>"Large gaps between surfaces means that they hold completely separate content."</li>
          </ul>
        }>
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:LIGHT_BULB}
            type="primary">

            "You can see that here around this note! There are small " \
            "gaps above and below which means that this is related to" \
            " the those surfaces."

          </Ui.ContentHint>
        }
        example={
          <Example
            verticalSpacing={40}
            fullWidth={true}
            data={
              @format {
                <>
                  <Ui.Grid
                    width={Ui.Size::Em(20)}
                    gap={Ui.Size::Em(5)}>

                    <Ui.Box>"I don't have anything to do with that! ➡️"</Ui.Box>
                    <Ui.Box>"⬅️ Who is that? "</Ui.Box>

                  </Ui.Grid>

                  <Ui.Grid
                    width={Ui.Size::Em(20)}
                    gap={Ui.Size::Em(0.5)}>

                    <Ui.Box>"I know that! ➡️"</Ui.Box>
                    <Ui.Box>"⬅️ Hi there! "</Ui.Box>

                  </Ui.Grid>
                </>
              }
            }/>
        }/>
    </>
  }
}
