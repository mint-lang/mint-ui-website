component Example {
  property size : Ui.Size = Ui.Size::Inherit
  property highlight : Array(Number) = []
  property horizontalSpacing : Number = 0
  property verticalSpacing : Number = 0
  property breakpoint : Number = 650
  property controlled : Bool = false
  property fullWidth : Bool = false
  property controls : Html = <></>

  property data : Tuple(Html, String)

  style warning {
    background: var(--warning-color);
    color: var(--warning-text);
    border-radius: 0.25em;
    display: grid;
    cursor: help;

    position: absolute;
    padding: 0.75em;
    left: 0.5em;
    top: 0.5em;

    &:hover::before {
      content: "Your interactions in this example won't cause any changes because the values are controlled.";

      background: rgba(0,0,0,0.85);
      border-radius: 0.5em;
      padding: 1em;

      font-weight: normal;
      font-size: 14px;
      color: #EEE;

      top: calc(100% + 0.5em);
      position: absolute;
      min-width: 250px;
      z-index: 100;
      left: 0;
    }
  }

  fun render {
    let highlightFunction =
      (code : String) {
        <Hljs
          highlight={highlight}
          code={code}/>
      }

    let warning =
      if controlled {
        <div::warning>
          <Ui.Icon icon={Ui.Icons:ALERT}/>
        </div>
      } else {
        <></>
      }

    <Ui.Example
      horizontalSpacing={horizontalSpacing}
      verticalSpacing={verticalSpacing}
      highlight={highlightFunction}
      breakpoint={breakpoint}
      fullWidth={fullWidth}
      controls={controls}
      warning={warning}
      data={data}
      size={size}/>
  }
}
