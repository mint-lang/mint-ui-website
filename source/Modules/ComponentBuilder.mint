/* This is a record for building dynamic component source code. */
record ComponentBuilder {
  properties : Array(Tuple(String, String)),
  children : Array(String),
  addNewLines : Bool,
  tag : String
}

/* This module has functions to build a dynamic component soure code. */
module ComponentBuilder {
  /* Creates an empty component builder record. */
  fun new (tag : String) : ComponentBuilder {
    {
      addNewLines: true,
      properties: [],
      children: [],
      tag: tag
    }
  }

  /* Renders an array of strings as a tuple. */
  fun tuple (items : Array(String)) : String {
    "{#{String.join(items, ", ")}"
  }

  /* Renders an array of items. */
  fun array (items : Array(String)) : String {
    items
    |> Array.map((item : String) { item })
    |> String.join(",\n")
    |> String.indent(2)
    |> String.wrap("[\n", "\n]")
  }

  /* Sets the `addNewLines` field. */
  fun setAddNewLines (builder : ComponentBuilder, value : Bool) {
    { builder | addNewLines: value }
  }

  /* Adds a string child node. */
  fun addStringChild (builder : ComponentBuilder, child : String) {
    { builder | children: Array.push(builder.children, "\"#{child}\"") }
  }

  /* Adds a raw child node. */
  fun addChild (builder : ComponentBuilder, child : String) {
    { builder | children: Array.push(builder.children, child) }
  }

  /* Adds a raw attribute. */
  fun addRaw (
    builder : ComponentBuilder,
    name : String,
    value : String
  ) {
    if (String.isNotBlank(value)) {
      { builder | properties: Array.push(builder.properties, {name, value}) }
    } else {
      builder
    }
  }

  /* Adds a string HTML attribute. */
  fun addStringHtml (
    builder : ComponentBuilder,
    name : String,
    value : String
  ) {
    { builder | properties: Array.push(builder.properties, {name, "<{ \"#{value}\" }>"}) }
  }

  /* Adds a string attribute. */
  fun addString (
    builder : ComponentBuilder,
    name : String,
    value : String
  ) {
    if (String.isNotBlank(value)) {
      { builder | properties: Array.push(builder.properties, {name, "\"#{value}\""}) }
    } else {
      builder
    }
  }

  /* Adds a boolean attribute. */
  fun addBool (
    builder : ComponentBuilder,
    name : String,
    value : Bool,
  ) {
    { builder | properties: Array.push(builder.properties, {name, "{#{Bool.toString(value)}}"}) }
  }

  /* Adds a number attribute. */
  fun addNumber (
    builder : ComponentBuilder,
    name : String,
    value : Number
  ) {
    { builder | properties: Array.push(builder.properties, {name, "{#{value}}"}) }
  }

  /* Adds a pixel size size enum attribute. */
  fun addSizePx (
    builder : ComponentBuilder,
    name : String,
    value : Number
  ) {
    { builder | properties: Array.push(builder.properties, {name, "{Ui.Size::Px(#{value})}"}) }
  }

  /* Adds a em size size enum attribute. */
  fun addSizeEm (
    builder : ComponentBuilder,
    name : String,
    value : Number
  ) {
    { builder | properties: Array.push(builder.properties, {name, "{Ui.Size::Em(#{value})}"}) }
  }

  /* Adds an expression attribute. */
  fun addExpression (
    builder : ComponentBuilder,
    name : String,
    value : String,
  ) {
    { builder | properties: Array.push(builder.properties, {name, "{#{value}}"}) }
  }

  /* Adds a Ui.Icons icon attribute. */
  fun addIcon (
    builder : ComponentBuilder,
    name : String,
    icon : String,
  ) {
    if (String.isBlank(icon)) {
      builder
    } else {
      addExpression(builder, name, "Ui.Icons:#{icon}")
    }
  }

  /* Renders the builder as a component source. */
  fun toString (builder : ComponentBuilder) {
      let props =
        if (Array.isEmpty(builder.properties)) {
          ""
        } else if (Array.size(builder.properties) == 1) {
          case (builder.properties[0]) {
            Maybe::Just(property) => {
              let {name, value} =
                property

              " #{name}=#{value}"
            }

            => ""
          }
        } else {
          for (property of builder.properties) {
            let {name, value} =
              property

            "#{name}=#{value}"
          }
          |> String.join("\n")
          |> String.indent(2)
          |> String.wrap("\n", "")
        }

      let endTag =
        if (Array.isEmpty(builder.children)) {
          ""
        } else {
          "\n</#{builder.tag}>"
        }

      let tagEnd =
        if (Array.isEmpty(builder.children)) {
          "/>"
        } else {
          ">\n"
        }

      let children =
        builder.children
        |> Array.map((string : String) { String.indent(string, 2) })
        |> String.join(
          if (builder.addNewLines) {
            "\n\n"
          } else {
            "\n"
          })

      "<#{builder.tag}#{props}#{tagEnd}#{children}#{endTag}"
  }
}
