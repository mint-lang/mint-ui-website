component Examples.Login {
  state errors : Map(String, Array(String)) = Map.empty()
  state password : String = ""
  state email : String = ""

  fun submit (event : Html.Event) {
    let errors =
      Validation.merge(
        [
          Validation.isNotBlank(email,
            {"email", "Please enter the email address."}),
          Validation.isValidEmail(email,
            {"email", "Please enter a valid email address."}),
          Validation.isNotBlank(password,
            {"password", "Please enter the password."})
        ])

    await next { errors: errors }

    if Map.isEmpty(errors) {
      Ui.Notifications.notifyDefault(<>"You are now logged in 👋"</>)
      Window.navigate("/examples/dashboard")
    }
  }

  fun render : Html {
    <Ui.Layout.Centered maxContentWidth="320px">
      <Ui.Column gap={Ui.Size.Em(1.5)}>
        <Ui.Brand icon={Ui.Icons.BEAKER} name="Mint Labs" href="/examples"/>

        <Ui.Box title=<>"Login"</>>
          <Ui.Column gap={Ui.Size.Em(1)}>
            <Ui.Field
              error={Validation.getFirstError(errors, "email")}
              label="Email *"
            >
              <Ui.Input
                invalid={Map.has(errors, "email")}
                placeholder="john@doe.com"
                onChange={-> email}
                value={email}
                type="email"
              />
            </Ui.Field>

            <Ui.Field
              error={Validation.getFirstError(errors, "password")}
              label="Password *"
            >
              <Ui.Input
                invalid={Map.has(errors, "password")}
                onChange={-> password}
                placeholder="12345678"
                value={password}
                type="password"
              />
            </Ui.Field>

            <Ui.Button
              iconAfter={Ui.Icons.ARROW_RIGHT}
              onClick={submit}
              label="Continue"
            />
          </Ui.Column>
        </Ui.Box>

        <Ui.Content textAlign="center" size={Ui.Size.Em(0.85)}>
          <div>
            "Forgot your password? "
            <a href="/examples/recover-password">"Recover it here."</a>
          </div>

          <div>
            "Need an account? "
            <a href="/examples/register">"Register here."</a>
          </div>
        </Ui.Content>
      </Ui.Column>
    </Ui.Layout.Centered>
  }
}
