component Main {
  connect Application exposing { page, COMPONENT_ITEMS, DOCUMENTATION_ITEMS }

  use Provider.Url { changes = setTitle }

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

  fun setTitle (url : Url) : Promise(Never, Void) {
    try {
      content =
        case (page) {
          Page::Documentation name item => "/ Documentation / #{name}"
          Page::Component item => "/ Components / #{item.name}"
          Page::Example name item => "/ Example / #{name}"
          Page::Examples => "/ Examples"

          => " - Beatuiful, Reliable Components for Mint"
        }

      Window.setTitle("Mint UI #{content}")
    }
  }

  get content {
    case (page) {
      Page::Example item => <{ "This branch is handled one level up!" }>
      Page::NotFound => <Page.NotFound/>
      Page::Examples => <Page.Examples/>
      Page::Home => <Pages.Landing/>
      Page::Initial => <{  }>

      Page::Component item =>
        <Ui.Layout.Documentation
          mobileNavigationLabel=<{ "Components" }>
          items={COMPONENT_ITEMS}>

          <div::content>
            <{ item.page }>
          </div>

          <PropertiesTable documentation={item.documentation}/>

        </Ui.Layout.Documentation>

      Page::Documentation name item =>
        <Ui.Layout.Documentation items={DOCUMENTATION_ITEMS}>
          <div::content>
            <{ item }>
          </div>
        </Ui.Layout.Documentation>
    }
  }

  fun render : Html {
    <Ui.Theme.Root
      fontConfiguration={Ui:DEFAULT_FONT_CONFIGURATION}
      tokens={Ui:DEFAULT_TOKENS}>

      case (page) {
        Page::Example name item =>
          <div::example>
            <{ item }>
          </div>

        =>
          <>
            <Ui.ScrollToTop/>

            <Ui.Layout.Website
              content={content}
              footer={<Footer/>}
              header={<Header/>}/>
          </>
      }

    </Ui.Theme.Root>
  }
}
