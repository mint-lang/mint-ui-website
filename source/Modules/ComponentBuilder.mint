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
      addNewLines = true,
      properties = [],
      children = [],
      tag = tag
    }
  }

  /* Renders an array of strings as a tuple. */
  fun tuple (items : Array(String)) : String {
    "{#{String.join(", ", items)}"
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
  fun setAddNewLines (value : Bool, builder : ComponentBuilder) {
    { builder | addNewLines = value }
  }

  /* Adds a string child node. */
  fun addStringChild (child : String, builder : ComponentBuilder) {
    { builder | children = Array.push("\"#{child}\"", builder.children) }
  }

  /* Adds a raw child node. */
  fun addChild (child : String, builder : ComponentBuilder) {
    { builder | children = Array.push(child, builder.children) }
  }

  /* Adds a raw attribute. */
  fun addRaw (
    name : String,
    value : String,
    builder : ComponentBuilder
  ) {
    if (String.isNotBlank(value)) {
      { builder | properties = Array.push({name, value}, builder.properties) }
    } else {
      builder
    }
  }

  /* Adds a string HTML attribute. */
  fun addStringHtml (
    name : String,
    value : String,
    builder : ComponentBuilder
  ) {
    { builder | properties = Array.push({name, "<{ \"#{value}\" }>"}, builder.properties) }
  }

  /* Adds a string attribute. */
  fun addString (
    name : String,
    value : String,
    builder : ComponentBuilder
  ) {
    if (String.isNotBlank(value)) {
      { builder | properties = Array.push({name, "\"#{value}\""}, builder.properties) }
    } else {
      builder
    }
  }

  /* Adds a boolean attribute. */
  fun addBool (
    name : String,
    value : Bool,
    builder : ComponentBuilder
  ) {
    { builder | properties = Array.push({name, "{#{Bool.toString(value)}}"}, builder.properties) }
  }

  /* Adds a number attribute. */
  fun addNumber (
    name : String,
    value : Number,
    builder : ComponentBuilder
  ) {
    { builder | properties = Array.push({name, "{#{value}}"}, builder.properties) }
  }

  /* Adds a pixel size size enum attribute. */
  fun addSizePx (
    name : String,
    value : Number,
    builder : ComponentBuilder
  ) {
    { builder | properties = Array.push({name, "{Ui.Size::Px(#{value})}"}, builder.properties) }
  }

  /* Adds a em size size enum attribute. */
  fun addSizeEm (
    name : String,
    value : Number,
    builder : ComponentBuilder
  ) {
    { builder | properties = Array.push({name, "{Ui.Size::Em(#{value})}"}, builder.properties) }
  }

  /* Adds an expression attribute. */
  fun addExpression (
    name : String,
    value : String,
    builder : ComponentBuilder
  ) {
    { builder | properties = Array.push({name, "{#{value}}"}, builder.properties) }
  }

  /* Adds a Ui.Icons icon attribute. */
  fun addIcon (
    name : String,
    icon : String,
    builder : ComponentBuilder
  ) {
    if (String.isBlank(icon)) {
      builder
    } else {
      addExpression(name, "Ui.Icons:#{icon}", builder)
    }
  }

  /* Renders the builder as a component source. */
  fun toString (builder : ComponentBuilder) {
    try {
      props =
        if (Array.isEmpty(builder.properties)) {
          ""
        } else if (Array.size(builder.properties) == 1) {
          case (builder.properties[0]) {
            Maybe::Just(property) =>
              try {
                {name, value} =
                  property

                " #{name}=#{value}"
              }

            => ""
          }
        } else {
          for (property of builder.properties) {
            try {
              {name, value} =
                property

              "#{name}=#{value}"
            }
          }
          |> String.join("\n")
          |> String.indent(2)
          |> String.wrap("\n", "")
        }

      endTag =
        if (Array.isEmpty(builder.children)) {
          ""
        } else {
          "\n</#{builder.tag}>"
        }

      tagEnd =
        if (Array.isEmpty(builder.children)) {
          "/>"
        } else {
          ">\n"
        }

      children =
        builder.children
        |> Array.map(String.indent(2))
        |> String.join(
          if (builder.addNewLines) {
            "\n\n"
          } else {
            "\n"
          })

      "<#{builder.tag}#{props}#{tagEnd}#{children}#{endTag}"
    }
  }
}
