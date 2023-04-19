component Reference.Modal.Content {
  connect ListItems exposing { ICON_ITEMS, getIcon }

  state content : String = "Copying the file..."
  state icon : String = "FILE_SYMLINK_FILE"
  state title : String = "Copy File"

  state maxWidth : Number = 500
  state minWidth : Number = 280
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Modal.Content"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addStringHtml("content", content)
    |> ComponentBuilder.addStringHtml("title", title)
    |> ComponentBuilder.addSizePx("minWidth", minWidth)
    |> ComponentBuilder.addSizePx("maxWidth", maxWidth)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addRaw("actions", ACTIONS[1])
    |> ComponentBuilder.toString()
  }

  const ACTIONS =
    @format {
      <{
        <Ui.Button
          label="Cancel"
          type="faded"/>

        <Ui.Button label="Ok"/>
      }>
    }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Modal.Content" }>>
        <p>"The content part of a modal, with a title, content and actions."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Modal.Content"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Title">
                <Ui.Input
                  onChange={(value : String) { next { title: value } }}
                  value={title}/>
              </Ui.Field>

              <Ui.Field label="Content">
                <Ui.Textarea
                  inputDelay={200}
                  onChange={(value : String) { next { content: value } }}
                  value={content}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(value : String) { next { icon: value } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>

              <Ui.Field label="Maximum Width (#{maxWidth}px)">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          minWidth: Math.min(minWidth, value),
                          maxWidth: value
                        }
                    }
                  }
                  value={maxWidth}
                  max={600}
                  min={300}/>
              </Ui.Field>

              <Ui.Field label="Minimum Width (#{minWidth}px)">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          maxWidth: Math.max(maxWidth, value),
                          minWidth: value
                        }
                    }
                  }
                  value={minWidth}
                  max={600}
                  min={300}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size: value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Modal.Content
                  maxWidth={Ui.Size::Px(maxWidth)}
                  minWidth={Ui.Size::Px(minWidth)}
                  size={Ui.Size::Px(size)}
                  content=<{ content }>
                  actions={ACTIONS[0]}
                  icon={getIcon(icon)}
                  title=<{ title }>/>,
                playgroundCode
              }
            }/>
        }/>
    </>
  }
}
