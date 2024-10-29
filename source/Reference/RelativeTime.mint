component Reference.RelativeTime {
  state date : Time = Time.atBeginningOfDay(Time.now())

  get playgroundCode : String {
    let value =
      "Time.from(#{`#{date}.getFullYear()`}, #{`#{date}.getMonth() + 1`}, #{`#{date}.getDate()`})"

    "Ui.RelativeTime"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("date", value)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.RelativeTime"</>>
        <p>
          "Renders a time relative from the current time in human readable language."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.RelativeTime"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Date">
                <Ui.DatePicker onChange={-> date} value={date}/>
              </Ui.Field>
            </>
            data={{<Ui.RelativeTime date={date}/>, playgroundCode}}
          />
        }
      />

      <DocBox
        title="Date"
        content={
          <p>
            "The date can be set with the "
            <code>"date"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.RelativeTime date={Time.utc(2021, 1, 1, 0, 0, 0, 0)}/>
                  <Ui.RelativeTime date={Time.utc(2020, 1, 1, 0, 0, 0, 0)}/>
                </>
              }
            }
          />
        }
      />
    </>
  }
}
