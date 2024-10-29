component Reference.IllustratedMessage {
  connect ListItems exposing { getIcon, ICON_ITEMS }

  state subtitle : String = "Give a little love!"
  state title : String = "Hearth!"
  state size : Number = 16

  const ACTIONS =
    @format {
      <>
        <Ui.Button iconBefore={Ui.Icons.HEART} label="Give Love!" type="danger"/>

        <Ui.Button
          iconBefore={Ui.Icons.HEART_OUTLINE}
          label="More love!"
          type="secondary"
        />
      </>
    }

  const IMAGE =
    @format {
      <Ui.Image
        src={@asset(../../assets/images/app-weight-tracker.jpg)}
        height={Ui.Size.Em(7)}
        width={Ui.Size.Em(10)}
      />
    }

  get playgroundCode : String {
    "Ui.IllustratedMessage"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addStringHtml("subtitle", subtitle)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addStringHtml("title", title)
    |> ComponentBuilder.addExpression("image", IMAGE[1])
    |> ComponentBuilder.addRaw("actions", ACTIONS[1])
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.IllustratedMessage"</>>
        <p>
          "A component to display an illustrated message with slots for an image, title, subtitle and actions."
        </p>

        <p>
          "Usually it's used to display a message with a call to action in lists where there are no items."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.IllustratedMessage"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Title">
                <Ui.Input onChange={-> title} value={title}/>
              </Ui.Field>

              <Ui.Field label="Subtitle">
                <Ui.Textarea
                  onChange={-> subtitle}
                  value={subtitle}
                  behavior="grow"
                />
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.IllustratedMessage
                  size={Ui.Size.Px(size)}
                  subtitle=<>subtitle</>
                  actions={ACTIONS[0]}
                  title=<>title</>
                  image={IMAGE[0]}
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Size"
        content={
          <p>
            "The size of the component can be set with the "
            <code>"size"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.IllustratedMessage
                    image={<Ui.Icon size={Ui.Size.Em(6)} icon={Ui.Icons.BUG}/>}
                    actions=<><Ui.Button label="Action"/></>
                    subtitle=<>"Subtitle"</>
                    size={Ui.Size.Px(12)}
                    title=<>"Title"</>
                  />

                  <Ui.IllustratedMessage
                    image={<Ui.Icon size={Ui.Size.Em(6)} icon={Ui.Icons.BUG}/>}
                    actions=<><Ui.Button label="Action"/></>
                    subtitle=<>"Subtitle"</>
                    size={Ui.Size.Px(16)}
                    title=<>"Title"</>
                  />

                  <Ui.IllustratedMessage
                    image={<Ui.Icon size={Ui.Size.Em(6)} icon={Ui.Icons.BUG}/>}
                    actions=<><Ui.Button label="Action"/></>
                    subtitle=<>"Subtitle"</>
                    size={Ui.Size.Px(20)}
                    title=<>"Title"</>
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Image"
        content={
          <p>
            "The image displayed can be set with the "
            <code>"image"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={40}
            data={
              @format {
                <>
                  <Ui.IllustratedMessage
                    image={<Ui.Icon icon={Ui.Icons.BUG}/>}
                    title=<>"Title"</>
                  />

                  <Ui.IllustratedMessage
                    title=<>"Title"</>
                    image={
                      <Ui.Image
                        src={@asset(../../assets/images/app-contacts.jpg)}
                        height={Ui.Size.Px(150)}
                        width={Ui.Size.Px(200)}
                      />
                    }
                  />

                  <Ui.IllustratedMessage
                    image={<Ui.Button label="I am a button!"/>}
                    title=<>"Title"</>
                  />
                </>
              }
            }
          />
        }
      />
    </>
  }
}
