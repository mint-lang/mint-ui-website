component Examples.Dashboard {
  connect Ui exposing { mobile }

  style centered {
    text-align: center;
  }

  style base {
    align-content: start;
    grid-gap: 2.5em;
    display: grid;
  }

  style row {
    grid-gap: 1em;
    display: grid;
  }

  get content : Html {
    <div::base>
      <div::row>
        <Ui.Content>
          <h2>"Recently Updated Applications"</h2>
          <p>"You can see your recently updated applications."</p>
        </Ui.Content>

        <Ui.Grid gap={Ui.Size::Em(2)}>
          <Ui.Card href="/examples">
            <Ui.Card.Image src={@asset(../../assets/images/app-weather.jpg)}/>

            <Ui.Card.Container
              content=<{ "A simple weather tracking application." }>
              subtitle=<{ "Updated 2 days ago" }>
              title=<{ "Mint Weather" }>/>
          </Ui.Card>

          <Ui.Card href="/examples">
            <Ui.Card.Image src={@asset(../../assets/images/app-weight-tracker.jpg)}/>

            <Ui.Card.Container
              content=<{ "An application to track your weight in the morning and evening." }>
              subtitle=<{ "Updated 4 days ago" }>
              title=<{ "Mint Health" }>/>
          </Ui.Card>

          <Ui.Card href="/examples">
            <Ui.Card.Image src={@asset(../../assets/images/app-mail.jpg)}/>

            <Ui.Card.Container
              content=<{ "A simple email application that uses SMTP." }>
              subtitle=<{ "Updated a week ago" }>
              title=<{ "Mint Mail" }>/>
          </Ui.Card>

          <Ui.Card href="/examples">
            <Ui.Card.Image src={@asset(../../assets/images/app-contacts.jpg)}/>

            <Ui.Card.Container
              content=<{ "A simple contacts application." }>
              subtitle=<{ "Updated 2 weeks ago" }>
              title=<{ "Mint Contacts" }>/>
          </Ui.Card>

          <Ui.Card href="/examples">
            <Ui.Card.Image src={@asset(../../assets/images/app-books.jpg)}/>

            <Ui.Card.Container
              content=<{ "A simple book collecting application." }>
              subtitle=<{ "Updated 2 monts ago" }>
              title=<{ "Mint Books" }>/>
          </Ui.Card>
        </Ui.Grid>
      </div>

      <div::row>
        <Ui.Content>
          <h2>"Usage"</h2>
          <p>"You can check below what kind of resources are you using."</p>
        </Ui.Content>

        <Ui.Grid gap={Ui.Size::Em(2)}>
          <Ui.Box label=<{ "API Calls" }>>
            <p::centered>
              <Ui.CircularProgress
                format={Number.toString}
                current={15201}
                max={40000}/>
            </p>

            <p::centered>"Number of API calls you made in this month."</p>
          </Ui.Box>

          <Ui.Box label=<{ "Verifications" }>>
            <p::centered>
              <Ui.CircularProgress
                format={Number.toString}
                current={5780}
                max={10000}/>
            </p>

            <p::centered>"Number of verifications you made in this month."</p>
          </Ui.Box>

          <Ui.Box label=<{ "Storage" }>>
            <p::centered>
              <Ui.CircularProgress
                format={FileSize.format}
                current={72401334642}
                max={107374182400}/>
            </p>

            <p::centered>"The storage space your files and photos takes up."</p>
          </Ui.Box>

          <Ui.Box label=<{ "Bandwith" }>>
            <p::centered>
              <Ui.CircularProgress
                format={FileSize.format}
                current={432401334642}
                max={2199023255552}/>
            </p>

            <p::centered>"The incoming and outgoing traffic this month."</p>
          </Ui.Box>

          <Ui.Box label=<{ "Users" }>>
            <p::centered>
              <Ui.CircularProgress
                current={400}
                max={500}/>
            </p>

            <p::centered>"The number of users logged in this month."</p>
          </Ui.Box>
        </Ui.Grid>
      </div>
    </div>
  }

  fun render : Html {
    <Ui.Layout.Website
      content={content}
      header={
        <Ui.Header
          brand={
            <Ui.Brand
              icon={Ui.Icons:BEAKER}
              name="Mint Labs"
              href="/examples"/>
          }
          items=[
            Ui.NavItem::Link(
              iconBefore = Ui.Icons:DASHBOARD,
              iconAfter = <></>,
              href = "/examples/dashboard",
              label = "Dashboard",
              target = ""),
            Ui.NavItem::Link(
              iconBefore = Ui.Icons:PERSON,
              iconAfter = <></>,
              href = "/examples/user-list",
              label = "Users",
              target = ""),
            Ui.NavItem::Divider,
            Ui.NavItem::Link(
              iconBefore = Ui.Icons:SIGN_OUT,
              iconAfter = <></>,
              href = "/examples/login",
              label = "Logout",
              target = "")
          ]/>
      }/>
  }
}
