component Pages.Landing.Example {
  state content : String = "Cards display content and actions on a single topic."
  state subtitle : String = "Example Card"
  state title : String = "Ui.Card"
  state height : Number = 10

  const IMAGE =
    @format {
      @asset(../../assets/images/beach.jpg)
    }

  const AVATAR =
    @format {
      @asset(../../assets/images/avatar.jpg)
    }

  style base {
    textarea {
      height: 130px;
      width: 300px;
      resize: none;

      @media (max-width: 1000px) {
        width: auto;
      }
    }
  }

  get code : String {
    try {
      image =
        "Ui.Card.Image"
        |> ComponentBuilder.new()
        |> ComponentBuilder.addExpression("src", IMAGE[1])
        |> ComponentBuilder.toString()

      container =
        "Ui.Card.Container"
        |> ComponentBuilder.new()
        |> ComponentBuilder.addExpression("thumbnail", AVATAR[1])
        |> ComponentBuilder.addString("content", content)
        |> ComponentBuilder.addString("subtitle", subtitle)
        |> ComponentBuilder.addString("title", title)
        |> ComponentBuilder.toString()

      "Ui.Card"
      |> ComponentBuilder.new()
      |> ComponentBuilder.addString("href", "/components/ui-card")
      |> ComponentBuilder.addChild(image)
      |> ComponentBuilder.addChild(container)
      |> ComponentBuilder.toString()
    }
  }

  fun render {
    <div::base>
      <Example
        horizontalSpacing={0}
        verticalSpacing={0}
        controls=<{
          <Ui.Field label="Title">
            <Ui.Input
              onChange={(value : String) { next { title = value } }}
              value={title}/>
          </Ui.Field>

          <Ui.Field label="Subtitle">
            <Ui.Input
              onChange={(value : String) { next { subtitle = value } }}
              value={subtitle}/>
          </Ui.Field>

          <Ui.Field label="Content">
            <Ui.Textarea
              onChange={(value : String) { next { content = value } }}
              value={content}/>
          </Ui.Field>
        }>
        breakpoint={500}
        data={
          {
            <Ui.Card href="/components/ui-card">
              <Ui.Card.Image
                height={Ui.Size::Em(height)}
                src={IMAGE[0]}/>

              <Ui.Card.Container
                subtitle=<{ subtitle }>
                thumbnail={AVATAR[0]}
                content=<{ content }>
                title=<{ title }>/>
            </Ui.Card>,
            code
          }
        }
        size={Ui.Size::Inherit}/>
    </div>
  }
}
