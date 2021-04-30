routes {
  / {
    Application.setPage(Page::Home)
  }

  /pricing {
    Application.setPage(Page::Pricing)
  }

  /examples {
    Application.setPage(Page::Examples)
  }

  /examples/:page (page : String) {
    Application.setExamplePage(page)
  }

  /documentation {
    sequence {
      Application.setDocumentationPage("introduction")
      Window.setUrl("/documentation/introduction")
    }
  }

  /documentation/:page#:hash (page : String) {
    Application.setDocumentationPage(page)
  }

  /documentation/:page (page : String) {
    Application.setDocumentationPage(page)
  }

  /components {
    sequence {
      Application.setComponentPage("ui-action-sheet")
      Window.setUrl("/components/ui-action-sheet")
    }
  }

  /components/:page#:hash (page : String) {
    Application.setComponentPage(page)
  }

  /components/:page (page : String) {
    Application.setComponentPage(page)
  }

  * {
    Application.setPage(Page::NotFound)
  }
}
