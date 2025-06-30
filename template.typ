

#let heading_font = ("Noto Sans CJK JP", "Noto Sans CJK JP")
#let pagenum_font = "New Computer Modern Math"


#let rvsheet(body) = {
  set text(
    lang: "ja",
    size: 10.5pt,
  )

  set enum(
  spacing: 1.2em
  )

  set par(first-line-indent: 1em, leading: 1em)
  let heading_text(body) = {
  set text(
    weight: "bold",
    font: heading_font,
  )
  body
  }
  show heading: it => {
    heading_text(it)
    par(text(size: 0em, ""))
  }
  set heading(numbering: "1.1. ")
  set page(
    paper: "a4",
    margin: (top: 25mm, left: 25mm, right: 20mm, bottom: 20mm),
  )

  body
}