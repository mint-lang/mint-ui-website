component Reference.InteractiveList {
  state selected : String = "item-1"
  state interactive : Bool = true
  state intendable : Bool = true
  state size : Number = 16

  get playgroundCode : String {
    "Ui.InteractiveList"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("selected", "Set.fromArray([\"#{selected}\"])")
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("interactive", interactive)
    |> ComponentBuilder.addBool("intendable", intendable)
    |> ComponentBuilder.addExpression("items", ITEMS[1])
    |> ComponentBuilder.toString()
  }

  const ITEMS =
    @format {
      [
        Ui.ListItem::Item(
          content = <{ "Item 1" }>,
          matchString = "item-1",
          key = "item-1"),
        Ui.ListItem::Item(
          content = <{ "Item 2" }>,
          matchString = "item-2",
          key = "item-2"),
        Ui.ListItem::Divider,
        Ui.ListItem::Item(
          content = <{ "Item 4" }>,
          matchString = "item-4",
          key = "item-4"),
        Ui.ListItem::Item(
          content = <{ "Item 3" }>,
          matchString = "item-3",
          key = "item-3")
      ]
    }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.InteractiveList" }>>
        <p>
          "This component for displaying a list of items which can " \
          "be navigated and selected with keyboard or mouse."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.InteractiveList"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Selected">
                <Ui.Native.Select
                  onChange={(value : String) { next { selected = value } }}
                  items={ITEMS[0]}
                  value={selected}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Intendable">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { intendable = value } }}
                  checked={intendable}/>

              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Interactive">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { interactive = value } }}
                  checked={interactive}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.InteractiveList
                  onClickSelect={(key : String) { next { selected = key } }}
                  onSelect={(key : String) { next { selected = key } }}
                  selected={Set.fromArray([selected])}
                  interactive={interactive}
                  size={Ui.Size::Px(size)}
                  intendable={intendable}
                  items={ITEMS[0]}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Intendable"
        content={
          <p>
            "If the "

            <code>"intendable"</code>

            " property is "
            <code>"true"</code>

            " then items will not be selected when navigating with ke" \
            "ys, but only intended (shown with a chevron). Intended i" \
            "tems can be selected using the enter or spacing keys."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[20, 25]
            fullWidth={true}
            data={
              @format {
                try {
                  items =
                    [
                      Ui.ListItem::Item(
                        content = <{ "Item 1" }>,
                        matchString = "item-1",
                        key = "item-1"),
                      Ui.ListItem::Item(
                        content = <{ "Item 2" }>,
                        matchString = "item-2",
                        key = "item-2"),
                      Ui.ListItem::Item(
                        content = <{ "Item 3" }>,
                        matchString = "item-3",
                        key = "item-3")
                    ]

                  <>
                    <Ui.InteractiveList
                      interactive={true}
                      intendable={true}
                      items={items}/>

                    <Ui.InteractiveList
                      interactive={true}
                      intendable={false}
                      items={items}/>
                  </>
                }
              }
            }/>
        }/>

      <DocBox
        title="Interactive"
        content={
          <p>
            "The "

            <code>"interactive"</code>

            " property controls whether or not the component can be i" \
            "ntacted with a keyboard. If it's "

            <code>"false"</code>
            " then the component is not focusable."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[20, 26]
            fullWidth={true}
            data={
              @format {
                try {
                  items =
                    [
                      Ui.ListItem::Item(
                        content = <{ "Item 1" }>,
                        matchString = "item-1",
                        key = "item-1"),
                      Ui.ListItem::Item(
                        content = <{ "Item 2" }>,
                        matchString = "item-2",
                        key = "item-2"),
                      Ui.ListItem::Item(
                        content = <{ "Item 3" }>,
                        matchString = "item-3",
                        key = "item-3")
                    ]

                  <>
                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1"])}
                      interactive={true}
                      intendable={true}
                      items={items}/>

                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1"])}
                      interactive={false}
                      intendable={true}
                      items={items}/>
                  </>
                }
              }
            }/>
        }/>

      <DocBox
        title="Selected"
        content={
          <p>
            "The "

            <code>"selected"</code>

            " property controls which items are selected. It's a "

            <code>"Set(String)"</code>
            " where the values match the items keys."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[19, 24]
            fullWidth={true}
            data={
              @format {
                try {
                  items =
                    [
                      Ui.ListItem::Item(
                        content = <{ "Item 1" }>,
                        matchString = "item-1",
                        key = "item-1"),
                      Ui.ListItem::Item(
                        content = <{ "Item 2" }>,
                        matchString = "item-2",
                        key = "item-2"),
                      Ui.ListItem::Item(
                        content = <{ "Item 3" }>,
                        matchString = "item-3",
                        key = "item-3")
                    ]

                  <>
                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1"])}
                      interactive={false}
                      items={items}/>

                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1", "item-3"])}
                      interactive={false}
                      items={items}/>
                  </>
                }
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The "

            <code>"size"</code>

            " property controls the size of the component."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[20, 26, 32]
            fullWidth={true}
            data={
              @format {
                try {
                  items =
                    [
                      Ui.ListItem::Item(
                        content = <{ "Item 1" }>,
                        matchString = "item-1",
                        key = "item-1"),
                      Ui.ListItem::Item(
                        content = <{ "Item 2" }>,
                        matchString = "item-2",
                        key = "item-2"),
                      Ui.ListItem::Item(
                        content = <{ "Item 3" }>,
                        matchString = "item-3",
                        key = "item-3")
                    ]

                  <>
                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1"])}
                      size={Ui.Size::Px(12)}
                      interactive={false}
                      items={items}/>

                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1"])}
                      size={Ui.Size::Px(16)}
                      interactive={false}
                      items={items}/>

                    <Ui.InteractiveList
                      selected={Set.fromArray(["item-1"])}
                      size={Ui.Size::Px(20)}
                      interactive={false}
                      items={items}/>
                  </>
                }
              }
            }/>
        }/>

      <DocBox
        title="Select Event"
        content={
          <p>
            "The "

            <code>"onSelect"</code>

            " property is called when the selection changes using the keyboard."
          </p>
        }
        example={
          <Example
            highlight=[1, 2, 3, 4, 5]
            horizontalSpacing={20}
            fullWidth={true}
            data={
              @format {
                <Ui.InteractiveList
                  onSelect={
                    (selected : String) {
                      Ui.Notifications.notifyDefault(<{ "Selected: #{selected}" }>)
                    }
                  }
                  items=[
                    Ui.ListItem::Item(
                      content = <{ "Item 1" }>,
                      matchString = "item-1",
                      key = "item-1"),
                    Ui.ListItem::Item(
                      content = <{ "Item 2" }>,
                      matchString = "item-2",
                      key = "item-2"),
                    Ui.ListItem::Item(
                      content = <{ "Item 3" }>,
                      matchString = "item-3",
                      key = "item-3")
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Click Select Event"
        content={
          <p>
            "The "

            <code>"onClickSelect"</code>

            " property is called when an item is selected by clicking on it."
          </p>
        }
        example={
          <Example
            highlight=[1, 2, 3, 4, 5]
            horizontalSpacing={20}
            fullWidth={true}
            data={
              @format {
                <Ui.InteractiveList
                  onClickSelect={
                    (selected : String) {
                      Ui.Notifications.notifyDefault(<{ "Selected: #{selected}" }>)
                    }
                  }
                  items=[
                    Ui.ListItem::Item(
                      content = <{ "Item 1" }>,
                      matchString = "item-1",
                      key = "item-1"),
                    Ui.ListItem::Item(
                      content = <{ "Item 2" }>,
                      matchString = "item-2",
                      key = "item-2"),
                    Ui.ListItem::Item(
                      content = <{ "Item 3" }>,
                      matchString = "item-3",
                      key = "item-3")
                  ]/>
              }
            }/>
        }/>
    </>
  }
}
