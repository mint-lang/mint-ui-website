component Documentation.Sizing {
  fun render {
    <>
      <Ui.Box title=<>"Sizing"</>>
        <p>
          "This document describes the sizing system and how components are using it."
        </p>
      </Ui.Box>

      <DocBox
        title="Default Size"
        content={
          <p>
            "The default size of the "
            <code>":root"</code>
            " is "
            <code>"16px"</code>
            " on desktop and "
            <code>"14px"</code>
            " on mobile."
          </p>
        }
      />

      <DocBox
        title="Sizing Components"
        example={
          <Example
            data={
              @format {
                <div style="font-size: 16px">
                  <div style="font-size: 2em">"I am twice as big!"</div>
                </div>
              }
            }
          />
        }
        content=<>
          <p>
            "Components use "

            <a
              href="https://developer.mozilla.org/en-US/docs/Web/CSS/length#em"
              target="_blank"
            >"em"</a>

            " for sizing."
          </p>

          <p>
            "This allows us to create components that scale well
            (by themselves or from parent components) using the "

            <a
              href="https://developer.mozilla.org/en-US/docs/Web/CSS/font-size"
              target="_blank"
            >"font-size property"</a>

            " and "

            <a
              href="https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Cascade_and_inheritance"
              target="_blank"
            >"CSS cascade and inheritance"</a>

            "."
          </p>

          <p>
            "When developing components use a pixel size first and then " \
            "convert them to em using the 16px as the base. For example a " \
            "1px border becomes 0.0625em (1/16 = 0.0625), which then scales " \
            "correctly."
          </p>
        </>
      />

      <DocBox
        title="Different Font Size"
        example={
          <Example
            data={
              @format {
                <div style="font-size: 16px">
                  <div
                    style="font-size: 0.875em;border: 0.07142em solid gray;padding: 0.7142em;"
                  >"My font-size is 14px, but my padding is 10px."</div>
                </div>
              }
            }
          />
        }
        content=<>
          <p>
            "Somethimes there is a need to change the font size and this " \
            "changes all the ems which calculated for that element. In this " \
            "case we need to calculate the changed font size as the base."
          </p>

          <p>
            "For example if we want to have a 10px padding on an element " \
            "which has a font size of 14px, then the calculation will be: " \
            "10/14 = 0.7142"
          </p>
        </>
      />

      <DocBox
        title="Ui.Size"
        example={
          <Example
            data={
              @format {
                <div style="font-size: 12px;">
                  <Ui.Container>
                    <Ui.Button label="12px"/>
                    <Ui.Button size={Ui.Size.Inherit} label="12px"/>
                    <Ui.Button size={Ui.Size.Px(20)} label="20px"/>
                    <Ui.Button size={Ui.Size.Px(24)} label="24px"/>
                  </Ui.Container>
                </div>
              }
            }
          />
        }
        content=<>
          <p>
            "Most components implement a "
            <code>"size"</code>
            " property which takes a "
            <code>"Ui.Size"</code>
            " enum."
          </p>

          <p>"It has three options:"</p>

          <ul>
            <li>
              <code>"Ui.Size.Em(Number)"</code>
              " - Sets the size to given number as em."
            </li>

            <li>
              <code>"Ui.Size.Px(Number)"</code>
              " - Sets the size to given number as pixel."
            </li>

            <li>
              <code>"Ui.Size.Inherit"</code>
              " - Sets the size so it's inherited from the parent element."
            </li>
          </ul>

          <p>
            "You can use this enum to set the size of a component (the default is usually "
            <code>"Ui.Size.Inherit"</code>
            ")."
          </p>

          <p>
            "You can use "
            <code>"font-size: \#{Ui.Size.toString(size)};"</code>
            " function in your components base style to set the size."
          </p>
        </>
      />
    </>
  }
}
