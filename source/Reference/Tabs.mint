component Reference.Tabs {
  state active : String = "first_tab"
  state breakpoint : Number = 400
  state size : Number = 16

  const TABS =
    @format {
      [
        {
          iconBefore: Ui.Icons:ALERT,
          iconAfter: <></>,
          content: <{ "First Content" }>,
          label: "First Tab",
          key: "first_tab"
        },
        {
          iconBefore: Ui.Icons:ARCHIVE,
          iconAfter: <></>,
          content: <{ "Second Content" }>,
          label: "Second Tab",
          key: "second_tab"
        },
        {
          iconBefore: Ui.Icons:BEAKER,
          iconAfter: <></>,
          content: <{ "Third Content" }>,
          label: "Third Tab",
          key: "third_tab"
        }
      ]
    }

  const ITEMS =
    for (tab of TABS[0]) {
      Ui.ListItem::Item(
        matchString: String.toLowerCase(tab.label),
        content: <{ tab.label }>,
        key: tab.key)
    }

  get playgroundCode : String {
    "Ui.Tabs"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addString("active", active)
    |> ComponentBuilder.addNumber("breakpoint", breakpoint)
    |> ComponentBuilder.addRaw("items", TABS[1])
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Tabs" }>>
        <p>"A component for displaying content in different tabs."</p>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={
          <p>
            "You can see a demo of a "

            <code>"Ui.Tabs"</code>

            " below."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Active">
                <Ui.Native.Select
                  onChange={(value : String) { next { active: value } }}
                  items={ITEMS}
                  value={active}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) : Promise(Void) { next { size: value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Breakpoint (#{breakpoint}px)">
                <Ui.Slider
                  onChange={(value : Number) : Promise(Void) { next { breakpoint: value } }}
                  value={breakpoint}
                  max={1500}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Tabs
                  onChange={(tab : String) { next { active: tab } }}
                  size={Ui.Size::Px(size)}
                  breakpoint={breakpoint}
                  active={active}
                  items={TABS[0]}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Active"
        content={
          <p>
            "The active tab can be set with the "

            <code>"active"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[22, 27]
            data={
              @format {
                  let items =
                    [
                      {
                        content: <{ "Tab 1" }>,
                        iconBefore: <></>,
                        iconAfter: <></>,
                        label: "Tab 1",
                        key: "tab_1"
                      },
                      {
                        content: <{ "Tab 2" }>,
                        iconBefore: <></>,
                        iconAfter: <></>,
                        label: "Tab 2",
                        key: "tab_2"
                      }
                    ]

                  <>
                    <Ui.Tabs
                      breakpoint={0}
                      active="tab_1"
                      items={items}/>

                    <Ui.Tabs
                      breakpoint={0}
                      active="tab_2"
                      items={items}/>
                  </>
              }
            }/>
        }/>

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
            highlight=[21, 27, 33]
            data={
              @format {
                  let items =
                    [
                      {
                        content: <{ "Tab 1" }>,
                        iconBefore: <></>,
                        iconAfter: <></>,
                        label: "Tab 1",
                        key: "tab_1"
                      },
                      {
                        content: <{ "Tab 2" }>,
                        iconBefore: <></>,
                        iconAfter: <></>,
                        label: "Tab 2",
                        key: "tab_2"
                      }
                    ]

                  <>
                    <Ui.Tabs
                      size={Ui.Size::Px(12)}
                      breakpoint={0}
                      active="tab_1"
                      items={items}/>

                    <Ui.Tabs
                      size={Ui.Size::Px(16)}
                      breakpoint={0}
                      active="tab_1"
                      items={items}/>

                    <Ui.Tabs
                      size={Ui.Size::Px(20)}
                      breakpoint={0}
                      active="tab_1"
                      items={items}/>
                  </>
              }
            }/>
        }/>

      <DocBox
        title="Breakpoint"
        content={
          <p>
            "The breakpoint which determines to show a button that opens a "

            <a href="/components/ui-action-sheet">
              <code>"Ui.ActionSheet"</code>
            </a>

            " (to select the tab) instead can be set using the "

            <code>"breakpoint"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[21, 26]
            data={
              @format {
                  let items =
                    [
                      {
                        content: <{ "Tab 1" }>,
                        iconBefore: <></>,
                        iconAfter: <></>,
                        label: "Tab 1",
                        key: "tab_1"
                      },
                      {
                        content: <{ "Tab 2" }>,
                        iconBefore: <></>,
                        iconAfter: <></>,
                        label: "Tab 2",
                        key: "tab_2"
                      }
                    ]

                  <>
                    <Ui.Tabs
                      breakpoint={0}
                      active="tab_1"
                      items={items}/>

                    <Ui.Tabs
                      breakpoint={1000}
                      active="tab_1"
                      items={items}/>
                  </>
              }
            }/>
        }/>

      <DocBox
        title="Change Event"
        content={
          <p>
            "The component calls the "

            <code>"onChange"</code>

            " handler (property) when a user selects an other tab."
          </p>
        }
        example={
          <Example
            highlight=[3, 4, 5, 6, 7]
            horizontalSpacing={20}
            data={
              @format {
                <Ui.Tabs
                  breakpoint={0}
                  active="tab_1"
                  onChange={
                    (tab : String) {
                      Ui.Notifications.notifyDefault(<{ "Selected: #{tab}" }>)
                    }
                  }
                  items=[
                    {
                      content: <{ "Tab 1" }>,
                      iconBefore: <></>,
                      iconAfter: <></>,
                      label: "Tab 1",
                      key: "tab_1"
                    },
                    {
                      content: <{ "Tab 2" }>,
                      iconBefore: <></>,
                      iconAfter: <></>,
                      label: "Tab 2",
                      key: "tab_2"
                    }
                  ]/>
              }
            }/>
        }/>
    </>
  }
}
