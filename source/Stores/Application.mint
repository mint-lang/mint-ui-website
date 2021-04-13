/* The main store for the application. */
store Application {
  /* The documentation pages, in categories. */
  const DOCUMENTATION =
    [
      {
        "About",
        [
          {"Introduction", <Documentation.Introduction/>},
          {"When to use", <Documentation.WhenToUse/>},
          {"When not to use", <Documentation.WhenNotToUse/>},
          {"Installation", <Pages.Install/>}
        ]
      },
      {
        "Design System",
        [
          {"Surfaces", <Documentation.Surfaces/>},
          {"Sizing", <Documentation.Sizing/>},
          {"Adapting to screen size", <Documentation.AdaptingToScreenSize/>},
          {"Dark / Light mode", <Documentation.DarkLightMode/>},
          {"Theming", <Documentation.Theming/>}
        ]
      },
      {
        "Data",
        [
          {"Navigation", <Documentation.Navigation/>},
          {"List items", <Documentation.ListItems/>},
          {"Tabular data", <Documentation.TabularData/>},
          {"Tabs", <Documentation.Tabs/>}
        ]
      }
    ]
    |> Map.fromArray()

  /* The example pages with a title and subtitle. */
  const EXAMPLES =
    [
      {"Dashboard", {"A simple login page.", <Examples.Dashboard/>, "Dashboard.mint"}},
      {"User List", {"A page to display a list users with pagination.", <Examples.UserList/>, "UserList.mint"}},
      {"Login", {"A simple login page.", <Examples.Login/>, "Login.mint"}},
      {"Register", {"A simple registration page.", <Examples.Register/>, "Register.mint"}},
      {"Recover Password", {"A simple recover password page.", <Examples.RecoverPassword/>, "RecoverPassword.mint"}},
      {"Checkout", {"An e-commerce checkout page.", <Examples.Checkout/>, "Checkout.mint"}}
    ]
    |> Map.fromArray()

  /* The reference pages, in categories. */
  const COMPONENTS =
    [
      {
        "Controls",
        [
          {
            documentation = @documentation(Ui.ActionSheet),
            page = <Reference.ActionSheet/>,
            name = "Ui.ActionSheet"
          },
          {
            documentation = @documentation(Ui.Button),
            page = <Reference.Button/>,
            name = "Ui.Button"
          },
          {
            documentation = @documentation(Ui.ColorPanel),
            name = "Ui.ColorPanel",
            page = <Reference.ColorPanel/>
          },
          {
            documentation = @documentation(Ui.DarkModeToggle),
            name = "Ui.DarkModeToggle",
            page = <Reference.DarkModeToggle/>
          },
          {
            documentation = @documentation(Ui.Dropdown),
            name = "Ui.Dropdown",
            page = <Reference.Dropdown/>
          },
          {
            documentation = @documentation(Ui.Dropdown.Panel),
            name = "Ui.Dropdown.Panel",
            page = <Reference.Dropdown.Panel/>
          },
          {
            documentation = @documentation(Ui.FloatingButton),
            name = "Ui.FloatingButton",
            page = <Reference.FloatingButton/>
          },
          {
            documentation = @documentation(Ui.InteractiveList),
            name = "Ui.InteractiveList",
            page = <Reference.InteractiveList/>
          },
          {
            documentation = @documentation(Ui.InteractiveList.Item),
            name = "Ui.InteractiveList.Item",
            page = <Reference.InteractiveList.Item/>
          },
          {
            documentation = @documentation(Ui.Notifications),
            name = "Ui.Notifications",
            page = <Reference.Notifications/>
          },
          {
            documentation = @documentation(Ui.Modal.Base),
            name = "Ui.Modal.Base",
            page = <Reference.Modal.Base/>
          },
          {
            documentation = @documentation(Ui.Modal.Content),
            name = "Ui.Modal.Content",
            page = <Reference.Modal.Content/>
          },
          {
            documentation = @documentation(Ui.Modal),
            name = "Ui.Modal",
            page = <Reference.Modal/>
          },
          {
            documentation = @documentation(Ui.Pagination),
            name = "Ui.Pagination",
            page = <Reference.Pagination/>
          },
          {
            documentation = @documentation(Ui.Picker),
            name = "Ui.Picker",
            page = <Reference.Picker/>
          },
          {
            documentation = @documentation(Ui.ScrollPanel),
            name = "Ui.ScrollPanel",
            page = <Reference.ScrollPanel/>
          },
          {
            documentation = @documentation(Ui.ScrollToTop),
            name = "Ui.ScrollToTop",
            page = <Reference.ScrollToTop/>
          },
          {
            documentation = @documentation(Ui.Tabs),
            name = "Ui.Tabs",
            page = <Reference.Tabs/>
          }
        ]
      },
      {
        "Content",
        [
          {
            documentation = @documentation(Ui.Book),
            name = "Ui.Book",
            page = <Reference.Book/>
          },
          {
            documentation = @documentation(Ui.Box),
            name = "Ui.Box",
            page = <Reference.Box/>
          },
          {
            documentation = @documentation(Ui.Brand),
            name = "Ui.Brand",
            page = <Reference.Brand/>
          },
          {
            documentation = @documentation(Ui.Breadcrumbs),
            name = "Ui.Breadcrumbs",
            page = <Reference.Breadcrumbs/>
          },
          {
            documentation = @documentation(Ui.Card),
            name = "Ui.Card",
            page = <Reference.Card/>
          },
          {
            documentation = @documentation(Ui.Card.Image),
            name = "Ui.Card.Image",
            page = <Reference.Card.Image/>
          },
          {
            documentation = @documentation(Ui.Card.Container),
            name = "Ui.Card.Container",
            page = <Reference.Card.Container/>
          },
          {
            documentation = @documentation(Ui.Cell),
            name = "Ui.Cell",
            page = <Pages.Cell/>
          },
          {
            documentation = @documentation(Ui.Content),
            name = "Ui.Content",
            page = <Reference.Content/>
          },
          {
            documentation = @documentation(Ui.ContentHint),
            name = "Ui.ContentHint",
            page = <Reference.ContentHint/>
          },
          {
            documentation = @documentation(Ui.DefinitionList),
            name = "Ui.DefinitionList",
            page = <Reference.DefinitionList/>
          },
          {
            documentation = @documentation(Ui.Field),
            name = "Ui.Field",
            page = <Reference.Field/>
          },
          {
            documentation = @documentation(Ui.Footer),
            name = "Ui.Footer",
            page = <Reference.Footer/>
          },
          {
            documentation = @documentation(Ui.Grid),
            name = "Ui.Grid",
            page = <Reference.Grid/>
          },
          {
            documentation = @documentation(Ui.CircularProgress),
            name = "Ui.CircularProgress",
            page = <Reference.CircularProgress/>
          },
          {
            documentation = @documentation(Ui.Html),
            name = "Ui.Html",
            page = <Reference.Html/>
          },
          {
            documentation = @documentation(Ui.Icon),
            name = "Ui.Icon",
            page = <Reference.Icon/>
          },
          {
            documentation = @documentation(Ui.Image),
            name = "Ui.Image",
            page = <Reference.Image/>
          },
          {
            documentation = @documentation(Ui.IllustratedMessage),
            name = "Ui.IllustratedMessage",
            page = <Reference.IllustratedMessage/>
          },
          {
            documentation = @documentation(Ui.Header),
            name = "Ui.Header",
            page = <Reference.Header/>
          },
          {
            documentation = @documentation(Ui.Layout.Centered),
            name = "Ui.Layout.Centered",
            page = <Reference.Layout.Centered/>
          },
          {
            documentation = @documentation(Ui.Layout.Documentation),
            name = "Ui.Layout.Documentation",
            page = <Reference.Layout.Documentation/>
          },
          {
            documentation = @documentation(Ui.Layout.Website),
            name = "Ui.Layout.Website",
            page = <Reference.Layout.Website/>
          },
          {
            documentation = @documentation(Ui.Container),
            name = "Ui.Container",
            page = <Reference.Container/>
          },
          {
            documentation = @documentation(Ui.NavItem),
            name = "Ui.NavItem",
            page = <Reference.NavItem/>
          },
          {
            documentation = @documentation(Ui.NavItems),
            name = "Ui.NavItems",
            page = <Reference.NavItems/>
          },
          {
            documentation = @documentation(Ui.RelativeTime),
            name = "Ui.RelativeTime",
            page = <Reference.RelativeTime/>
          },
          {
            documentation = @documentation(Ui.Table),
            name = "Ui.Table",
            page = <Reference.Table/>
          }
        ]
      },
      {
        "Input",
        [
          {
            documentation = @documentation(Ui.Calendar),
            name = "Ui.Calendar",
            page = <Reference.Calendar/>
          },
          {
            documentation = @documentation(Ui.Checkbox),
            name = "Ui.Checkbox",
            page = <Reference.Checkbox/>
          },
          {
            documentation = @documentation(Ui.ColorPicker),
            name = "Ui.ColorPicker",
            page = <Reference.ColorPicker/>
          },
          {
            documentation = @documentation(Ui.DatePicker),
            name = "Ui.DatePicker",
            page = <Reference.DatePicker/>
          },
          {
            documentation = @documentation(Ui.FileInput),
            name = "Ui.FileInput",
            page = <Reference.FileInput/>
          },
          {
            documentation = @documentation(Ui.Input),
            name = "Ui.Input",
            page = <Reference.Input/>
          },
          {
            documentation = @documentation(Ui.Native.AutoComplete),
            name = "Ui.Native.AutoComplete",
            page = <Reference.Native.AutoComplete/>
          },
          {
            documentation = @documentation(Ui.Native.Select),
            name = "Ui.Native.Select",
            page = <Reference.Native.Select/>
          },
          {
            documentation = @documentation(Ui.Select),
            name = "Ui.Select",
            page = <Reference.Select/>
          },
          {
            documentation = @documentation(Ui.Slider),
            name = "Ui.Slider",
            page = <Reference.Slider/>
          },
          {
            documentation = @documentation(Ui.Textarea),
            name = "Ui.Textarea",
            page = <Reference.Textarea/>
          },
          {
            documentation = @documentation(Ui.Toggle),
            name = "Ui.Toggle",
            page = <Pages.Toggle/>
          }
        ]
      },
      {
        "Utilities",
        [
          {
            documentation = @documentation(Ui.AvoidFocus),
            name = "Ui.AvoidFocus",
            page = <Reference.AvoidFocus/>
          },
          {
            documentation = @documentation(Ui.FocusTrap),
            name = "Ui.FocusTrap",
            page = <Reference.FocusTrap/>
          },
          {
            documentation = @documentation(Ui.StickyPanel),
            name = "Ui.StickyPanel",
            page = <Reference.StickyPanel/>
          }
        ]
      }
    ]
    |> Map.fromArray()

  /* Component navigation items. */
  const COMPONENT_ITEMS =
    for (category, items of COMPONENTS) {
      Ui.NavItem::Group(
        label = category,
        iconBefore = <></>,
        iconAfter = <></>,
        items =
          for (comp of Array.sortBy((item : Component) { item.name }, items)) {
            Ui.NavItem::Link(
              iconBefore = <></>,
              iconAfter = <></>,
              label = comp.name,
              href = "/components/#{String.parameterize(comp.name)}",
              target = "")
          })
    }

  const DOCUMENTATION_ITEMS =
    for (category, items of DOCUMENTATION) {
      Ui.NavItem::Group(
        label = category,
        iconBefore = <></>,
        iconAfter = <></>,
        items =
          for (item of items) {
            Ui.NavItem::Link(
              iconBefore = <></>,
              iconAfter = <></>,
              label = item[0],
              href = "/documentation/#{String.parameterize(item[0])}",
              target = "")
          })
    }

  /* Represents the current page. */
  state page : Page = Page::Initial

  /* Sets the page to the given page. */
  fun setPage (page : Page) : Promise(Never, Void) {
    next { page = page }
  }

  /* Sets the page from a component key. */
  fun setComponentPage (key : String) : Promise(Never, Void) {
    try {
      comp =
        COMPONENTS
        |> Map.values
        |> Array.concat
        |> Array.find((item : Component) { String.parameterize(item.name) == key })

      case (comp) {
        Maybe::Just item => setPage(Page::Component(item))
        Maybe::Nothing => setPage(Page::NotFound)
      }
    }
  }

  /* Sets the page from a documentation page key. */
  fun setDocumentationPage (key : String) {
    try {
      page =
        for (item of Array.concat(Map.values(DOCUMENTATION))) {
          item
        } when {
          String.parameterize(item[0]) == key
        }[0]

      case (page) {
        Maybe::Just item => setPage(Page::Documentation(item[0], item[1]))
        Maybe::Nothing => setPage(Page::NotFound)
      }
    }
  }

  /* Sets the page from an example key. */
  fun setExamplePage (key : String) {
    try {
      page =
        for (name, item of EXAMPLES) {
          item
        } when {
          String.parameterize(name) == key
        }[0]

      case (page) {
        Maybe::Just item => setPage(Page::Example(item[0], item[1]))
        Maybe::Nothing => setPage(Page::NotFound)
      }
    }
  }
}
