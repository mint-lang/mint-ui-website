component Documentation.ListItems {
  fun render {
    <>
      <Ui.Box title=<{ "List items" }>>
        <p>
          "In Mint UI the data for a list is defined with the "
          <code>"Ui.ListItem"</code>
          " enum."
        </p>
      </Ui.Box>

      <DocBox
        title="Example"
        content={
          <p>
            "Having a data structure to define list items allows us t" \
            "o display lists in different ways. For example we can di" \
            "splay the same list in a "

            <a href="/components/ui-native-select">
              "Ui.Native.Select"
            </a>

            " and a normal "

            <a href="/components/ui-select">
              "Ui.Select"
            </a>

            "."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                let items =
                  [
                    Ui.ListItem::Item(
                      content: <{ "Something" }>,
                      matchString: "something",
                      key: "something"),
                    Ui.ListItem::Item(
                      content: <{ "An other thing" }>,
                      matchString: "an other thing",
                      key: "an-other-thing")
                  ]

                <>
                  <Ui.Native.Select
                    placeholder="Select something!"
                    items={items}/>

                  <Ui.Select
                    placeholder="Select something!"
                    matchWidth={true}
                    items={items}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Ui.ListItem"
        content=<{
          "The "
          <code>"Ui.ListItem"</code>
          " enum is used to describe list items, currently it consists of:"

          <ul>
            <li>
              <code>"Ui.ListItem::Item"</code>
              " - an item in the list"
            </li>

            <li>
              <code>"Ui.ListItem::Divider"</code>
              " - a divider between list items."
            </li>
          </ul>
        }>
        example={
          <Hljs
            code={
              @format {
                [
                  Ui.ListItem::Item(
                    content: <{ "A list item!" }>,
                    matchString: "a list item",
                    key: "a-list-item"),
                  Ui.ListItem::Divider,
                  Ui.ListItem::Item(
                    content: <{ "An other list item!" }>,
                    matchString: "an other list item",
                    key: "an-other-list-item")
                ]
              }[1]
            }/>
        }/>
    </>
  }
}
