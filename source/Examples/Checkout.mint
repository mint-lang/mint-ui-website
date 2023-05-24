component Examples.Checkout {
  connect ListItems exposing { COUNTRIES }

  state errors : Map(String, Array(String)) = Map.empty()

  state firstName : String = ""
  state lastName : String = ""
  state message : String = ""
  state phone : String = ""
  state email : String = ""

  state address : String = ""
  state country : String = ""
  state city : String = ""
  state zip : String = ""

  style message {
    min-height: 317px;
    display: grid;
  }

  fun submit (event : Html.Event) {
    let errors =
      Validation.merge(
        [
          Validation.isNotBlank(firstName, {"firstName", "Please enter the first name."}),
          Validation.isNotBlank(message, {"message", "Please enter the message."}),
          Validation.isNotBlank(lastName, {"lastName", "Please enter the last name."}),
          Validation.isNotBlank(phone, {"phone", "Please enter the phone number."}),
          Validation.isNotBlank(email, {"email", "Please enter the email address."}),
          Validation.isValidEmail(email, {"email", "Please enter a valid email address."}),
          Validation.isNotBlank(address, {"address", "Please enter the address."}),
          Validation.isNotBlank(city, {"city", "Please enter the city address."}),
          Validation.isNotBlank(country, {"country", "Please select the country."}),
          Validation.isNotBlank(zip, {"zip", "Please enter the zip code."}),
          Validation.isNumber(zip, {"zip", "The zip code can only contain numbers."}),
          Validation.hasExactNumberOfCharacters(zip, 5, {"zip", "The zip code needs to have 5 digits."})
        ])

    await next { errors: errors }

    if Map.isEmpty(errors) {
      Ui.Notifications.notifyDefault(<{ "Thanks for filling in the data..." }>)
    }
  }

  fun render : Html {
    <Ui.Layout.Website
      maxWidth="100vw"
      breadcrumbs={
        <Ui.Breadcrumbs
          separator=<{ "»" }>
          items=[
            {"/examples", <>"Home"</>},
            {"/examples", <>"Cart"</>},
            {"", <>"Shipping"</>}
          ]/>
      }
      header={
        <Ui.Header
          brand={
            <Ui.Brand
              icon={Ui.Icons:CART}
              name="Mint Shop"
              href="/examples"/>
          }
          items=[
            Ui.NavItem::Link(
              iconBefore: Ui.Icons:HOME,
              iconAfter: <></>,
              label: "Home",
              href: "/examples",
              target: ""),
            Ui.NavItem::Link(
              iconBefore: Ui.Icons:JERSEY,
              iconAfter: <></>,
              label: "Products",
              href: "/examples",
              target: ""),
            Ui.NavItem::Divider,
            Ui.NavItem::Link(
              iconBefore: Ui.Icons:CART,
              iconAfter: <></>,
              label: "Cart",
              href: "/examples",
              target: "")
          ]/>
      }
      content={
        <Ui.Content>
          <h1>"Checkout / Shipping"</h1>

          <p>"Please provide the details below which are required for the shipping the products."</p>

          <Ui.Container
            orientation="vertical"
            gap={Ui.Size::Em(2)}
            align="stretch">

            <Ui.Grid
              width={Ui.Size::Em(32)}
              gap={Ui.Size::Em(2)}>

              <Ui.Box title=<{ "Billing Address" }>>
                <Ui.Container
                  orientation="vertical"
                  align="stretch"
                  gap={Ui.Size::Em(1)}>

                  <Ui.Grid
                    mobileWidth={Ui.Size::Em(15)}
                    width={Ui.Size::Em(15)}
                    gap={Ui.Size::Em(1)}>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "firstName")}
                      label="First Name *">

                      <Ui.Input
                        onChange={(value : String) { next { firstName: value } }}
                        invalid={Map.has(errors, "firstName")}
                        placeholder="John"
                        value={firstName}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "lastName")}
                      label="Last Name *">

                      <Ui.Input
                        onChange={(value : String) { next { lastName: value } }}
                        invalid={Map.has(errors, "lastName")}
                        placeholder="Doe"
                        value={lastName}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "phone")}
                      label="Phone * ">

                      <Ui.Input
                        onChange={(value : String) { next { phone: value } }}
                        invalid={Map.has(errors, "phone")}
                        placeholder="+360123467"
                        value={phone}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "email")}
                      label="Email *">

                      <Ui.Input
                        onChange={(value : String) { next { email: value } }}
                        invalid={Map.has(errors, "email")}
                        placeholder="john@doe.com"
                        value={email}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "address")}
                      label="Address *">

                      <Ui.Input
                        onChange={(value : String) { next { address: value } }}
                        invalid={Map.has(errors, "address")}
                        placeholder="20 Paoli Pike"
                        value={address}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "city")}
                      label="City *">

                      <Ui.Input
                        onChange={(value : String) { next { city: value } }}
                        invalid={Map.has(errors, "city")}
                        placeholder="Paoli"
                        value={city}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "country")}
                      label="Country *">

                      <Ui.Select
                        onChange={(value : String) { next { country: value } }}
                        invalid={Map.has(errors, "country")}
                        position={Ui.Position::BottomLeft}
                        placeholder="United States"
                        items={COUNTRIES}
                        value={country}/>

                    </Ui.Field>

                    <Ui.Field
                      error={Validation.getFirstError(errors, "zip")}
                      label="Zip Code *">

                      <Ui.Input
                        onChange={(value : String) { next { zip: value } }}
                        invalid={Map.has(errors, "zip")}
                        placeholder="19301"
                        value={zip}/>

                    </Ui.Field>

                  </Ui.Grid>

                  <Ui.Field
                    error={Validation.getFirstError(errors, "message")}
                    label="Message">

                    <Ui.Textarea
                      onChange={(value : String) { next { message: value } }}
                      invalid={Map.has(errors, "message")}
                      behavior="resize-vertical"
                      value={message}/>

                  </Ui.Field>

                </Ui.Container>
              </Ui.Box>

              <Ui.Box title=<{ "Additional Information" }>>
                <h3>"Section 1"</h3>

                <p>
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit," \
                  " sed do eiusmod tempor incididunt ut labore et dolore ma" \
                  "gna aliqua. Ut enim ad minim veniam, quis nostrud exerci" \
                  "tation ullamco laboris nisi ut aliquip ex ea commodo con" \
                  "sequat. Duis aute irure dolor in reprehenderit in volupt" \
                  "ate velit esse cillum dolore eu fugiat nulla pariatur. E" \
                  "xcepteur sint occaecat cupidatat non proident, sunt in c" \
                  "ulpa qui officia deserunt mollit anim id est laborum."
                </p>

                <h3>"Section 2"</h3>

                <p>
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit," \
                  " sed do eiusmod tempor incididunt ut labore et dolore ma" \
                  "gna aliqua. Ut enim ad minim veniam, quis nostrud exerci" \
                  "tation ullamco laboris nisi ut aliquip ex ea commodo con" \
                  "sequat. Duis aute irure dolor in reprehenderit in volupt" \
                  "ate velit esse cillum dolore eu fugiat nulla pariatur. E" \
                  "xcepteur sint occaecat cupidatat non proident, sunt in c" \
                  "ulpa qui officia deserunt mollit anim id est laborum."
                </p>
              </Ui.Box>

            </Ui.Grid>

            <div>
              <Ui.Button
                iconAfter={Ui.Icons:ARROW_RIGHT}
                onClick={submit}
                label="Continue"/>
            </div>

          </Ui.Container>
        </Ui.Content>
      }/>
  }
}
