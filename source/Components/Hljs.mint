component Hljs {
  connect Ui exposing { darkMode }

  property highlight : Array(Number) = []
  property language : String = "mint"
  property code : String = ""

  state content : Array(String) = []
  state open : Bool = !Ui.mobile

  fun componentDidMount {
    next { content: highlightedCode }
  }

  get highlightedCode {
    if language == "plain" {
      String.split(code, "\n")
    } else {
      `hljs.highlight(#{language}, #{code}, true).value`
      |> String.split("\n")
    }
  }

  fun componentDidUpdate {
    let nextContent =
      highlightedCode

    if nextContent != content {
      next { content: nextContent }
    } else {
      `null`
    }
  }

  get charCount {
    content
    |> Array.size()
    |> Number.toString()
    |> String.size()
  }

  style base {
    box-shadow: 0 0 0.625em var(--shadow-color);
    background: var(--content-color);
    color: var(--content--text);
    border-radius: 0.5em;
    display: grid;
  }

  style toolbar {
    justify-content: space-between;
    align-items: center;
    padding: 0.5em 1em;
    display: flex;

    if open {
      border-bottom: 1px solid var(--content-border);
    }

    strong {
      font-weight: bold;
      font-size: 0.75em;
    }
  }

  style reset {
    font-size: inherit;
    color: inherit;

    appearance: none;
    background: none;
    outline: none;

    padding: 0;
    border: 0;
    margin: 0;

    &:hover,
    &:focus {
      color: var(--primary-color);
      cursor: pointer;
    }
  }

  style nudge {
    position: relative;
    top: 1px;
  }

  style icon-label (gap : Number) {
    grid-auto-flow: column;
    grid-gap: #{gap}em;
    display: grid;

    span {
      font-weight: bold;
      font-size: 0.75em;
    }
  }

  style line (highlighted : Bool) {
    counter-increment: line-number;

    if highlighted && darkMode {
      background: #2C2C2C;
    } else if highlighted && !darkMode {
      background: #F9F9F9;
    }

    if highlighted {
      line-height: 1.6;
      opacity: 1;
    } else {
      opacity: var(--unhighlighted-opacity);
    }

    &::before {
      content: counter(line-number);

      width: calc(#{charCount}ch + 10px);
      border-right: 2px solid;
      display: inline-block;
      padding-right: 10px;
      margin-right: 15px;
      text-align: right;
      color: #999;

      if highlighted && darkMode {
        border-right-color: #222;
      } else if highlighted {
        border-right-color: #DDD;
      } else {
        border-right-color: var(--title-border);
      }
    }
  }

  style pre {
    counter-reset: line-number;
    font-family: monospace;
    line-height: 150%;
    overflow: auto;
    padding: 1em;
    color: #999;
    margin: 0;

    if Array.isEmpty(highlight) {
      --unhighlighted-opacity: 1;
    } else {
      --highlighted-background: #EEE;
      --unhighlighted-opacity: 0.5;
    }

    .hljs-doctag,
    .hljs-keyword,
    .hljs-formula {
      if darkMode {
        color: #d959ff;
      } else {
        color: #bc35e3;
      }
    }

    .hljs-attr,
    .hljs-variable,
    .hljs-template-variable,
    .hljs-type,
    .hljs-selector-class,
    .hljs-selector-attr,
    .hljs-selector-pseudo,
    .hljs-number {
      if darkMode {
        color: #59AFF2;
      } else {
        color: #1D8FE8;
      }
    }

    .hljs-string,
    .hljs-regexp,
    .hljs-addition,
    .hljs-attribute,
    .hljs-meta-string {
      if darkMode {
        color: #1CCE3A;
      } else {
        color: #26AE3D;
      }
    }

    .hljs-section,
    .hljs-name,
    .hljs-selector-tag,
    .hljs-deletion,
    .hljs-subst {
      font-weight: bold;

      if darkMode {
        color: #F4D352;
      } else {
        color: #D5841C;
      }
    }
  }

  fun render : Html {
    <div::base>
      <div::toolbar>
        <button::reset onClick={() { next { open: !open } }}>
          <div::icon-label(0.25)>
            <Ui.Icon
              icon={
                if open {
                  Ui.Icons:CHEVRON_DOWN
                } else {
                  Ui.Icons:CHEVRON_RIGHT
                }
              }/>

            <span>"SOURCE CODE"</span>
          </div>
        </button>

        <button::reset
          onClick={
            () {
              await Clipboard.set(code)
              Ui.Notifications.notifyDefault(<{ "Copied source code to the clipboard!" }>)
            }
          }>

          <div::icon-label(0.5)>
            <Ui.Icon icon={Ui.Icons:CLIPPY}/>
            <span::nudge>"COPY"</span>
          </div>

        </button>
      </div>

      if open {
        <pre::pre>
          <{
            Array.mapWithIndex(
              content,
              (line : String, index : Number) {
                <div::line(Array.contains(highlight, index)) dangerouslySetInnerHTML={`{__html: #{line}}`}/>
              })
          }>
        </pre>
      }
    </div>
  }
}
