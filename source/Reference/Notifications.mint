component Reference.Notifications {
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Notifications"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Notifications"</>>
        <p>"A global component to display notifications."</p>

        <ul>
          <li>
            "Notifications are displayed in the top-right corner of the screen."
          </li>

          <li>"By default a notification remains on the screen for 7 seconds."</li>
          <li>"Any HTML or component can be the body of the notification."</li>
          <li>"Clicking on the notification dismisses it."</li>
          <li>"There is an indicator of the remaining time ."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Basic Usage"
        content={
          <p>
            "You can display a notification using the "
            <code>"Ui.Notifications.notifyDefault(content)"</code>
            " function."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.Button
                  label="Show notification!"
                  onClick={
                    (event : Html.Event) {
                      Ui.Notifications.notifyDefault(<>"Notification!"</>)
                    }
                  }
                />
              }
            }
          />
        }
      />

      <DocBox
        title="Advanced Usage"
        content={
          <p>
            "If you need more control over the duration can use the "
            <code>"Ui.Notifications.notify(content, duration)"</code>
            " function."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Button
                    onClick={
                      (event : Html.Event) {
                        Ui.Notifications.notify(<>"Notification!"</>, 2000)
                      }
                    }
                    label="Show notification!"
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Content"
        content={
          <p>
            "The content of the notification can be any "
            <code>"Html"</code>
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Button
                    label="Show text with an icon!"
                    onClick={
                      (event : Html.Event) {
                        Ui.Notifications.notify(
                          <Ui.Container gap={Ui.Size.Em(0.75)}>
                            <Ui.Icon icon={Ui.Icons.CHECK}/>
                            "It's done"
                          </Ui.Container>, 2000)
                      }
                    }
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
