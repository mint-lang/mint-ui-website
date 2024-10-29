component Reference.Icon {
  connect ListItems exposing { ICON_ITEMS, getIcon }

  state interactive : Bool = false
  state disabled : Bool = false

  state opacity : Number = 1
  state size : Number = 30

  state icon : String = "BEAKER"
  state href : String = ""

  get playgroundCode {
    "Ui.Icon"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addExpression("icon", "Ui.Icons:#{icon}")
    |> ComponentBuilder.addBool("interactive", interactive)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addNumber("opacity", opacity)
    |> ComponentBuilder.addString("href", href)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Icon"</>>
        <p>"Displays an SVG icon, which can be interactive."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Icon"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={-> icon}
                  items={ICON_ITEMS}
                  value={icon}
                />
              </Ui.Field>

              <Ui.Field label="Href"><Ui.Input onChange={-> href} value={href}/></Ui.Field>

              <Ui.Field label="Opacity (#{opacity})">
                <Ui.Slider
                  onChange={-> opacity}
                  value={opacity}
                  step={0.1}
                  max={1}
                  min={0}
                />
              </Ui.Field>

              <Ui.Field label="Size">
                <Ui.Slider onChange={-> size} value={size} max={200} min={0}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Interactive">
                <Ui.Checkbox onChange={-> interactive} checked={interactive}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Disabled">
                <Ui.Checkbox onChange={-> disabled} checked={disabled}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.Icon
                  size={Ui.Size.Px(size)}
                  icon={getIcon(icon)}
                  interactive={interactive}
                  disabled={disabled}
                  opacity={opacity}
                  href={href}
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Icon"
        content={
          <p>
            "The icon can be specified using the "
            <code>"icon"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(30)}
                  />

                  <Ui.Icon icon={Ui.Icons.ALERT} size={Ui.Size.Px(30)}/>

                  <Ui.Icon icon={Ui.Icons.CODE} size={Ui.Size.Px(30)}/>

                  <Ui.Icon icon={Ui.Icons.EYE} size={Ui.Size.Px(30)}/>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Included Icons"
        content={
          <p>"You can find below the icons which are currently included."</p>
        }
        example={
          <Ui.Grid
            mobileWidth={Ui.Size.Px(100)}
            width={Ui.Size.Px(170)}
            gap={Ui.Size.Px(10)}
          >
            for item of ListItems.ICON_ITEMS {
              <Ui.Card>
                <DemoArea>
                  <Ui.Icon
                    icon={getIcon(Ui.ListItem.key(item))}
                    size={Ui.Size.Px(24)}
                  />
                </DemoArea>

                <Ui.Card.Container
                  textAlign="center"
                  content=<>
                    <strong><>Ui.ListItem.matchString(item)</></strong>
                    <br/>
                    <small><>Ui.ListItem.key(item)</></small>
                  </>
                />
              </Ui.Card>
            }
          </Ui.Grid>
        }
      />

      <DocBox
        title="Opacity"
        content={
          <p>
            "The components opacity can be controlled with the "
            <code>"opacity"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Icon
                    size={Ui.Size.Px(30)}
                    icon={Ui.Icons.ALERT}
                    opacity={1}
                  />

                  <Ui.Icon
                    size={Ui.Size.Px(30)}
                    icon={Ui.Icons.ALERT}
                    opacity={0.75}
                  />

                  <Ui.Icon
                    size={Ui.Size.Px(30)}
                    icon={Ui.Icons.ALERT}
                    opacity={0.5}
                  />

                  <Ui.Icon
                    size={Ui.Size.Px(30)}
                    icon={Ui.Icons.ALERT}
                    opacity={0.25}
                  />
                </>
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
                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(12)}
                  />

                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(16)}
                  />

                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(20)}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Auto Size"
        content={
          <p>
            "The size of the component by default inherits the parent elements font size."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <div style="font-size: 14px">
                    <Ui.Icon icon={Ui.Icons.DESKTOP_DOWNLOAD}/>
                  </div>

                  <div style="font-size: 18px">
                    <Ui.Icon icon={Ui.Icons.DESKTOP_DOWNLOAD}/>
                  </div>

                  <div style="font-size: 26px">
                    <Ui.Icon icon={Ui.Icons.DESKTOP_DOWNLOAD}/>
                  </div>

                  <div style="font-size: 32px">
                    <Ui.Icon icon={Ui.Icons.DESKTOP_DOWNLOAD}/>
                  </div>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Color"
        content={
          <p>"The color of the icon is determined by the parent elements color."</p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <div style="color: red;">
                    <Ui.Icon
                      icon={Ui.Icons.DESKTOP_DOWNLOAD}
                      size={Ui.Size.Px(30)}
                    />
                  </div>

                  <div style="color: orangered">
                    <Ui.Icon
                      icon={Ui.Icons.DESKTOP_DOWNLOAD}
                      size={Ui.Size.Px(30)}
                    />
                  </div>

                  <div style="color: rebeccapurple">
                    <Ui.Icon
                      icon={Ui.Icons.DESKTOP_DOWNLOAD}
                      size={Ui.Size.Px(30)}
                    />
                  </div>

                  <div style="color: magenta">
                    <Ui.Icon
                      icon={Ui.Icons.DESKTOP_DOWNLOAD}
                      size={Ui.Size.Px(30)}
                    />
                  </div>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="As a Link"
        content={
          <p>
            "The icon will turn into a link if the "
            <code>"href"</code>
            " property is not empty."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.Icon
                  icon={Ui.Icons.DESKTOP_DOWNLOAD}
                  size={Ui.Size.Px(30)}
                  href="/"
                />
              }
            }
          />
        }
      />

      <DocBox
        title="Interactive"
        content={
          <p>
            "The icon can be interactive if the "
            <code>"interactive"</code>
            " property is set."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(30)}
                    interactive={true}
                  />

                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(30)}
                    interactive={false}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Disabled"
        content={
          <p>
            "The icon can be disabled using the "
            <code>"disabled"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(30)}
                    disabled={true}
                  />

                  <Ui.Icon
                    icon={Ui.Icons.DESKTOP_DOWNLOAD}
                    size={Ui.Size.Px(30)}
                    disabled={false}
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
