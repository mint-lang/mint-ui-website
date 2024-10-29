component Main {
  connect Application exposing { page, COMPONENT_ITEMS, DOCUMENTATION_ITEMS }

  style content {
    align-content: start;
    margin-bottom: 2em;
    grid-gap: 2em;
    display: grid;
  }

  style example {
    min-height: 100vh;
    display: grid;
  }

  get content {
    case page {
      Example(item) => <>"This branch is handled one level up!"</>
      NotFound => <Page.NotFound/>
      Examples => <Page.Examples/>
      Pricing => <Pages.Pricing/>
      Home => <Pages.Landing/>
      Initial => <></>

      Component(item) =>
        <Ui.Layout.Documentation
          mobileNavigationLabel=<>"Components"</>
          items={COMPONENT_ITEMS}
        ><div::content><>item.page</></div></Ui.Layout.Documentation>

      Documentation(name, item) =>
        <Ui.Layout.Documentation items={DOCUMENTATION_ITEMS}>
          <div::content><>item</></div>
        </Ui.Layout.Documentation>
    }
  }

  fun render : Html {
    <Ui.Theme.Root
      fontConfiguration={Ui.DEFAULT_FONT_CONFIGURATION}
      tokens={Ui.DEFAULT_TOKENS}
    >
      if let Page.Example(name, item) = page {
        <div::example>item</div>
      } else {
        <>
          <Ui.ScrollToTop/>

          <Ui.Layout.Website
            footer={<Footer/>}
            header={<Header/>}
            content={content}
            maxWidth="100vw"
          />
        </>
      }
    </Ui.Theme.Root>
  }
}
