component Reference.Calendar {
  state month : Time = Time.atBeginningOfMonth(Time.now())
  state day : Time = Time.atBeginningOfDay(Time.now())
  state size : Number = 16

  state changeMonthOnSelect : Bool = false
  state disabled : Bool = false
  state embedded : Bool = false

  get playgroundCode {
    let monthValue =
      "Time.from(#{`#{month}.getFullYear()`}, #{`#{month}.getMonth() + 1`}, #{`#{month}.getDate()`})"

    let dayValue =
      "Time.from(#{`#{day}.getFullYear()`}, #{`#{day}.getMonth() + 1`}, #{`#{day}.getDate()`})"

    "Ui.Calendar"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("month", monthValue)
    |> ComponentBuilder.addExpression("day", dayValue)
    |> ComponentBuilder.addBool("changeMonthOnSelect", changeMonthOnSelect)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("embedded", embedded)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Calendar"</>>
        <p>"Provides a calendar where the user can select a day in a month."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Calendar"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Day">
                <Ui.DatePicker onChange={-> day} value={day}/>
              </Ui.Field>

              <Ui.Field label="Month">
                <Ui.DatePicker onChange={-> month} value={month}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Disabled">
                <Ui.Checkbox onChange={-> disabled} checked={disabled}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field.Horizontal}
                label="Change Month on Select"
              >
                <Ui.Checkbox
                  onChange={-> changeMonthOnSelect}
                  checked={changeMonthOnSelect}
                />
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Embeeded">
                <Ui.Checkbox onChange={-> embedded} checked={embedded}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.Calendar
                  changeMonthOnSelect={changeMonthOnSelect}
                  onMonthChange={-> month}
                  size={Ui.Size.Px(size)}
                  disabled={disabled}
                  embedded={embedded}
                  onChange={-> day}
                  month={month}
                  day={day}
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Change Month on Select"
        content={
          <p>
            "The "
            <code>"changeMonthOnSelect"</code>
            " property controls Whether or not to fire the "
            <b>"month change event"</b>
            " when clicking on a day that is not in the current month."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Calendar
                    onMonthChange={
                      (month : Time) {
                        Ui.Notifications.notifyDefault(
                          <>
                            Time.format(month, Time.Format.ENGLISH, "%Y-%m-%d")
                          </>)
                      }
                    }
                    changeMonthOnSelect={false}
                  />

                  <Ui.Calendar
                    onMonthChange={
                      (month : Time) {
                        Ui.Notifications.notifyDefault(
                          <>
                            Time.format(month, Time.Format.ENGLISH, "%Y-%m-%d")
                          </>)
                      }
                    }
                    changeMonthOnSelect={true}
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
            "The size of the calendar can be set with the "
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
                  <Ui.Calendar size={Ui.Size.Px(12)}/>
                  <Ui.Calendar size={Ui.Size.Px(16)}/>
                  <Ui.Calendar size={Ui.Size.Px(20)}/>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Change Event"
        content={
          <p>
            "The calendar calls the "
            <code>"onChange"</code>
            " handler (property) when a user selects a day."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <Ui.Calendar
                  onChange={
                    (day : Time) {
                      Ui.Notifications.notifyDefault(
                        <>Time.format(day, Time.Format.ENGLISH, "%Y-%m-%d")</>)
                    }
                  }
                />
              }
            }
          />
        }
      />

      <DocBox
        title="Month Change Event"
        content={
          <p>
            "The calendar calls the "
            <code>"onMonthChange"</code>
            " handler (property) when a user navigates to a different month."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <Ui.Calendar
                  onMonthChange={
                    (day : Time) {
                      Ui.Notifications.notifyDefault(
                        <>Time.format(day, Time.Format.ENGLISH, "%Y-%m-%d")</>)
                    }
                  }
                />
              }
            }
          />
        }
      />

      <DocBox
        title="Disabled"
        content={
          <p>
            "The calendar can be disabled using the "
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
                  <Ui.Calendar disabled={false}/>
                  <Ui.Calendar disabled={true}/>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Embedded"
        content={
          <p>
            "The calendar can be used in an embedded form where there is no " \
            "padding, border and background using the "

            <code>"embedded"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Calendar embedded={false}/>
                  <Ui.Calendar embedded={true}/>
                </>
              }
            }
          />
        }
      />
    </>
  }
}
