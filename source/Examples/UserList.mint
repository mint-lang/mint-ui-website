component Examples.UserList {
  state sortDirection : String = "desc"
  state sortBy : String = "name"
  state page : Number = 0

  const USERS =
    [
      {"Heather W Glover", "tad.konopels@hotmail.com", 52, "291 Catherine Drive, Hankinson, North Dakota(ND), 58041"},
      {"Elnora D Gaskill", "lance_reing@yahoo.com", 33, "1898 Stockert Hollow Road,Redmond, Washington(WA), 98052"},
      {"Jennifer K Castillo", "citlalli1990@yahoo.com", 43, "2707 Brown Avenue, Knoxville, Tennessee(TN), 37917"},
      {"Raymond D Farias", "elza19771978@yahoo.com", 48, "892 Windy Ridge Road, Fort Wayne, Indiana(IN), 46802"},
      {"George L Saenz", "shaniya_muell@hotmail.com", 58, "472 Fairfield Road Milwaukee, Wisconsin(WI), 53202"},
      {"David D Alexander", "351 Cooks Mine Road", 38, "351 Cooks Mine Road, Artesia, New Mexico(NM), 88210"},
      {"Domingo L Hucks", "adrianna_cri@hotmail.com", 49, "3957 Roguski Road, Monroe, Louisiana(LA), 71201"},
      {"Mark K Stanley", "estell1979@yahoo.com", 50, "914 Cody Ridge Road, Sweetwater, Oklahoma(OK), 73666"},
      {"Jared S Stanton", "cleora1995@yahoo.com", 45, "2061 Pike Street, San Diego, California(CA), 92111"},
      {"Nora J Armijo", "amir1982@gmail.com", 28, " 1755 Blue Spruce Lane, Brooklyn, Maryland(MD), 21225"},
      {"Biran bat Danieli", "BiranbatDanieli@robojeep.fr", 68, "1986 Benson Street New Richmond, WI 5183"},
      {"Kyle Lindo", "KyleLindo@politicalking.fr", 24, "R Forças Armadas 1081 7670-204 BROCHAS, Portugal"},
      {"Dita Delahoz", "DitaDelahoz@voiceburner.es", 35, "Avda. Rio Nalon, 5666 4267 Corvera de Asturias"},
      {"Nelmina", "Nelmina@novellocator.it", 40, "Piazza Trieste e Trento, 7075 12080-Pianfei CN"},
      {"William M Schneider", "akeem2008@yahoo.com", 45, "Lisbon Falls, Maine(ME), 04252"},
      {"Janet J Rangel", "helene1981@gmail.com", 49, "2770 Jadewood Drive"}
    ]

  fun render : Html {
    <Ui.Layout.Website
      alignContentToTop={true}
      maxWidth="100vw"
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
              iconBefore: Ui.Icons:DASHBOARD,
              iconAfter: <></>,
              href: "/examples/dashboard",
              label: "Dashboard",
              target: ""),
            Ui.NavItem::Link(
              iconBefore: Ui.Icons:PERSON,
              iconAfter: <></>,
              href: "/examples/user-list",
              label: "Users",
              target: ""),
            Ui.NavItem::Divider,
            Ui.NavItem::Link(
              iconBefore: Ui.Icons:SIGN_OUT,
              iconAfter: <></>,
              href: "/examples/login",
              label: "Logout",
              target: "")
          ]/>
      }
      content={
        <Ui.Box title=<{ "Users" }>>
          <p>"Here you can see all users of the system."</p>

          <{
            {
              let processedUsers =
                USERS
                |> Array.sortBy(
                  (user : Tuple(String, String, Number, String)) {
                    case (sortBy) {
                      "age" => Number.toString(user[2])
                      "address" => user[3]
                      "email" => user[1]
                      "name" => user[0]
                      => user[0]
                    }
                  })
                |> Array.reverseIf(sortDirection == "desc")
                |> Array.slice(page * 10, (page + 1) * 10)

              let rows =
                for (user of processedUsers) {
                  {
                    user[0],
                    [
                      Ui.Cell::String(user[0]),
                      Ui.Cell::Code(code: user[1], breakSpaces: false),
                      Ui.Cell::Number(user[2]),
                      Ui.Cell::String(user[3]),
                      Ui.Cell::HtmlItems(
                        breakOnMobile: true,
                        items:
                          [
                            <Ui.Icon
                              onClick={(event : Html.Event) { Ui.Notifications.notifyDefault(<{ "Edit" }>) }}
                              icon={Ui.Icons:PENCIL}
                              interactive={true}/>,
                            <Ui.Icon
                              onClick={(event : Html.Event) { Ui.Notifications.notifyDefault(<{ "Delete" }>) }}
                              icon={Ui.Icons:TRASHCAN}
                              interactive={true}/>,
                            <Ui.Icon
                              icon={Ui.Icons:DESKTOP_DOWNLOAD}
                              disabled={true}/>
                          ])
                    ]
                  }
                }

              <>
                <Ui.Table
                  orderDirection={sortDirection}
                  orderBy={sortBy}
                  onOrderChange={
                    (data : Tuple(String, String)) {
                      next
                        {
                          sortDirection: data[1],
                          sortBy: data[0]
                        }
                    }
                  }
                  headers=[
                    {
                      sortKey: "name",
                      sortable: true,
                      label: "Name",
                      shrink: false
                    },
                    {
                      sortKey: "email",
                      sortable: true,
                      label: "Email",
                      shrink: false
                    },
                    {
                      sortKey: "age",
                      sortable: true,
                      label: "Age",
                      shrink: false
                    },
                    {
                      sortKey: "address",
                      sortable: true,
                      label: "Address",
                      shrink: false
                    },
                    {
                      sortKey: "",
                      sortable: false,
                      label: "Actions",
                      shrink: true
                    }
                  ]
                  rows={rows}/>

                <p>
                  <Ui.Pagination
                    onChange={(page : Number) { next { page: page } }}
                    total={Array.size(USERS)}
                    size={Ui.Size::Em(0.75)}
                    page={page}/>
                </p>
              </>
            }
          }>
        </Ui.Box>
      }/>
  }
}
