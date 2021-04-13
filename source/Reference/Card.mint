component Reference.Card {
  state target : String = "_blank"
  state href : String = "/"

  state minWidth : Number = 300
  state size : Number = 16

  style container {
    max-width: #{Math.max(size * 18.75, minWidth)}px;
  }

  const IMAGE =
    @format {
      <Ui.Card.Image
        src={@asset(../../assets/images/beach.jpg)}
        height={Ui.Size::Em(12.5)}/>
    }

  const CONTAINER =
    @format {
      <Ui.Card.Container
        content=<{ "Cards display content and actions on a single topic." }>
        thumbnail={@asset(../../assets/images/avatar.jpg)}
        subtitle=<{ "Subtitle" }>
        title=<{ "Title" }>/>
    }

  get playgroundCode : String {
    "Ui.Card"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("minWidth", minWidth)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addString("target", target)
    |> ComponentBuilder.addString("href", href)
    |> ComponentBuilder.addChild(IMAGE[1])
    |> ComponentBuilder.addChild(CONTAINER[1])
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Card" }>>
        <p>"Cards are surfaces that display content and actions on a single topic."</p>
      </Ui.Box>

      <DocBox
        title="Interactive demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Card"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Min Width (#{minWidth}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { minWidth = value } }}
                  value={minWidth}
                  max={500}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Href">
                <Ui.Input
                  onChange={(value : String) { next { href = value } }}
                  value={href}/>
              </Ui.Field>

              <Ui.Field label="Target">
                <Ui.Input
                  onChange={(value : String) { next { target = value } }}
                  value={target}/>
              </Ui.Field>
            }>
            data={
              {
                <div::container>
                  <Ui.Card
                    minWidth={Ui.Size::Px(minWidth)}
                    size={Ui.Size::Px(size)}
                    target={target}
                    href={href}>

                    <{ IMAGE[0] }>
                    <{ CONTAINER[0] }>

                  </Ui.Card>
                </div>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Variations"
        content={<p>"You can mix and match the contents of a card."</p>}
        example={
          <Example
            horizontalSpacing={30}
            data={
              @format {
                <>
                  <Ui.Card minWidth={Ui.Size::Px(200)}>
                    <Ui.Card.Image
                      src={@asset(../../assets/images/beach.jpg)}
                      height={Ui.Size::Px(100)}/>

                    <Ui.Card.Container
                      thumbnail={@asset(../../assets/images/avatar.jpg)}
                      content=<{ "Some Content..." }>
                      subtitle=<{ "Subtitle" }>
                      title=<{ "Title" }>/>
                  </Ui.Card>

                  <Ui.Card minWidth={Ui.Size::Px(200)}>
                    <Ui.Card.Container
                      thumbnail={@asset(../../assets/images/avatar.jpg)}
                      content=<{ "Some Content..." }>
                      subtitle=<{ "Subtitle" }>
                      title=<{ "Title" }>/>

                    <Ui.Card.Image
                      src={@asset(../../assets/images/beach.jpg)}
                      height={Ui.Size::Px(100)}/>
                  </Ui.Card>

                  <Ui.Card minWidth={Ui.Size::Px(200)}>
                    <Ui.Card.Image
                      src={@asset(../../assets/images/avatar.jpg)}
                      height={Ui.Size::Px(100)}/>

                    <Ui.Card.Container
                      content=<{ "Some Content..." }>
                      title=<{ "Some title..." }>/>

                    <Ui.Card.Image
                      src={@asset(../../assets/images/beach.jpg)}
                      height={Ui.Size::Px(100)}/>
                  </Ui.Card>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of a card can be set with the "

            <code>"size"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={30}
            highlight=[3, 19, 35]
            data={
              @format {
                <>
                  <Ui.Card
                    minWidth={Ui.Size::Px(200)}
                    size={Ui.Size::Px(12)}>

                    <Ui.Card.Image
                      src={@asset(../../assets/images/beach.jpg)}
                      height={Ui.Size::Em(7)}/>

                    <Ui.Card.Container
                      thumbnail={@asset(../../assets/images/avatar.jpg)}
                      content=<{ "Content..." }>
                      subtitle=<{ "Subtitle" }>
                      title=<{ "Title" }>/>

                  </Ui.Card>

                  <Ui.Card
                    minWidth={Ui.Size::Px(200)}
                    size={Ui.Size::Px(16)}>

                    <Ui.Card.Image
                      src={@asset(../../assets/images/beach.jpg)}
                      height={Ui.Size::Em(7)}/>

                    <Ui.Card.Container
                      thumbnail={@asset(../../assets/images/avatar.jpg)}
                      content=<{ "Content..." }>
                      subtitle=<{ "Subtitle" }>
                      title=<{ "Title" }>/>

                  </Ui.Card>

                  <Ui.Card
                    minWidth={Ui.Size::Px(200)}
                    size={Ui.Size::Px(20)}>

                    <Ui.Card.Image
                      src={@asset(../../assets/images/beach.jpg)}
                      height={Ui.Size::Em(7)}/>

                    <Ui.Card.Container
                      thumbnail={@asset(../../assets/images/avatar.jpg)}
                      content=<{ "Some Content..." }>
                      subtitle=<{ "Subtitle" }>
                      title=<{ "Title" }>/>

                  </Ui.Card>
                </>
              }
            }/>
        }/>
    </>
  }
}
