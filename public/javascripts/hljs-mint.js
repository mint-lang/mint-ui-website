hljs.registerLanguage('mint',() => {
  const MINT_CONTAINS = []
  const MINT_KEYWORDS = 'const global component store module fun state property next if else sequence parallel style record connect enum routes try catch case where when use for of true false then finally get exposing as decode encode'

   var XML_IDENT_RE = '[A-Za-z0-9\\._:-]+';
   var TAG_INTERNALS = {
    endsWithParent: true,
    illegal: /</,
    relevance: 0,
    contains: [
      {
        className: 'attr',
        begin: XML_IDENT_RE,
        relevance: 0
      },
      {
        begin: /=\s*/,
        relevance: 0,
        contains: [
          {
            endsParent: true,
            className: 'tag',
            begin: '\\{',
            end: '\\}',
            contains: MINT_CONTAINS
          },
          {
            endsParent: true,
            className: 'tag',
            begin: '<\\{',
            end: '\\}>',
            contains: MINT_CONTAINS
          },
          {
            endsParent: true,
            className: 'tag',
            begin: '\\[',
            end: '\\]',
            contains: MINT_CONTAINS
          },
          {
            className: 'string',
            endsParent: true,
            variants: [
              {begin: /"/, end: /"/},
              {begin: /'/, end: /'/}
            ]
          }
        ]
      }
    ]
  };

  MINT_CONTAINS.push(
    ...[
      hljs.COMMENT("/\\*", "\\*/"),
      {
        className: 'number',
        begin: "\\b\\d+(\\.\\d+)?",
        end: "\\B|\\b"
      },
      {
        className: 'string',
        begin: '"',
        end: '"'
      },
      {
        className: 'type',
        begin: "\\b[A-Z][A-Za-z0-9_]+",
        ends: "[^A-Za-z0-9]"
      },
      {
        className: 'tag',
        begin: '<{', end: '}>',
        contains: MINT_CONTAINS
      },
      {
        className: 'tag',
        begin: '</?', end: '/?>',
        contains: [
          {
            className: 'name', begin: /[^\/><\s]+/, relevance: 0
          },
          TAG_INTERNALS
        ]
      },
      {
        keywords: MINT_KEYWORDS,
        begin: 'style\\s+[a-zA-Z0-9-]+\\s*{',
        end: '}',
        contains: [
          {
            begin: '(?=[-a-zA-Z0-9]+\\s*:\\s*[^;]+)',
            end: ';',
            contains: [
              {
                begin: '[-a-zA-Z0-9]+\\s*',
                className: 'string',
                excludeEnd: true,
                end: ':',
              },
              {
                begin: '[^;]+',
                end: ';',
                excludeEnd: true,
                endsParent: true,
              },
            ]
          }
        ]
      }
   ])

  return {
    k: MINT_KEYWORDS,
    contains: MINT_CONTAINS
  }
})

hljs.configure({languages: ['mint']})
