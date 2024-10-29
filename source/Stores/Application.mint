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
      {
        "Dashboard",
        {"A simple login page.", <Examples.Dashboard/>, "Dashboard.mint"}
      },
      {
        "User List",
        {
          "A page to display a list users with pagination.",
          <Examples.UserList/>,
          "UserList.mint"
        }
      },
      {"Login", {"A simple login page.", <Examples.Login/>, "Login.mint"}},
      {
        "Register",
        {"A simple registration page.", <Examples.Register/>, "Register.mint"}
      },
      {
        "Recover Password",
        {
          "A simple recover password page.",
          <Examples.RecoverPassword/>,
          "RecoverPassword.mint"
        }
      },
      {
        "Checkout",
        {"An e-commerce checkout page.", <Examples.Checkout/>, "Checkout.mint"}
      }
    ]
    |> Map.fromArray()

  /* The reference pages, in categories. */
  const COMPONENTS =
    [
      {
        "Controls",
        [
          { name: "Ui.ActionSheet", page: <Reference.ActionSheet/> },
          { name: "Ui.Button", page: <Reference.Button/> },
          { name: "Ui.ColorPanel", page: <Reference.ColorPanel/> },
          { name: "Ui.DarkModeToggle", page: <Reference.DarkModeToggle/> },
          { name: "Ui.Dropdown", page: <Reference.Dropdown/> },
          { name: "Ui.Dropdown.Panel", page: <Reference.Dropdown.Panel/> },
          { name: "Ui.FloatingButton", page: <Reference.FloatingButton/> },
          { name: "Ui.ImageCrop", page: <Reference.ImageCrop/> },
          { name: "Ui.InteractiveList", page: <Reference.InteractiveList/> },
          {
            name: "Ui.InteractiveList.Item",
            page: <Reference.InteractiveList.Item/>
          },
          { name: "Ui.Notifications", page: <Reference.Notifications/> },
          { name: "Ui.Modal.Base", page: <Reference.Modal.Base/> },
          { name: "Ui.Modal.Content", page: <Reference.Modal.Content/> },
          { name: "Ui.Modal", page: <Reference.Modal/> },
          { name: "Ui.Pagination", page: <Reference.Pagination/> },
          { name: "Ui.Picker", page: <Reference.Picker/> },
          { name: "Ui.ScrollPanel", page: <Reference.ScrollPanel/> },
          { name: "Ui.ScrollToTop", page: <Reference.ScrollToTop/> },
          { name: "Ui.Tabs", page: <Reference.Tabs/> }
        ]
      },
      {
        "Content",
        [
          { name: "Ui.Book", page: <Reference.Book/> },
          { name: "Ui.Box", page: <Reference.Box/> },
          { name: "Ui.Brand", page: <Reference.Brand/> },
          { name: "Ui.Breadcrumbs", page: <Reference.Breadcrumbs/> },
          { name: "Ui.Card", page: <Reference.Card/> },
          { name: "Ui.Card.Image", page: <Reference.Card.Image/> },
          { name: "Ui.Card.Container", page: <Reference.Card.Container/> },
          { name: "Ui.Cell", page: <Pages.Cell/> },
          { name: "Ui.Content", page: <Reference.Content/> },
          { name: "Ui.ContentHint", page: <Reference.ContentHint/> },
          { name: "Ui.Column", page: <Reference.Column/> },
          { name: "Ui.DefinitionList", page: <Reference.DefinitionList/> },
          { name: "Ui.Field", page: <Reference.Field/> },
          { name: "Ui.Footer", page: <Reference.Footer/> },
          { name: "Ui.Grid", page: <Reference.Grid/> },
          { name: "Ui.CircularProgress", page: <Reference.CircularProgress/> },
          { name: "Ui.Html", page: <Reference.Html/> },
          { name: "Ui.Icon", page: <Reference.Icon/> },
          { name: "Ui.Image", page: <Reference.Image/> },
          { name: "Ui.IllustratedMessage", page: <Reference.IllustratedMessage/> },
          { name: "Ui.Header", page: <Reference.Header/> },
          { name: "Ui.Layout.Centered", page: <Reference.Layout.Centered/> },
          {
            name: "Ui.Layout.Documentation",
            page: <Reference.Layout.Documentation/>
          },
          { name: "Ui.Layout.Website", page: <Reference.Layout.Website/> },
          { name: "Ui.Container", page: <Reference.Container/> },
          { name: "Ui.NavItem", page: <Reference.NavItem/> },
          { name: "Ui.NavItems", page: <Reference.NavItems/> },
          { name: "Ui.RelativeTime", page: <Reference.RelativeTime/> },
          { name: "Ui.Row", page: <Reference.Row/> },
          { name: "Ui.Table", page: <Reference.Table/> }
        ]
      },
      {
        "Input",
        [
          { name: "Ui.Calendar", page: <Reference.Calendar/> },
          { name: "Ui.Checkbox", page: <Reference.Checkbox/> },
          { name: "Ui.ColorPicker", page: <Reference.ColorPicker/> },
          { name: "Ui.DatePicker", page: <Reference.DatePicker/> },
          { name: "Ui.FileInput", page: <Reference.FileInput/> },
          { name: "Ui.Input", page: <Reference.Input/> },
          {
            name: "Ui.Native.AutoComplete",
            page: <Reference.Native.AutoComplete/>
          },
          { name: "Ui.Native.Select", page: <Reference.Native.Select/> },
          { name: "Ui.Select", page: <Reference.Select/> },
          { name: "Ui.Slider", page: <Reference.Slider/> },
          { name: "Ui.Textarea", page: <Reference.Textarea/> },
          { name: "Ui.Toggle", page: <Pages.Toggle/> }
        ]
      },
      {
        "Utilities",
        [
          { name: "Ui.AvoidFocus", page: <Reference.AvoidFocus/> },
          { name: "Ui.FocusTrap", page: <Reference.FocusTrap/> },
          { name: "Ui.StickyPanel", page: <Reference.StickyPanel/> }
        ]
      }
    ]
    |> Map.fromArray()

  /* Component navigation items. */
  const COMPONENT_ITEMS =
    for category, items of COMPONENTS {
      Ui.NavItem.Group(
        label: category,
        iconBefore: <></>,
        iconAfter: <></>,
        items:
          for comp of Array.sortBy(items, (item : Component) { item.name }) {
            Ui.NavItem.Link(
              iconBefore: <></>,
              iconAfter: <></>,
              label: comp.name,
              href: "/components/#{String.parameterize(comp.name)}",
              target: "")
          })
    }

  const DOCUMENTATION_ITEMS =
    for category, items of DOCUMENTATION {
      Ui.NavItem.Group(
        label: category,
        iconBefore: <></>,
        iconAfter: <></>,
        items:
          for item of items {
            Ui.NavItem.Link(
              iconBefore: <></>,
              iconAfter: <></>,
              label: item[0],
              href: "/documentation/#{String.parameterize(item[0])}",
              target: "")
          })
    }

  /* Represents the current page. */
  state page : Page = Page.Initial

  /* Sets the title of the browser tab. */
  fun setTitle (page : Page) : Promise(Void) {
    let content =
      case page {
        Page.Documentation(name, item) => "/ Documentation / #{name}"
        Page.Component(item) => "/ Components / #{item.name}"
        Page.Example(name, item) => "/ Example / #{name}"
        Page.Examples => "/ Examples"
        Page.Pricing => "/ Pricing"

        => " - Beautiful, Reliable Components for Mint"
      }

    Window.setTitle("Mint UI #{content}")
  }

  /* Sets the page to the given page. */
  fun setPage (page : Page) : Promise(Void) {
    await setTitle(page)
    next { page: page }
  }

  /* Sets the page from a component key. */
  fun setComponentPage (key : String) : Promise(Void) {
    let comp =
      COMPONENTS
      |> Map.values
      |> Array.concat
      |> Array.find(
        (item : Component) { String.parameterize(item.name) == key })

    case comp {
      Just(item) => setPage(Page.Component(item))
      Nothing => setPage(Page.NotFound)
    }
  }

  /* Sets the page from a documentation page key. */
  fun setDocumentationPage (key : String) {
    let page =
      for item of Array.concat(Map.values(DOCUMENTATION)) {
        item
      } when {
        String.parameterize(item[0]) == key
      }[0]

    case page {
      Just(item) => setPage(Page.Documentation(item[0], item[1]))
      Nothing => setPage(Page.NotFound)
    }
  }

  /* Sets the page from an example key. */
  fun setExamplePage (key : String) {
    let page =
      for name, item of EXAMPLES {
        item
      } when {
        String.parameterize(name) == key
      }[0]

    case page {
      Just(item) => setPage(Page.Example(item[0], item[1]))
      Nothing => setPage(Page.NotFound)
    }
  }
}
